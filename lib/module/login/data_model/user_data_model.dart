class UserDataModel {
  UserDataModel({
    this.id = 0,
    this.firstName = '',
    this.lastName = '',
    this.maidenName = '',
    this.age = 0,
    this.gender = '',
    this.email = '',
    this.phone = '',
    this.username = '',
    this.password = '',
    this.image = '',
    this.ip = '',
    this.address,
    this.macAddress = '',
    this.university = '',
    this.bank,

  });

  final int id;
  final String firstName;
  final String lastName;
  final String maidenName;
  final dynamic age;
  final String gender;
  final String email;
  final String phone;
  final String username;
  final String password;
  final String image;
  final String ip;
  final AddressModel? address;
  final String macAddress;
  final String university;
  final BankModel? bank;


  String get fullName => '$firstName $lastName $maidenName'.trim();

  factory UserDataModel.fromJson(Map<String, dynamic> data) {
    return UserDataModel(
      id: data['id'] ?? 0,
      firstName: data['firstName'] ?? '',
      lastName: data['lastName'] ?? '',
      maidenName: data['maidenName'] ?? '',
      age: data['age'] ?? 0,
      gender: data['gender'] ?? '',
      email: data['email'] ?? '',
      phone: data['phone'] ?? '',
      username: data['username'] ?? '',
      password: data['password'] ?? '',
      image: data['image'] ?? '',
      ip: data['ip'] ?? '',
      address: data['address'] != null ? AddressModel.fromJson(data['address']) : null,
      macAddress: data['macAddress'] ?? '',
      university: data['university'] ?? '',
      bank: data['bank'] != null ? BankModel.fromJson(data['bank']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'maidenName': maidenName,
      'age': age,
      'gender': gender,
      'email': email,
      'phone': phone,
      'username': username,
      'password': password,
      'image': image,
      'ip': ip,
      'address': address?.toJson(),
      'macAddress': macAddress,
      'university': university,
      'bank': bank?.toJson(),
    };
  }

  static List<UserDataModel> fromJsonList(List<dynamic> data) {
    return data.map((item) {
      return UserDataModel.fromJson(Map<String, dynamic>.from(item));
    }).toList();
  }

}
class AddressModel {
  AddressModel({
    this.address = '',
    this.city = '',
    this.state = '',
    this.stateCode = '',
    this.postalCode = '',
    this.country = '',
  });

  final String address;
  final String city;
  final String state;
  final String stateCode;
  final String postalCode;
  final String country;

  factory AddressModel.fromJson(Map<String, dynamic> json) => AddressModel(
    address: json['address'] ?? '',
    city: json['city'] ?? '',
    state: json['state'] ?? '',
    stateCode: json['stateCode'] ?? '',
    postalCode: json['postalCode'] ?? '',
    country: json['country'] ?? '',
  );

  Map<String, dynamic> toJson() => {
    'address': address,
    'city': city,
    'state': state,
    'stateCode': stateCode,
    'postalCode': postalCode,
    'country': country,
  };
}

class BankModel {
  BankModel({
    this.cardExpire = '',
    this.cardNumber = '',
    this.cardType = '',
    this.currency = '',
    this.iban = '',
  });

  final String cardExpire;
  final String cardNumber;
  final String cardType;
  final String currency;
  final String iban;

  factory BankModel.fromJson(Map<String, dynamic> json) => BankModel(
    cardExpire: json['cardExpire'] ?? '',
    cardNumber: json['cardNumber'] ?? '',
    cardType: json['cardType'] ?? '',
    currency: json['currency'] ?? '',
    iban: json['iban'] ?? '',
  );

  Map<String, dynamic> toJson() => {
    'cardExpire': cardExpire,
    'cardNumber': cardNumber,
    'cardType': cardType,
    'currency': currency,
    'iban': iban,
  };
}

