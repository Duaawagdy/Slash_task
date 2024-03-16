import 'package:dio/dio.dart';
import 'package:slashtask/model/productdetails.dart';

class ProductData {
  final Dio dio;

  ProductData(this.dio);

  Future<List<Data>> fetchProductDetails(int id) async {
    try {
      String apiUrl = 'https://slash-backend.onrender.com/product/$id';
      final response = await dio.get(apiUrl);

      if (response.statusCode == 200) {
        Map<String, dynamic> responseData = response.data['data'];

        Data productDetails = Data(
          id: responseData['id'],
          name: responseData['name'],
          description: responseData['description'],
          brandName: responseData['brandName'],
          brandImage: responseData['brandImage'],
          variations: [],
          avaiableProperties: [],

        );

        // Parse variations
        List<dynamic> variations = responseData['variations'];
        for (var variationData in variations) {
          List<ProductVarientImage> productVarientImages = [];
          List<dynamic> images = variationData['ProductVarientImages'];
          images.forEach((image) {
            productVarientImages.add(ProductVarientImage(
              imagePath: image['image_path'],
            ));
          });
          List<ProductPropertiesValue> productPropertiesValue = [];
          List<dynamic> properties = variationData["productPropertiesValues"];
          properties.forEach((property) {
            productPropertiesValue.add(ProductPropertiesValue(
              value: property["value"],
              property: property["property"]
            ));
          });

          productDetails.variations!.add(Variation(
            id: variationData['id'],
            price: variationData['price'],
            quantity: variationData['quantity'],
            inStock: variationData['inStock'],
            productVarientImages: productVarientImages,
            productPropertiesValues: productPropertiesValue
          ));
        }

        // Parse available properties
        /*List<AvaiableProperty> availableProperties = responseData['avaiableProperties'];
        for (var property in availableProperties) {
          List<Value> values = [];
          List<Map<String, dynamic>> propertyValues = property.values;
          propertyValues.forEach((value) {
            values.add(Value(
              value: value['value'],
              id: value['id'],
            ));
          });

          productDetails.avaiableProperties!.add(AvaiableProperty(
            property: property['property'],
            values: values,
          ));
        }*/



        return [productDetails];
      } else {
        throw Exception('Failed to fetch data');
      }
    } catch (e) {
      print('Error fetching data: $e');
      return [];
    }
  }
}
