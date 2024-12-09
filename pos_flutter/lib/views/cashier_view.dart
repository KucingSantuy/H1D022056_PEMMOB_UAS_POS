import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos_flutter/controllers/cashier_controller.dart';

class CashierPage extends StatefulWidget {
  @override
  _CashierPageState createState() => _CashierPageState();
}

class _CashierPageState extends State<CashierPage> {
  @override
  void initState() {
    super.initState();
    // Memastikan controller Cashier hanya diinisialisasi sekali
    Get.put(CashierController());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Cashier")),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("User Name"), 
              accountEmail: Text("user@example.com"),
              currentAccountPicture: CircleAvatar(child: Icon(Icons.person)),
            ),
            ListTile(
              title: Text("Dashboard"),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/dashboard');
              },
            ),
            ListTile(
              title: Text("Kasir"),
              onTap: () {
                // Sudah di halaman Kasir, jadi tidak perlu navigasi
              },
            ),
            ListTile(
              title: Text("Logout"),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/login');
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Nama Produk'),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Harga'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Tambahkan produk ke daftar
              },
              child: Text('Tambah'),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: 10, // Ganti dengan jumlah produk yang ditambahkan
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text("Produk ${index + 1}"),
                    subtitle: Text("Harga: 10000"),
                  );
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Implementasikan penyelesaian transaksi
              },
              child: Text('Selesaikan Transaksi'),
            ),
          ],
        ),
      ),
    );
  }
}
