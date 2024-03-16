class Product {
  int? id;
  String? name;

  String? description;
  int? brandId;
 Brands? brands;
  List<ProductVariation>? productVariations;

  dynamic sizeChart;
  int? notApprovedVariants;

  Product({
    this.id,
    this.name,

    this.description,

    this.brandId,

    this.brands,
    this.productVariations,

    this.sizeChart,
    this.notApprovedVariants,
  });}
class Brands {
  int? id;
  String? brandType;
  String? brandName;
  String? brandFacebookPageLink;
  String? brandInstagramPageLink;
  dynamic brandWebsiteLink;
  String? brandMobileNumber;
  String? brandEmailAddress;
  dynamic taxIdNumber;
  String? brandDescription;
  String? brandLogoImagePath;
  int? brandStatusId;
  dynamic brandStoreAddressId;
  int? brandCategoryId;
  dynamic deletedAt;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? brandSellerId;
  dynamic brandId;
  dynamic slashContractPath;
  int? brandRating;
  int? daysLimitToReturn;
  dynamic planId;

  Brands({
    this.id,
    this.brandType,
    this.brandName,
    this.brandFacebookPageLink,
    this.brandInstagramPageLink,
    this.brandWebsiteLink,
    this.brandMobileNumber,
    this.brandEmailAddress,
    this.taxIdNumber,
    this.brandDescription,
    this.brandLogoImagePath,
    this.brandStatusId,
    this.brandStoreAddressId,
    this.brandCategoryId,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
    this.brandSellerId,
    this.brandId,
    this.slashContractPath,
    this.brandRating,
    this.daysLimitToReturn,
    this.planId,
  });}

class ProductVariation {
  int? id;
  int? productId;
  int? price;
  int? quantity;
  dynamic warehouseId;
  bool? isDefault;
  DateTime? deletedAt;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? productVariationStatusId;
  dynamic acceptedBy;

  List<ProductVarientImage>? productVarientImages;

  ProductVariation({
    this.id,
    this.productId,
    this.price,
    this.quantity,
    this.warehouseId,
    this.isDefault,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
    this.productVariationStatusId,
    this.acceptedBy,

    this.productVarientImages,
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
