import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfileBankAccount {
	const ProfileBankAccount({
		required this.accountNumber,
		required this.accountName,
		required this.bankName,
	});

	final String accountNumber;
	final String accountName;
	final String bankName;
}

class ProfileBankAccountState {
	const ProfileBankAccountState({this.account});

	final ProfileBankAccount? account;

	bool get hasAccount => account != null;

	ProfileBankAccountState copyWith({ProfileBankAccount? account, bool clear = false}) {
		return ProfileBankAccountState(
			account: clear ? null : (account ?? this.account),
		);
	}
}

class ProfileBankAccountNotifier extends Notifier<ProfileBankAccountState> {
	@override
	ProfileBankAccountState build() => const ProfileBankAccountState();

	void saveAccount(ProfileBankAccount account) {
		state = state.copyWith(account: account);
	}

	void clearAccount() {
		state = state.copyWith(clear: true);
	}
}

final profileBankAccountProvider =
		NotifierProvider<ProfileBankAccountNotifier, ProfileBankAccountState>(
			ProfileBankAccountNotifier.new,
		);
