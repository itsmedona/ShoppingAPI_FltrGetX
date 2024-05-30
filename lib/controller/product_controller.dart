import 'package:get/get.dart';
import 'package:shop_api_fltr_gtx/model/product.dart';
import '../services/remote_services.dart';

class ProductController extends GetxController {
  var isLoading = true.obs;
  var productList = <Product>[].obs; // Proper initialization

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  void fetchProducts() async {
    try {
      isLoading(true);
      var products = await RemoteServices.fetchProducts();
      if (products != null) {
        productList.value = products;
      } else {
        // Handle null case if needed
        print('Failed to fetch products: No data returned');
      }
    } catch (e) {
      // Handle exceptions
      print('Failed to fetch products: $e');
    } finally {
      isLoading(false);
    }
  }
}
