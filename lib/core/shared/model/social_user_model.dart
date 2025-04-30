class SocialUserModel {
  final String uId;
  final String name;
  final String email;
  final String phone;
  final String image;
  final String cover;
  final String bio;

  SocialUserModel({
    required this.uId,
    required this.name,
    required this.email,
    required this.phone,
    required this.image,
    required this.cover,
    required this.bio,
  });

  factory SocialUserModel.fromJson(Map<String, dynamic> json) {
    return SocialUserModel(
      uId: json['uId'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      image: json['image'],
      cover: json['cover'],
      bio: json['bio'],
    );
  }

  Map<String,dynamic>toMap()
  {
    return{
      'uId' : uId,
      'name' : name,
      'email' : email,
      'phone' : phone,
      'image' : image,
      'cover' : cover,
      'bio' : bio,
    };
  }
}
