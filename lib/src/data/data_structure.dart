class SensorsData {
  final String deviceID;
  final DateTime dataTime;
  final double dataTemp;
  final double dataHumi;

  SensorsData({
    required this.deviceID,
    required this.dataTime,
    required this.dataTemp,
    required this.dataHumi,
  });

  factory SensorsData.fromJson(Map<String, dynamic> json) {
    return SensorsData(
      deviceID: json['device_id'],
      dataTime: DateTime.parse(json['data_time']['\$date'].toString()),
      dataTemp: json['data_temp'],
      dataHumi: json['data_humi'],
    );
  }
}

class Device {
  final String id;
  final String deviceName;

  Device({
    required this.id,
    required this.deviceName
  });

  factory Device.fromJson(Map<String, dynamic> json) {
    return Device(
      id: json['id'], 
      deviceName: json['device_name']
    );
  }
}

class RecommendationDish {
  final String dishName;
  final List dishIngredients;
  final double weight;

  RecommendationDish({
    required this.dishName,
    required this.dishIngredients,
    required this.weight
  });

  factory RecommendationDish.fromJson(Map<String, dynamic> json) {
    return RecommendationDish(
      dishName: json['dish_name'],
      dishIngredients: json['dish_ingredients'],
      weight: json['weight']
    );
  }
}

class Dish {
  final String id;
  final String dishTypeID;
  final String dishName;
  final String dishImage;
  final List dishIngredients;

  Dish({
    required this.id,
    required this.dishTypeID,
    required this.dishName,
    required this.dishImage,
    required this.dishIngredients
  });

  factory Dish.fromJson(Map<String, dynamic> json) {
    return Dish(
      id: json['id'],
      dishTypeID: json['dishtype_id'],
      dishName: json['dish_name'],
      dishImage: json['dish_image'],
      dishIngredients: json['dish_ingredients']
    );
  }



}

class Ingredient {
  final String id;
  final String ingredientName;
  final String ingredientImage;

  Ingredient({
    required this.id,
    required this.ingredientName,
    required this.ingredientImage
  });

  factory Ingredient.fromJson(Map<String, dynamic> json) {
    return Ingredient(
      id: json['id'],
      ingredientName: json['ingredient_name'],
      ingredientImage: json['ingredient_image']
    );
  }
}

class DishType {
  final String id;
  final String typeName;

  DishType({
    required this.id,
    required this.typeName,
  });

  factory DishType.fromJson(Map<String, dynamic> json) {
    return DishType(
      id: json['id'],
      typeName: json['type_name']
    );
  }
}

class User {
  final String id;
  final String deviceID;
  final String userName;
  final String userEmail;
  final String password;
  final DateTime userBirthday;
  final String userGender;

  User({
    required this.id,
    required this.deviceID,
    required this.userEmail,
    required this.userName,
    required this.password,
    required this.userBirthday,
    required this.userGender
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      deviceID: json['device_id'],
      userName: json['user_name'],
      userEmail: json['user_email'],
      password: json['password'],
      userBirthday: json['user_birthday'],
      userGender: json['user_gender']
    );
  }
}

class Rating {
  final String userID;
  final String dishID;
  final int rating;

  Rating({
    required this.userID,
    required this.dishID,
    required this.rating
  });

  factory Rating.fromJson(Map<String, dynamic> json) {
    return Rating(
      userID: json['user_id'],
      dishID: json['dish_id'],
      rating: json['rating']
    );
  }

}

class IngredientInsideFridge {
  final String ingredientID;
  final String userID;
  final String foodManufacture;
  final DateTime foodPRD;
  final DateTime foodEXP;
  final double foodAmount;
  final String foodUnit;
  final bool foodOnFreezer;

  IngredientInsideFridge({
    required this.ingredientID,
    required this.userID,
    required this.foodManufacture,
    required this.foodPRD,
    required this.foodEXP,
    required this.foodAmount,
    required this.foodUnit,
    required this.foodOnFreezer
  });

  factory IngredientInsideFridge.fromJson(Map<String, dynamic> json) {
    return IngredientInsideFridge(
      ingredientID: json['ingredient_id'],
      userID: json['user_id'],
      foodManufacture: json['food_manufacture'],
      foodPRD: DateTime.parse(json['food_PRD']),
      foodEXP: DateTime.parse(json['food_EXP']),
      foodAmount: json['food_amount'],
      foodUnit: json['food_unit'],
      foodOnFreezer: json['food_onFreezer']
    );
  }
}

// Chua xem xet

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

class FoodQRCodeData {
  final String ingredientID;
  final String foodManufacture;
  final DateTime foodPRD;
  final DateTime foodEXP;
  final double foodAmount;
  final String foodUnit;

  FoodQRCodeData({
    required this.ingredientID,
    required this.foodManufacture,
    required this.foodPRD,
    required this.foodEXP,
    required this.foodAmount,
    required this.foodUnit,
  });

  factory FoodQRCodeData.fromJson(Map<String, dynamic> json) {
    return FoodQRCodeData(
      ingredientID: json['ingredient_id'],
      foodManufacture: json['food_manufacture'],
      foodPRD: DateTime.parse(json['food_PRD']),
      foodEXP: DateTime.parse(json['food_EXP']),
      foodAmount: json['food_amount'],
      foodUnit: json['food_unit'],
    );
  }
}

