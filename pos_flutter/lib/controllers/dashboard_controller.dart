import 'package:get/get.dart';

class DashboardController extends GetxController {
  var totalSales = 0.0.obs;
  var totalTransactions = 0.obs;

  void updateDashboard(double saleAmount) {
    totalSales.value += saleAmount;
    totalTransactions.value++;
  }
}
