class User {
  final String username;
  final String email;
  final String fullName;
  final String accessToken;
  final String? avatar;
  final String? phoneNumber;
  final String? address;

  User(
      {required this.username,
      required this.email,
      required this.fullName,
      required this.accessToken,
      this.avatar,
      this.phoneNumber,
      this.address});

  @override
  String toString() =>
      'User { username: $username, email: $email, fullName: $fullName }';
}
