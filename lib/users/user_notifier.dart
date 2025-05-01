import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/users/users.dart';

class UserNotifier extends StateNotifier<Users> {
  UserNotifier()
    : super(Users(email: '', password: '', username: '', conpassword: ''));

  void updateProfile({
    String? email,
    String? username,
    String? password,
    String? conpassword,
  }) {
    state = state.copyWith(
      email: email,
      username: username,
      password: password,
      conpassword: conpassword ?? state.conpassword,
    );
  }
}

final userProvider = StateNotifierProvider<UserNotifier, Users>((ref) {
  return UserNotifier();
});
