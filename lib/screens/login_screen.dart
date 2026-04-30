import 'package:flutter/material.dart';
import 'home_screen.dart';

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

  bool isValidEmail(String value) {
    final email = value.trim();
    const emailPattern = r'^[\w-.]+@([\w-]+\.)+[\w-]{2,}$';
    return RegExp(emailPattern).hasMatch(email);
  }

  bool isValidPassword(String value) {
    return value.trim().length >= 6;
  }

  bool isValid() {
    return isValidEmail(emailController.text) &&
        isValidPassword(passwordController.text);
  }

  String? get emailError {
    final value = emailController.text;
    if (value.isEmpty) return null;
    return isValidEmail(value) ? null : 'Введите корректный email';
  }

  String? get passwordError {
    final value = passwordController.text;
    if (value.isEmpty) return null;
    return isValidPassword(value)
        ? null
        : 'Пароль должен быть минимум 6 символов';
  }

  void login() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const HomeScreen(isGuest: false),
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
              decoration: InputDecoration(
                labelText: "Email",
                errorText: emailError,
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Password",
                errorText: passwordError,
              ),
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
