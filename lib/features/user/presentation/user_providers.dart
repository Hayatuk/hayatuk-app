import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hayatuk/core/api/api_exceptions.dart';
import 'package:hayatuk/features/auth/data/models/user.dart';
import 'package:hayatuk/features/auth/presentation/auth_providers.dart';
import 'package:hayatuk/features/user/data/user_repository.dart';

final userRepositoryProvider = Provider<UserRepository>((ref) {
  return UserRepository(api: ref.watch(apiClientProvider));
});

class UserState {
  final User? user;
  final bool isLoading;
  final String? error;
  final Map<String, String>? fieldErrors;

  const UserState({
    this.user,
    this.isLoading = false,
    this.error,
    this.fieldErrors,
  });

  UserState copyWith({
    User? user,
    bool? isLoading,
    String? error,
    Map<String, String>? fieldErrors,
    bool clearError = false,
    bool clearUser = false,
  }) {
    return UserState(
      user: clearUser ? null : (user ?? this.user),
      isLoading: isLoading ?? this.isLoading,
      error: clearError ? null : (error ?? this.error),
      fieldErrors: clearError ? null : (fieldErrors ?? this.fieldErrors),
    );
  }
}

class UserController extends Notifier<UserState> {
  late UserRepository _repo;

  @override
  UserState build() {
    _repo = ref.watch(userRepositoryProvider);
    return const UserState();
  }

  void setUser(User user) {
    state = state.copyWith(user: user, clearError: true);
  }

  void clearUser() {
    state = state.copyWith(clearUser: true, clearError: true);
  }

  Future<void> updateProfile({
    required String name,
    required String bloodType,
    required String phone,
  }) async {
    state = state.copyWith(isLoading: true, clearError: true);
    try {
      final user = await _repo.updateProfile(
        name: name,
        region: state.user!.region,
        bloodType: bloodType,
        phone: phone,
      );
      await ref.read(secureStorageProvider).saveUser(user.toJson());
      state = state.copyWith(user: user, isLoading: false);
    } on ValidationException catch (e) {
      state = state.copyWith(isLoading: false, fieldErrors: e.errors);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  Future<void> toggleDonorStatus(bool active) async {
    final previous = state.user;
    if (previous == null) return;

    state = state.copyWith(user: previous.copyWith(isDonorActive: active));

    try {
      final newValue = await _repo.toggleDonorStatus(active);
      final updated = previous.copyWith(isDonorActive: newValue);
      await ref.read(secureStorageProvider).saveUser(updated.toJson());
      state = state.copyWith(user: updated);
    } catch (e) {
      state = state.copyWith(user: previous, error: e.toString());
    }
  }

  Future<void> disableDonorStatusIfActive() async {
    if (state.user?.isDonorActive != true) return;
    await toggleDonorStatus(false);
  }

  Future<void> deleteAccount() async {
    state = state.copyWith(isLoading: true, clearError: true);
    try {
      await _repo.deleteAccount();
      state = state.copyWith(clearUser: true, isLoading: false);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  Future<void> updateLocation({
    required double lat,
    required double lng,
    String? region,
  }) async {
    try {
      await _repo.updateLocation(lat: lat, lng: lng);
      if (region != null && state.user?.region != region) {
        final updated = await _repo.updateProfile(
          name: state.user!.name,
          region: region,
          bloodType: state.user!.bloodType,
          phone: state.user!.phone,
        );
        await ref.read(secureStorageProvider).saveUser(updated.toJson());
        state = state.copyWith(user: updated);
      }
    } catch (_) {
      // Silent
    }
  }

  Future<void> updateFcmToken(String token) async {
    try {
      await _repo.updateFcmToken(token);
    } catch (_) {}
  }

  Future<void> clearFcmToken() async {
    try {
      await _repo.clearFcmToken();
    } catch (_) {}
  }

  Future<void> refreshUser() async {
    try {
      final user = await _repo.getMe();
      await ref.read(secureStorageProvider).saveUser(user.toJson());
      state = state.copyWith(user: user);
    } catch (_) {}
  }

  Future<bool> changePassword({
    required String currentPassword,
    required String newPassword,
  }) async {
    state = state.copyWith(isLoading: true, clearError: true);
    try {
      await _repo.changePassword(
        currentPassword: currentPassword,
        newPassword: newPassword,
      );
      state = state.copyWith(isLoading: false);
      return true;
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
      return false;
    }
  }

  Future<void> updateLang(String lang) async {
    try {
      await _repo.updateLang(lang);
    } catch (_) {}
  }
}

final userControllerProvider = NotifierProvider<UserController, UserState>(
  UserController.new,
);
