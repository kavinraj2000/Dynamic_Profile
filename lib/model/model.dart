class Profile {
  final String name;
  final String email;
  final String profile_picture;

  Profile({required this.name, required this.email, this.profile_picture = ''});

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
      name: json['name'],
      email: json['email'],
      profile_picture: json['profile_picture'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      ' profile_picture': profile_picture,
    };
  }
}
