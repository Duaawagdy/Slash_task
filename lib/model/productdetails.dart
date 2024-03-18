

import 'dart:convert';

ProductDetails productdetialsFromJson(String str) => ProductDetails.fromJson(json.decode(str));

String productdetialsToJson(ProductDetails data) => json.encode(data);

class ProductDetails {
  final int id;
  final String name;
  final String type;
  final String description;
  final int brandId;
  final int? bostaSizeId;
  final int productRating;
  final int estimatedDaysPreparing;
  final Count count;
  final SubCategory subCategory;
  final List<Variation> variations;
  final List<AvailableProperty> availableProperties;
  final String brandName;
  final String brandImage;

  ProductDetails({
    required this.id,
    required this.name,
    required this.type,
    required this.description,
    required this.brandId,
    required this.bostaSizeId,
    required this.productRating,
    required this.estimatedDaysPreparing,
    required this.count,
    required this.subCategory,
    required this.variations,
    required this.availableProperties,
    required this.brandName,
    required this.brandImage,
  });

  factory ProductDetails.fromJson(Map<String, dynamic> json) {
    return ProductDetails(
      id: json['id'],
      name: json['name'],
      type: json['type'],
      description: json['description'],
      brandId: json['brand_id'],
      bostaSizeId: json['bosta_size_id'],
      productRating: json['product_rating'],
      estimatedDaysPreparing: json['estimated_days_preparing'],
      count: Count.fromJson(json['_count']),
      subCategory: SubCategory.fromJson(json['subCategory']),
      variations: List<Variation>.from(json['variations'].map((v) => Variation.fromJson(v))),
      availableProperties: List<AvailableProperty>.from(json['avaiableProperties'].map((v) => AvailableProperty.fromJson(v))),
      brandName: json['brandName'],
      brandImage: json['brandImage'],
    );
  }
}

class Count {
  final int? productVariations;

  Count({required this.productVariations});

  factory Count.fromJson(Map<String, dynamic> json) {
    return Count(productVariations: json['ProductVariations']);
  }
}

class SubCategory {
  final int id;
  final String name;

  SubCategory({required this.id, required this.name});

  factory SubCategory.fromJson(Map<String, dynamic> json) {
    return SubCategory(id: json['id'], name: json['name']);
  }
}

class Variation {
  final int? id;
  final int ?price;
  final int ?quantity;
  final bool ?inStock;
  final List<ProductVarientImage>? productVarientImages;
  final List<ProductPropertiesValue> productPropertiesValues;
  final String? productStatus;
  final bool ?isDefault;
  final int? productVariationStatusId;

  Variation({
    required this.id,
    required this.price,
    required this.quantity,
    required this.inStock,
    required this.productVarientImages,
    required this.productPropertiesValues,
    required this.productStatus,
    required this.isDefault,
    required this.productVariationStatusId,
  });

  factory Variation.fromJson(Map<String, dynamic> json) {
    return Variation(
      id: json['id'],
      price: json['price'],
      quantity: json['quantity'],
      inStock: json['inStock'],
      productVarientImages: List<ProductVarientImage>.from(json['ProductVarientImages'].map((x) => ProductVarientImage.fromJson(x))),
      productPropertiesValues: List<ProductPropertiesValue>.from(json['productPropertiesValues'].map((x) => ProductPropertiesValue.fromJson(x))),
      productStatus: json['productStatus'],
      isDefault: json['isDefault'],
      productVariationStatusId: json['product_variation_status_id'],
    );
  }
}

class ProductPropertiesValue {
  final String? value;
  final Property? property;

  ProductPropertiesValue({required this.value, required this.property});

  factory ProductPropertiesValue.fromJson(Map<String, dynamic> json) {
    return ProductPropertiesValue(
      value: json['value'],
      property: propertyValues.map[json['property']],
    );
  }
}

class ProductVarientImage {
  final int? id;
  final String? imagePath;
  final int? productVarientId;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  ProductVarientImage({
    required this.id,
    required this.imagePath,
    required this.productVarientId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ProductVarientImage.fromJson(Map<String, dynamic> json) {
    return ProductVarientImage(
      id: json['id'],
      imagePath: json['image_path'],
      productVarientId: json['product_varient_id'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }
}

class AvailableProperty {
  final String property;
  final List<Value> values;

  AvailableProperty({required this.property, required this.values});

  factory AvailableProperty.fromJson(Map<String, dynamic> json) {
    return AvailableProperty(
      property: json['property'],
      values: List<Value>.from(json['values'].map((x) => Value.fromJson(x))),
    );
  }
}
class Value {
  String? value;
  int? id;

  Value({
    this.value,
    this.id,
  });

  factory Value.fromJson(Map<String, dynamic> json) => Value(
    value: json["value"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "value": value,
    "id": id,
  };
}

enum Property {
  COLOR,
  SIZE,
}

final propertyValues = EnumValues({
  'Color': Property.COLOR,
  'Size': Property.SIZE,
});

class EnumValues<T> {
  final Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
