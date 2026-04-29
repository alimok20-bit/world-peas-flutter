import 'package:flutter/material.dart';
import 'products_screen.dart';
import 'package:provider/provider.dart';
import '../models/cart_model.dart';

class CategoriesScreen extends StatelessWidget {

  final List<Map<String, dynamic>> cartItems;

  const CategoriesScreen({super.key, required this.cartItems});

  @override
  Widget build(BuildContext context) {
    final categories = [
      {'name': 'Фрук и овощи', 'icon': Icons.local_florist, 'color': Colors.orange},
      {'name': 'Мя и птица', 'icon': Icons.set_meal, 'color': Colors.redAccent},
      {'name': 'Гото блюда', 'icon': Icons.restaurant, 'color': Colors.green},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Категории"),
      ),
      body: ListView.builder(
  itemCount: categories.length,
  itemBuilder: (context, index) {
    final category = categories[index];

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      child: ListTile(
        leading: Icon(
          category['icon'] as IconData,
          color: category['color'] as Color,
          size: 28,
        ),

        title: Text(
          category['name'] as String,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),

        trailing: const Icon(Icons.arrow_forward_ios, size: 16),

        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  ProductsScreen(
  categoryName: category['name'] as String,
  cartItems: cartItems,
),
            ),
          );
        },
      ),
    );
  },
),
    );
  }
}