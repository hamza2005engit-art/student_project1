class User {
  final int id;
  final String name;
  final String phone;
  final String? token;

  User({required this.id, required this.name, required this.phone, this.token});
}