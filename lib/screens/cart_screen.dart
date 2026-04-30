import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/cart_model.dart';

class CartScreen extends StatelessWidget {
  final bool? isGuest;

  const CartScreen({super.key, this.isGuest});

  @override
  Widget build(BuildContext context) {

    final cart = Provider.of<CartModel>(context);

    return Scaffold(
      appBar: AppBar(
        actions: [
  TextButton(
    onPressed: () {
      Provider.of<CartModel>(context, listen: false).clearCart();

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Корзина очищена")),
      );
    },
    child: const Text(
      "Очистить",
      style: TextStyle(color: Color.fromARGB(255, 138, 99, 99)),
    ),
  ),
],
        title: const Text("Корзина"),
      ),
      

      body: Column(
        children: [

          Expanded(
            child: ListView.builder(
              itemCount: cart.items.length,
              itemBuilder: (context, index) {

                final item = cart.items[index];

                return ListTile(
  title: Text(item['name']),
  subtitle: Text("Количество: ${item['quantity']}"),
  trailing: Text("${item['price'] * item['quantity']} ₸"),
);
              },
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Итого: ${cart.totalPrice} ₸",
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                ElevatedButton(
                  onPressed: cart.items.isEmpty
                      ? null
                      : () async {
                          final cartModel = Provider.of<CartModel>(context, listen: false);
                          final messenger = ScaffoldMessenger.of(context);

                          final confirmed = await showDialog<bool>(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: const Text('Оформление заказа'),
                              content: const Text(
                                'Транзакция выполнена. Доставка будет одобрена в ближайшее время.',
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop(false);
                                  },
                                  child: const Text('Отмена'),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(context).pop(true);
                                  },
                                  child: const Text('ОК'),
                                ),
                              ],
                            ),
                          );

                          if (confirmed == true) {
                            await cartModel.clearCart();
                            messenger.showSnackBar(
                              const SnackBar(
                                content: Text(
                                  'Заказ подтвержден. Ожидайте окончания доставки.',
                                ),
                              ),
                            );
                          }
                        },
                  child: const Text('Оформить заказ'),
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }
}
