import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hayatuk/features/auth/presentation/auth_providers.dart';
import 'package:hayatuk/features/donation/data/donation_repository.dart';
import 'package:hayatuk/features/request/presentation/request_providers.dart';
import 'package:hayatuk/features/user/presentation/user_providers.dart';

final donationRepositoryProvider = Provider<DonationRepository>((ref) {
  return DonationRepository(api: ref.watch(apiClientProvider));
});

class DonationController extends Notifier<bool> {
  late DonationRepository _repo;

  @override
  bool build() {
    _repo = ref.watch(donationRepositoryProvider);
    return false; // not loading
  }

  /// Returns true on success, false on failure.
  Future<bool> record(String requestId) async {
    state = true;
    try {
      await _repo.recordDonation(requestId);
      // Refresh the donations list and user
      await ref.read(acceptancesControllerProvider.notifier).fetch();
      await ref.read(userControllerProvider.notifier).refreshUser();
      state = false;
      return true;
    } catch (_) {
      state = false;
      return false;
    }
  }
}

final donationControllerProvider = NotifierProvider<DonationController, bool>(
  DonationController.new,
);
