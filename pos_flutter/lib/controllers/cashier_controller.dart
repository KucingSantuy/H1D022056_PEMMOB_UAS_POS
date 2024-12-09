import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/product_model.dart';

class CashierController extends GetxController {
  var products = <Product>[].obs; // Produk yang tersedia
  var selectedProducts = <Product>[].obs; // Produk yang dipilih oleh user
  var totalPrice = 0.0.obs; // Total harga produk yang dipilih

  // Fetch produk dari API
  Future<void> fetchProducts() async {
    try {
      final url = Uri.parse("http://localhost/pos_api/products.php");
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        products.value = data
            .map((item) =>
                Product(name: item['name'], price: double.parse(item['price'])))
            .toList();
      } else {
        Get.snackbar("Error", "Failed to fetch products.");
      }
    } catch (e) {
      Get.snackbar("Error", "An error occurred: $e");
    }
  }

  // Tambahkan produk ke daftar pilihan
  void addProduct(Product product) {
    selectedProducts.add(product);
    totalPrice.value += product.price;
  }

  // Selesaikan transaksi
  Future<void> completeTransaction() async {
    try {
      final url = Uri.parse("http://localhost/pos_api/transaction.php");
      final response = await http.post(url,
          body: jsonEncode({'total': totalPrice.value}),
          headers: {'Content-Type': 'application/json'});

      final result = jsonDecode(response.body);

      if (result['status'] == 'success') {
        selectedProducts.clear();
        totalPrice.value = 0.0;
        Get.snackbar("Success", "Transaction completed!");
      } else {
        Get.snackbar("Error", "Failed to complete transaction.");
      }
    } catch (e) {
      Get.snackbar("Error", "An error occurred: $e");
    }
  }
}
