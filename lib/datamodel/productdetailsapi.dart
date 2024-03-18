import 'package:dio/dio.dart';
import 'package:slashtask/model/productdetails.dart';

class ProductData {
  final Dio dio;
  Map<dynamic, dynamic> productDetails={};
  ProductData(this.dio);

  Future<ProductDetails> fetchProductDetails(int id) async {
    try {
      String apiUrl = 'https://slash-backend.onrender.com/product/$id';
      final response = await dio.get(apiUrl);

      if (response.statusCode == 200) {
        Map<String, dynamic> responseData = response.data['data'];

        ProductDetails productDetails = ProductDetails.fromJson(responseData);




        return productDetails;
      } else {
        throw Exception('Failed to fetch data');
      }
    } catch (e) {
      print('Error fetching data: $e');
      rethrow;
    }
  }
}
