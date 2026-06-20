import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hayatuk/features/auth/presentation/auth_providers.dart';
import 'package:hayatuk/features/request/data/models/accepted_request.dart';
import 'package:hayatuk/features/request/data/models/blood_request.dart';
import 'package:hayatuk/features/request/data/models/create_request_input.dart';
import 'package:hayatuk/features/request/data/models/nearby_request.dart';
import 'package:hayatuk/features/request/data/request_repository.dart';

final requestRepositoryProvider = Provider<RequestRepository>((ref) {
  return RequestRepository(api: ref.watch(apiClientProvider));
});

final requestDetailProvider = FutureProvider.autoDispose
    .family<BloodRequest, String>((ref, id) async {
      final repo = ref.watch(requestRepositoryProvider);
      return repo.getPublicById(id);
    });

class RequestsState {
  final List<BloodRequest> requests;
  final bool isLoading;
  final String? error;

  const RequestsState({
    this.requests = const [],
    this.isLoading = false,
    this.error,
  });

  RequestsState copyWith({
    List<BloodRequest>? requests,
    bool? isLoading,
    String? error,
    bool clearError = false,
  }) {
    return RequestsState(
      requests: requests ?? this.requests,
      isLoading: isLoading ?? this.isLoading,
      error: clearError ? null : (error ?? this.error),
    );
  }
}

class RequestsController extends Notifier<RequestsState> {
  late RequestRepository _repo;

  @override
  RequestsState build() {
    _repo = ref.watch(requestRepositoryProvider);
    return const RequestsState();
  }

  Future<void> fetch() async {
    state = state.copyWith(isLoading: true, clearError: true);
    try {
      final list = await _repo.listMine();
      state = state.copyWith(requests: list, isLoading: false);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  Future<BloodRequest?> create(CreateRequestInput input) async {
    state = state.copyWith(isLoading: true, clearError: true);
    try {
      final newRequest = await _repo.create(input);
      state = state.copyWith(
        requests: [newRequest, ...state.requests],
        isLoading: false,
      );
      return newRequest;
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
      return null;
    }
  }

  Future<bool> cancel(String id) async {
    try {
      await _repo.cancel(id);
      state = state.copyWith(
        requests: state.requests.map((r) {
          return r.id == id ? r.copyWith(status: 'cancelled') : r;
        }).toList(),
      );
      return true;
    } catch (e) {
      state = state.copyWith(error: e.toString());
      return false;
    }
  }
}

final requestsControllerProvider =
    NotifierProvider<RequestsController, RequestsState>(RequestsController.new);

class NearbyRequestsState {
  final List<NearbyRequest> requests;
  final bool isLoading;
  final String? error;

  const NearbyRequestsState({
    this.requests = const [],
    this.isLoading = false,
    this.error,
  });

  NearbyRequestsState copyWith({
    List<NearbyRequest>? requests,
    bool? isLoading,
    String? error,
    bool clearError = false,
  }) {
    return NearbyRequestsState(
      requests: requests ?? this.requests,
      isLoading: isLoading ?? this.isLoading,
      error: clearError ? null : (error ?? this.error),
    );
  }
}

class NearbyRequestsController extends Notifier<NearbyRequestsState> {
  late RequestRepository _repo;

  @override
  NearbyRequestsState build() {
    _repo = ref.watch(requestRepositoryProvider);
    return const NearbyRequestsState();
  }

  Future<void> fetch({required double lat, required double lng}) async {
    state = state.copyWith(isLoading: true, clearError: true);
    try {
      final list = await _repo.listNearby(lat: lat, lng: lng);
      state = state.copyWith(requests: list, isLoading: false);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  Future<bool> accept(String requestId) async {
    try {
      await _repo.accept(requestId);
      state = state.copyWith(requests: []);
      return true;
    } catch (e) {
      state = state.copyWith(error: e.toString());
      return false;
    }
  }
}

final nearbyRequestsControllerProvider =
    NotifierProvider<NearbyRequestsController, NearbyRequestsState>(
      NearbyRequestsController.new,
    );

class AcceptancesState {
  final List<AcceptedRequest> requests;
  final bool isLoading;
  final bool hasFetched;
  final String? error;

  const AcceptancesState({
    this.requests = const [],
    this.isLoading = false,
    this.hasFetched = false,
    this.error,
  });

  AcceptancesState copyWith({
    List<AcceptedRequest>? requests,
    bool? isLoading,
    bool? hasFetched,
    String? error,
    bool clearError = false,
  }) {
    return AcceptancesState(
      requests: requests ?? this.requests,
      isLoading: isLoading ?? this.isLoading,
      hasFetched: hasFetched ?? this.hasFetched,
      error: clearError ? null : (error ?? this.error),
    );
  }
}

class AcceptancesController extends Notifier<AcceptancesState> {
  late RequestRepository _repo;

  @override
  AcceptancesState build() {
    _repo = ref.watch(requestRepositoryProvider);
    return const AcceptancesState();
  }

  Future<void> fetch() async {
    state = state.copyWith(isLoading: true, clearError: true);
    try {
      final list = await _repo.listMyAcceptances();
      state = state.copyWith(
        requests: list,
        isLoading: false,
        hasFetched: true,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: e.toString(),
        hasFetched: true,
      );
    }
  }
}

final acceptancesControllerProvider =
    NotifierProvider<AcceptancesController, AcceptancesState>(
      AcceptancesController.new,
    );
