import 'package:flutter/material.dart';
import 'cart_screen.dart';
import 'package:provider/provider.dart';
import '../models/cart_model.dart';

class ProductsScreen extends StatefulWidget {

  final String categoryName;
  final List<Map<String, dynamic>> cartItems;

  const ProductsScreen({
    super.key,
    required this.categoryName,
    required this.cartItems,
  });

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> products;

    

    if (widget.categoryName == 'Фрукты и овощи') {
      products = [
        {'name': 'Яблоко', 'price': 3500, 'color': Colors.redAccent},
        {'name': 'Банан', 'price': 1500, 'color': Colors.yellow},
        {'name': 'Морковь', 'price': 1000, 'color': Colors.orange},
        {'name': 'Томат', 'price': 2500, 'color': Colors.red},
      ];
    } else if (widget.categoryName == 'Мясо и птица') {
      products = [
        {'name': 'Курица', 'price': 5000, 'color': Colors.brown},
        {'name': 'Говядина', 'price': 6000, 'color': Colors.redAccent},
        {'name': 'Свинина', 'price': 5000, 'color': Colors.orange},
        {'name': 'Баранина', 'price': 7000, 'color': Colors.deepOrange},
      ];
    } else if (widget.categoryName == 'Готовые блюда') {
      products = [
        {'name': 'Пицца', 'price': 3000, 'color': Colors.orange},
        {'name': 'Бургер', 'price': 2500, 'color': Colors.brown},
        {'name': 'Паста', 'price': 2000, 'color': Colors.yellow},
        {'name': 'Салат', 'price': 3000, 'color': Colors.green},
      ];
    } else {
      products = [];
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.categoryName),
        actions: [
  Consumer<CartModel>(
    builder: (context, cart, child) {
      return Stack(
        children: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CartScreen(),
                ),
              );
            },
          ),
          if (cart.items.isNotEmpty)
            Positioned(
              right: 6,
              top: 6,
              child: Container(
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(10),
                ),
                constraints: const BoxConstraints(
                  minWidth: 16,
                  minHeight: 16,
                ),
                child: Text(
                  '${cart.items.length}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
        ],
      );
    },
  ),
],      ),

      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];

          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: product['color'] as Color,
                child: Text(
                  (product['name'] as String).substring(0, 1),
                  style: const TextStyle(color: Colors.white),
                ),
              ),

              title: Text(
                product['name'] as String,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),

              subtitle: Text('${product['price']} ₸'),

              trailing: ElevatedButton(
                onPressed: () {
                  Provider.of<CartModel>(context, listen: false).addItem(product);
                },
                child: const Text("Добавить в корзину"),
              ),
            ),
          );
        },
      ),
    );
  }
}