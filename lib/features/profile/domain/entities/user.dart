class MyUser {
  String? id;
  String? fullName;
  String? phone;
  String? address;
  int? age;
  String? email;
  String? password;
  String? gender;
  String? imageUrl;

  MyUser({
    this.id,
    required this.fullName,
    required this.phone,
    required this.address,
    required this.age,
    required this.email,
    required this.password,
    required this.gender,
    required this.imageUrl,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'fullName': fullName,
      'email': email,
      'password': password,
      'phone': phone,
      'age': age,
      'gender': gender,
      'address': address,
      'imageUrl': imageUrl,
    };
  }
}
