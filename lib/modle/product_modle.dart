import 'dart:convert';

class ProductModle {
  int id;
  String name;
  SubCategory subCategory;
  String image;
  int price;
  int evaluation;
  int discount;

  ProductModle({
    required this.id,
    required this.name,
    required this.subCategory,
    required this.image,
    required this.price,
    required this.evaluation,
    required this.discount,
  });

  factory ProductModle.fromRawJson(String str) => ProductModle.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ProductModle.fromJson(Map<String, dynamic> json) => ProductModle(
    id: json["id"],
    name: json["name"],
    subCategory: SubCategory.fromJson(json["sub-category"]),
    image: json["image"],
    price: json["price"],
    evaluation: json["evaluation"],
    discount: json["discount"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "sub-category": subCategory.toJson(),
    "image": image,
    "price": price,
    "evaluation": evaluation,
    "discount": discount,
  };
}

class SubCategory {
  int id;
  String name;
  Category category;

  SubCategory({
    required this.id,
    required this.name,
    required this.category,
  });

  factory SubCategory.fromRawJson(String str) => SubCategory.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SubCategory.fromJson(Map<String, dynamic> json) => SubCategory(
    id: json["id"],
    name: json["name"],
    category: Category.fromJson(json["category"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "category": category.toJson(),
  };
}

class Category {
  int id;
  String name;

  Category({
    required this.id,
    required this.name,
  });

  factory Category.fromRawJson(String str) => Category.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}
