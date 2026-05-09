class RegisterUser {
  final int id;
  final String name;
  final String phone;
  final String location;
  final String subject;
  final String password;
  final String confermpassword;
  final String? token;

  RegisterUser({
    required this.id,
    required this.name,
    required this.phone,
    required this.location,
    required this.subject,
    required this.password,
    required this.confermpassword,
    this.token});
}