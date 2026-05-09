class FirstRegisterUser {
  final int id;
  final String role;
  final String persone_image;
  final String identity_image;
  final String? token;

  FirstRegisterUser({
    required this.id,
    required this.role,
    required this.persone_image,
    required this.identity_image,
    this.token
  });
}