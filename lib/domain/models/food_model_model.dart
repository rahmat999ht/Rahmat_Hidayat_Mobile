// ignore_for_file: public_member_api_docs, sort_constructors_first

class FoodModel {
  String? foodCode;
  String? name;
  String? picture;
  String? price;
  String? pictureOri;
  String? createdAt;
  int? id;

  FoodModel(
      {this.foodCode,
      this.name,
      this.picture,
      this.price,
      this.pictureOri,
      this.createdAt,
      this.id});

  factory FoodModel.add({
    String? foodCode,
    String? name,
    String? picture,
    String? price,
    String? pictureOri,
    String? createdAt,
  }) {
    return FoodModel(
      foodCode: foodCode,
      name: name,
      picture: picture,
      price: price,
      pictureOri: pictureOri,
      createdAt: createdAt,
    );
  }

  FoodModel.fromJson(Map<String, dynamic> json) {
    foodCode = json['food_code'] ?? "";
    name = json['name'] ?? "";
    picture = json['picture'];
    price = json['price'] ?? "";
    pictureOri = json['picture_ori'] ?? "";
    createdAt = json['created_at'] ?? "";
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    DateTime now = DateTime.now();
    String formattedTime = now.toString().substring(0, 26);
    final data = <String, dynamic>{};
    data['food_code'] = foodCode;
    data['name'] = name;
    data['picture'] = picture;
    data['price'] = price;
    data['picture_ori'] = "";
    data['created_at'] = formattedTime;
    data['id'] = id;
    return data;
  }

  @override
  bool operator ==(covariant FoodModel other) {
    if (identical(this, other)) return true;

    return other.foodCode == foodCode &&
        other.name == name &&
        other.picture == picture &&
        other.price == price &&
        other.pictureOri == pictureOri &&
        other.createdAt == createdAt &&
        other.id == id;
  }

  @override
  int get hashCode {
    return foodCode.hashCode ^
        name.hashCode ^
        picture.hashCode ^
        price.hashCode ^
        pictureOri.hashCode ^
        createdAt.hashCode ^
        id.hashCode;
  }
}
