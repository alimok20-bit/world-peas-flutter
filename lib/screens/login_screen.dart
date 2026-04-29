import 'package:flutter/material.dart';
import 'categories_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Главный экран")),
      body: const Center(
        child: Text("Добро пожаловать"),
      ),
    );
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // ✅ Проверка заполненности
  bool isValid() {
    return emailController.text.isNotEmpty &&
        passwordController.text.isNotEmpty;
  }

  void login() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) =>  CategoriesScreen(cartItems: []), // твой главный экран
      ), 
    );
  }

  @override
  void initState() {
    super.initState();

    // 🔄 слушаем изменения в полях
    emailController.addListener(() => setState(() {}));
    passwordController.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: emailController,
              decoration: const InputDecoration(labelText: "Email"),
            ),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(labelText: "Password"),
            ),
            const SizedBox(height: 20),

            // 🔒 КНОПКА БЛОКИРУЕТСЯ
            ElevatedButton(
              onPressed: isValid() ? login : null,
              child: const Text("Login"),
            ),
          ],
        ),
      ),
    );
  }
}
