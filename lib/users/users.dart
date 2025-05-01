class Users {
  final String email;
  final String password;
  final String username;
  final String conpassword;

  Users({
    required this.email,
    required this.password,
    required this.username,
    required this.conpassword,
  });

  Users copyWith({
    String? email,
    String? password,
    String? username,
    String? conpassword,
  }) {
    return Users(
      email: email ?? this.email,
      password: password ?? this.password,
      username: username ?? this.username,
      conpassword: conpassword ?? this.conpassword,
    );
  }
}
