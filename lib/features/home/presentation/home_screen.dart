import 'package:flutter/material.dart';
import 'package:hayatuk/core/blood/blood_type.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hayatuk/core/location/fuzzy.dart';
import 'package:hayatuk/core/location/geocoding_service.dart';
import 'package:hayatuk/core/location/location_error_type.dart';
import 'package:hayatuk/core/location/location_exception.dart';
import 'package:hayatuk/core/location/location_service.dart';
import 'package:hayatuk/core/utils/date_format.dart';
import 'package:hayatuk/features/auth/data/models/user.dart';
import 'package:hayatuk/features/request/data/models/nearby_request.dart';
import 'package:hayatuk/features/request/presentation/request_providers.dart';
import 'package:hayatuk/features/user/presentation/user_providers.dart';
import 'package:hayatuk/l10n/generated/app_localizations.dart';
import 'package:latlong2/latlong.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final _locationService = LocationService();
  final _geocodingService = GeocodingService();
  final _mapController = MapController();

  bool _locationLoading = true;
  String? _locationError;
  LatLng? _donorPosition;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _fetchNearby());
  }

  Future<void> _fetchNearby() async {
    final l10n = AppLocalizations.of(context)!;
    setState(() {
      _locationLoading = true;
      _locationError = null;
    });

    try {
      final position = await _locationService.getCurrentPosition();
      final realLat = position.latitude;
      final realLng = position.longitude;

      // Real location for the map
      final donorPos = LatLng(position.latitude, position.longitude);

      // Fuzzed for any network call
      final fuzzyLat = fuzzyCoordinate(realLat);
      final fuzzyLng = fuzzyCoordinate(realLng);

      // Update server location + region in background
      _geocodingService
          .resolveRegion(position.latitude, position.longitude)
          .then((region) {
            if (!mounted) return;
            ref
                .read(userControllerProvider.notifier)
                .updateLocation(lat: fuzzyLat, lng: fuzzyLng, region: region);
          });

      await ref
          .read(nearbyRequestsControllerProvider.notifier)
          .fetch(lat: position.latitude, lng: position.longitude);

      ref.read(acceptancesControllerProvider.notifier).fetch();

      if (mounted) {
        setState(() {
          _donorPosition = donorPos;
          _locationLoading = false;
        });
        _mapController.move(donorPos, 12);
      }
    } on LocationException catch (e) {
      if (!mounted) return;
      setState(() {
        _locationError = switch (e.type) {
          LocationErrorType.servicesDisabled => l10n.locationServicesDisabled,
          LocationErrorType.permissionDenied => l10n.locationPermissionDenied,
          LocationErrorType.permissionDeniedForever =>
            l10n.locationPermissionDeniedForever,
          LocationErrorType.timeout => l10n.locationTimeout,
        };
        _locationLoading = false;
      });
    } catch (e) {
      if (mounted) {
        setState(() {
          _locationError = 'Failed to load nearby requests';
          _locationLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(userControllerProvider).user;
    final nearby = ref.watch(nearbyRequestsControllerProvider);

    return Scaffold(body: SafeArea(child: _buildBody(user!, nearby)));
  }

  Widget _buildBody(User user, NearbyRequestsState nearby) {
    final l10n = AppLocalizations.of(context)!;
    if (!user.isDonorActive) {
      return _DonorInactiveBanner();
    }

    if (_locationLoading && _donorPosition == null) {
      return const Center(child: CircularProgressIndicator());
    }

    if (_locationError != null && _donorPosition == null) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(_locationError!, textAlign: TextAlign.center),
              const SizedBox(height: 16),
              FilledButton(onPressed: _fetchNearby, child: Text(l10n.retry)),
            ],
          ),
        ),
      );
    }

    return Stack(
      children: [
        FlutterMap(
          mapController: _mapController,
          options: MapOptions(
            initialCenter: _donorPosition ?? const LatLng(36.7538, 3.0588),
            initialZoom: 12,
          ),
          children: [
            TileLayer(
              urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
              userAgentPackageName: 'io.github.hayatuk.hayatuk',
            ),
            MarkerLayer(
              markers: [
                ...nearby.requests.map(
                  (r) => Marker(
                    point: LatLng(r.lat, r.lng),
                    width: 30,
                    height: 30,
                    child: GestureDetector(
                      onTap: () => _showRequestSheet(r),
                      child: Container(
                        decoration: BoxDecoration(
                          color: r.productType == 'platelets'
                              ? Colors.amber.shade700
                              : Theme.of(context).colorScheme.primary,
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 2),
                        ),
                        child: Icon(
                          r.productType == 'platelets'
                              ? Icons.water_drop
                              : Icons.bloodtype,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        Positioned(
          right: 16,
          bottom: 32,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _MapButton(
                icon: Icons.refresh,
                isLoading: _locationLoading || nearby.isLoading,
                onTap: _fetchNearby,
              ),
              const SizedBox(height: 16),
              _MapButton(
                icon: Icons.add,
                onTap: () {
                  final z = _mapController.camera.zoom;
                  _mapController.move(_mapController.camera.center, z + 1);
                },
              ),
              const SizedBox(height: 8),
              _MapButton(
                icon: Icons.remove,
                onTap: () {
                  final z = _mapController.camera.zoom;
                  _mapController.move(_mapController.camera.center, z - 1);
                },
              ),
            ],
          ),
        ),
        // Attribution (OSM requires this)
        Positioned(
          bottom: 4,
          right: 4,
          child: Container(
            color: Colors.white.withValues(alpha: 0.8),
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
            child: const Text(
              '© OpenStreetMap',
              style: TextStyle(fontSize: 10),
            ),
          ),
        ),

        // No-results banner overlay
        if (nearby.requests.isEmpty && !nearby.isLoading)
          Positioned(
            top: 16,
            left: 16,
            right: 16,
            child: Card(
              color: Theme.of(context).colorScheme.surfaceContainerHighest,
              child: _EmptyBanner(user: user, ref: ref),
            ),
          ),
      ],
    );
  }

  void _showRequestSheet(NearbyRequest r) {
    final l10n = AppLocalizations.of(context)!;
    showModalBottomSheet(
      context: context,
      builder: (sheetContext) => Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: Theme.of(sheetContext).colorScheme.primary,
                  child: Text(
                    bloodTypeLabel(r.bloodType),
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        r.notes ?? l10n.bloodRequest,
                        style: Theme.of(sheetContext).textTheme.titleMedium,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        l10n.kmAway((r.distanceM / 1000).toStringAsFixed(1)),
                        style: Theme.of(sheetContext).textTheme.bodyMedium,
                      ),
                      Text(
                        l10n.donorsCount(r.unitsAccepted, r.unitsNeeded),
                        style: Theme.of(sheetContext).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            FilledButton(
              onPressed: () {
                Navigator.pop(sheetContext);
                context.push('/requests/${r.id}/detail');
              },
              child: Text(l10n.viewDetails),
            ),
          ],
        ),
      ),
    );
  }
}

class _DonorInactiveBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.bloodtype_outlined, size: 64),
            const SizedBox(height: 16),
            Text(
              l10n.donorModeOff,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 8),
            Text(l10n.donorModeOffHint, textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}

class _EmptyBanner extends ConsumerWidget {
  final User user;
  final WidgetRef ref;

  const _EmptyBanner({required this.user, required this.ref});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final acceptances = ref.watch(acceptancesControllerProvider);

    if (!acceptances.hasFetched) {
      return const SizedBox.shrink();
    }

    final cooldownEnd = _cooldownEnd(user.cooldownUntil);
    final pending = acceptances.requests
        .where((r) => r.donatedAt == null)
        .toList();

    String title;
    String body;

    if (cooldownEnd != null) {
      title = l10n.onCooldownTitle;
      body = l10n.onCooldownBody(formatDate(context, cooldownEnd));
    } else if (pending.isNotEmpty) {
      title = l10n.pendingDonationTitle;
      body = l10n.pendingDonationBody;
    } else {
      title = l10n.noNearbyRequests;
      body = l10n.noNearbyRequestsHint;
    }

    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(title, style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 4),
          Text(body),
        ],
      ),
    );
  }

  DateTime? _cooldownEnd(DateTime? cooldownUntil) {
    if (cooldownUntil == null) return null;
    return cooldownUntil.isAfter(DateTime.now()) ? cooldownUntil : null;
  }
}

class _MapButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  final bool isLoading;

  const _MapButton({
    required this.icon,
    required this.onTap,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      elevation: 2,
      shape: const CircleBorder(),
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: isLoading ? null : onTap,
        child: SizedBox(
          width: 44,
          height: 44,
          child: isLoading
              ? const Padding(
                  padding: EdgeInsets.all(12),
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: Colors.black87,
                  ),
                )
              : Icon(icon, color: Colors.black87),
        ),
      ),
    );
  }
}
