import 'package:flutter/material.dart';

import '../services/database_service.dart';
import 'products_screen.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  late final Future<List<Map<String, dynamic>>> _categoriesFuture;

  @override
  void initState() {
    super.initState();
    _categoriesFuture = DatabaseService.instance.getCategories();
  }

  IconData _iconFromName(String iconName) {
    switch (iconName) {
      case 'local_florist':
        return Icons.local_florist;
      case 'set_meal':
        return Icons.set_meal;
      case 'restaurant':
        return Icons.restaurant;
      case 'emoji_food_beverage':
        return Icons.emoji_food_beverage;
      case 'cake':
        return Icons.cake;
      case 'local_drink':
        return Icons.local_drink;
      default:
        return Icons.category;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Категории')),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: _categoriesFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return const Center(child: CircularProgressIndicator());
          }

          final categories = snapshot.data ?? [];
          if (categories.isEmpty) {
            return const Center(child: Text('Категории не найдены'));
          }

          return ListView.builder(
            itemCount: categories.length,
            itemBuilder: (context, index) {
              final category = categories[index];
              final iconName = category['icon'] as String;
              final colorValue = category['color'] as int;

              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                child: ListTile(
                  leading: Icon(
                    _iconFromName(iconName),
                    color: Color(colorValue),
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
                        builder: (context) => ProductsScreen(
                          categoryName: category['name'] as String,
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
