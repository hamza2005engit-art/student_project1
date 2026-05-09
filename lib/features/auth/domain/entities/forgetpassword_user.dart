class ForgetpasswordUser {
  final int id;
  final String email;
  final String ip;
  final String new_password;
  final String confirmed_password;

  final String? token;

  ForgetpasswordUser({
    required this.id,
    required this.email,
    required this.ip,
    required this.new_password,
    required this.confirmed_password,
    this.token
  });
}