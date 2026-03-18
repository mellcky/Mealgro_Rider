import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mealgro_rider_app/features/auth/presentation/widgets/rider_type_toggle.dart';

// ── Auth State ────────────────────────────────────────────────────────────────

class AuthState {
  const AuthState({
    this.riderType = RiderType.mealgro,
    this.name = '',
    this.email = '',
    this.phone = '',
    this.companyName,
    this.registrationNumber,
    this.companyAddress,
  });

  final RiderType riderType;
  final String name;
  final String email;
  final String phone;
  final String? companyName;
  final String? registrationNumber;
  final String? companyAddress;

  AuthState copyWith({
    RiderType? riderType,
    String? name,
    String? email,
    String? phone,
    String? companyName,
    String? registrationNumber,
    String? companyAddress,
  }) {
    return AuthState(
      riderType: riderType ?? this.riderType,
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      companyName: companyName ?? this.companyName,
      registrationNumber: registrationNumber ?? this.registrationNumber,
      companyAddress: companyAddress ?? this.companyAddress,
    );
  }
}

// ── Auth Notifier ─────────────────────────────────────────────────────────────

class AuthNotifier extends Notifier<AuthState> {
  @override
  AuthState build() => const AuthState();

  void setRiderType(RiderType riderType) {
    state = state.copyWith(riderType: riderType);
  }

  void setRegistrationData({
    required String name,
    required String email,
    required String phone,
  }) {
    state = state.copyWith(name: name, email: email, phone: phone);
  }

  void setCompanyInfo({
    required String companyName,
    required String registrationNumber,
    required String companyAddress,
  }) {
    state = state.copyWith(
      companyName: companyName,
      registrationNumber: registrationNumber,
      companyAddress: companyAddress,
    );
  }
}

// ── Provider ──────────────────────────────────────────────────────────────────

final authProvider =
    NotifierProvider<AuthNotifier, AuthState>(AuthNotifier.new);
