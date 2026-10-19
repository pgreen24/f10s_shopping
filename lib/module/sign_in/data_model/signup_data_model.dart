class SignupDataModel {
  SignupDataModel({
    this.id = 0,
    this.username = '',
    this.email = '',
    this.firstName = '',
    this.lastName = '',
    this.maidenName = '',
    this.age = 0,
    this.gender = '',

  });

  final int id;
  final String username;
  final String email;
  final String firstName;
  final String lastName;
  final String maidenName;
  final dynamic age;
  final String gender;

  String get fullName => '$firstName $lastName $maidenName';

  factory SignupDataModel.fromJson(Map<String, dynamic> data) {
    return SignupDataModel(
      id: data['id'] ?? 0,
      username: data['username'] ?? '',
      email: data['email'] ?? '',
      firstName: data['firstName'] ?? '',
      lastName: data['lastName'] ?? '',
      maidenName: data['maidenName'] ?? '',
      gender: data['gender'] ?? '',
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
      'age': age,
    };
  }

  static List<SignupDataModel> fromJsonList(List<dynamic> data) {
    return data.map((item) {
      return SignupDataModel.fromJson(
        Map<String, dynamic>.from(item),
      );
    }).toList();
  }
}