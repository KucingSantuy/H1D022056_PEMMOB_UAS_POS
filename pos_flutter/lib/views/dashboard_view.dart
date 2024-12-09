import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:pos_flutter/controllers/dashboard_controller.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  void initState() {
    super.initState();
    // Memastikan controller Dashboard hanya diinisialisasi sekali
    Get.put(DashboardController());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Dashboard")),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            ListTile(
              title: Text("Dashboard"),
              onTap: () {
                // Implementasi navigasi ke dashboard
              },
            ),
            ListTile(
              title: Text("Kasir"),
              onTap: () {
                // Implementasi navigasi ke Kasir
              },
            ),
            ListTile(
              title: Text("Logout"),
              onTap: () {
                // Implementasi logout
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text("Ringkasan Penjualan"),
            SizedBox(height: 20),
            Expanded(
              child: LineChart(
                LineChartData(
                  gridData: FlGridData(show: true),
                  titlesData: FlTitlesData(show: true),
                  borderData: FlBorderData(show: true),
                  minX: 0,
                  maxX: 7,
                  minY: 0,
                  maxY: 6,
                  lineBarsData: [
                    LineChartBarData(spots: [
                      FlSpot(0, 1),
                      FlSpot(1, 2),
                      FlSpot(2, 1),
                    ])
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
