class Data {
  int? id;
  String? name;
  String? type;
  String? description;
  int? brandId;
  dynamic bostaSizeId;
  int? productRating;
  int? estimatedDaysPreparing;
  Count? count;
  dynamic sizeChart;
  //SubCategory? subCategory;
  List<Variation>? variations;
  List<AvaiableProperty>? avaiableProperties;
  String? brandName;
  String? brandImage;

  Data({
    this.id,
    this.name,
    this.type,
    this.description,
    this.brandId,
    this.bostaSizeId,
    this.productRating,
    this.estimatedDaysPreparing,
    this.count,
    this.sizeChart,
    //this.subCategory,
    this.variations,
    this.avaiableProperties,
    this.brandName,
    this.brandImage,
  });}
  class AvaiableProperty {
  String? property;
  List<Value>? values;

  AvaiableProperty({
  this.property,
  this.values,
  });
  Value operator [](int index) {
    return values![index];
  }
}
class Value {
  String? value;
  int? id;

  Value({
    this.value,
    this.id,
  });}
class Count {
  int? productVariations;

  Count({
    this.productVariations,
  });}
class Variation {
  int? id;
  int? price;
  int? quantity;
  bool? inStock;
  List<ProductVarientImage>? productVarientImages;
  List<ProductPropertiesValue> productPropertiesValues;
  String? productStatus;
  bool? isDefault;
  int? productVariationStatusId;

  Variation({
    this.id,
    this.price,
    this.quantity,
    this.inStock,
    this.productVarientImages,
    required this.productPropertiesValues,
    this.productStatus,
    this.isDefault,
    this.productVariationStatusId,
  });}
class ProductPropertiesValue {
  String? value;
  String? property;

  ProductPropertiesValue({
    this.value,
    this.property,
  });}
class ProductVarientImage {
  int? id;
  String? imagePath;
  int? productVarientId;
  DateTime? createdAt;
  DateTime? updatedAt;

  ProductVarientImage({
    this.id,
    this.imagePath,
    this.productVarientId,
    this.createdAt,
    this.updatedAt,
  });}