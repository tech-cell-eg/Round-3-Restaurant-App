class User {
  final String id, name, email;
  final String? bio, phone, avatar;

  User({
    required this.id,
    required this.name,
    required this.email,
    this.bio,
    this.phone,
    this.avatar,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json['id'],
    bio: json['bio'],
    name: json['name'],
    email: json['email'],
    phone: json['phone'],
    avatar: json['avatar'],
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'bio': bio,
    'name': name,
    'email': email,
    'phone': phone,
    'avatar': avatar,
  };
  @override
  String toString() =>
      'User{id: $id, name: $name, email: $email, bio: $bio, phone: $phone}';
}
