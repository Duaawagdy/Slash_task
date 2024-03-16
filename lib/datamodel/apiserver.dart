import 'package:dio/dio.dart';
import 'package:slashtask/model/product.dart';


class FetchData {
  final Dio dio;

  FetchData(this.dio);

  Future<List<Product>> fetchAllProducts() async {
    try {
      String apiUrl = 'https://slash-backend.onrender.com/product';
      final response = await dio.get(apiUrl);
      if (response.statusCode == 200) {
        List<Product> productList = [];
        List<dynamic> data = response.data['data'];
        for (var productData in data) {
          Product product = Product(
            id: productData["id"],
            name: productData["name"],
            brands: Brands(
              brandName: productData["Brands"]["brand_name"],
              brandLogoImagePath: productData["Brands"]["brand_logo_image_path"],
            ),
            productVariations: [],
          );

          List<dynamic> productVariations = productData["ProductVariations"];
          for (var variation in productVariations) {
            product.productVariations?.add(
              ProductVariation(
                price: variation["price"],
                productVarientImages: variation["ProductVarientImages"]
                    .map<ProductVarientImage>((image) => ProductVarientImage(
                  imagePath: image["image_path"],
                ))
                    .toList(),
              ),
            );
          }

          productList.add(product);

        }
        return productList;

      } else {
        throw Exception('Failed to fetch data');
      }
    } catch (e) {
      print('Error fetching data: $e');
      return [];
    }
  }

}













