import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginController extends GetxController {
  var username = ''.obs;
  var password = ''.obs;
  var errorMessage = ''.obs;

  Future<void> login() async {
    final url = Uri.parse("http://localhost/pos_api/login.php");
    final response = await http.post(url, body: jsonEncode({
      'username': username.value,
      'password': password.value,
    }), headers: {
      'Content-Type': 'application/json',
    });

    final result = jsonDecode(response.body);

    if (result['status'] == 'success') {
      Get.offNamed('/dashboard');
    } else {
      errorMessage.value = result['message'];
    }
  }
}
