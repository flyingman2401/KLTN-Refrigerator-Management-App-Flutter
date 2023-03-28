class SensorsData {
  final String temp;
  final String humi;

  SensorsData({
    required this.temp,
    required this.humi,
  });

  factory SensorsData.fromJson(Map<String, dynamic> json) {
    return SensorsData(
      temp: json['temp'],
      humi: json['humi'],
    );
  }
}

class LoginResponseData {
  final String token;

  LoginResponseData({
    required this.token
  });

  factory LoginResponseData.fromJson(Map<String, dynamic> json) {
    return LoginResponseData(
      token: json['token']
    );
  }
}

class UserInformation {
  final String name;
  final String age;
  final String gender;

  UserInformation({
    required this.name,
    required this.age,
    required this.gender
  });

  factory UserInformation.fromJson(Map<String, dynamic> json) {
    return UserInformation(
      name: json['name'], 
      age: json['age'], 
      gender: json['gender']
    );
  }
}