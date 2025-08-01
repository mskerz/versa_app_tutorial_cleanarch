import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String uid;
  final String email;
  final String phoneNumber;
  final String password;
  final String firstName;
  final String lastName;
  final int age;
  final String gender;
  final String image;

  const User({
    this.uid = '',
    this.email = '',
    this.phoneNumber='',
    this.password = '',
    this.firstName = '',
    this.lastName = '',
    this.age = 1,
    this.gender = '',
    this.image = 'https://static.vecteezy.com/system/resources/previews/001/840/612/non_2x/picture-profile-icon-male-icon-human-or-people-sign-and-symbol-free-vector.jpg'  });

  @override
  List<Object?> get props => [
        uid,
        email,
        phoneNumber,
        password,
        firstName,
        lastName,
        gender,
        image,
        age,
      ];

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'uid': uid,
      'email': email,
      'phoneNumber': phoneNumber,
      'password': password,
      'firstName': firstName,
      'lastName': lastName,
      'gender': gender,
      'image': image,
      'age': age,
    };
  }

  factory User.fromJson(Map<String, dynamic> map) {
    final userMap = map['user'] ?? map;

    return User(
      uid: userMap['uid'] ?? '',      
      email: userMap['email'] ?? '',
      phoneNumber: userMap['phoneNumber'],
      password: userMap['password'] ?? '',
      firstName: userMap['firstname'] ?? '',
      lastName: userMap['lastname'] ?? '',
      gender: userMap['gender'] ?? '',
      image: userMap['image'] ?? '',
      age: userMap['age'] ?? 1,
    );
  }

  User copyWith({
    String? uid,
    String? email,
    String? phoneNumber,
    String? username,
    String? password,
    String? firstName,
    String? lastName,
    int? age,
    String? gender,
    String? image,
  }) {
    return User(
      uid: uid ?? this.uid,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
   password: password ?? this.password,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      age: age ?? this.age,
      gender: gender ?? this.gender,
      image: image ?? this.image,
   );
  }
}
