class UserDataModel {
  UserDataModel({
    this.id = 0,
    this.username = '',
    this.email = '',
    this.firstName = '',
    this.lastName = '',
    this.maidenName = '',
    this.age = 0,
    this.gender = '',
    this.image = '',
  });

  final int id;
  final String username;
  final String email;
  final String firstName;
  final String lastName;
  final String maidenName;
  final dynamic age;
  final String gender;
  final String image;

  String get fullName => '$firstName $lastName $maidenName';

  factory UserDataModel.fromJson(Map<String, dynamic> data) {
    return UserDataModel(
      id: data['id'] ?? 0,
      username: data['username'] ?? '',
      email: data['email'] ?? '',
      firstName: data['firstName'] ?? '',
      lastName: data['lastName'] ?? '',
      maidenName: data['maidenName'] ?? '',
      gender: data['gender'] ?? '',
      image: data['image'] ?? '',
      age: data['age'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
      'maidenName': maidenName,
      'gender': gender,
      'image': image,
      'age': age,
    };
  }

  static List<UserDataModel> fromJsonList(List<dynamic> data) {
    return data.map((item) {
      return UserDataModel.fromJson(
        Map<String, dynamic>.from(item),
      );
    }).toList();
  }
}
