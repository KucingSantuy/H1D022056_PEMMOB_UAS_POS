import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          ListTile(
            title: const Text("Dashboard"),
            onTap: () => Get.toNamed('/dashboard'),
          ),
          ListTile(
            title: const Text("Kasir"),
            onTap: () => Get.toNamed('/cashier'),
          ),
          ListTile(
            title: const Text("Logout"),
            onTap: () => Get.offAllNamed('/login'),
          ),
        ],
      ),
    );
  }
}
