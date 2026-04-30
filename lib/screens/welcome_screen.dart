import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'login_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[50],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "World Peas",
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.green[800],
              ),
            ),
            const SizedBox(height: 20),
            const Text("Доставка свежих продуктов"),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                // Переход в категории (гостевой режим)
                Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => const LoginScreen(),
  ),
);               // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => const CategoriesScreen(cartItems: []),
                //   ),
                // );     
              },
              child: const Text("Регистрация / Вход"),
            ),
            TextButton(
              onPressed: () {
                // Гостевой режим — пока просто тоже категории
                Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => const HomeScreen(isGuest: true),
  ),
);                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => const CategoriesScreen(cartItems: []),
                //   ),
                // );
              },
              child: const Text("Гостевой режим"),
            ),
          ],
        ),
      ),
    );
  }
}