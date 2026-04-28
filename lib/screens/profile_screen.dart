import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {

  final bool isGuest;

  const ProfileScreen({super.key, required this.isGuest});

  @override
  Widget build(BuildContext context) {

  if (isGuest) {
  return Scaffold(
    appBar: AppBar(
      title: const Text("Профиль"),
    ),
    body: const Center(
      child: Text(
        "Гостевой режим\n\nВойдите, чтобы получить доступ к функциям профиля и персонализированному опыту.",
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 18),
      ),
    ),
  );
}

    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
      ),
      body: ListView(
        children: [

          const SizedBox(height: 20),

          // Аватар
          const CircleAvatar(
  radius: 50,
  backgroundImage: NetworkImage(
    "https://i.pravatar.cc/300",
  ),
),  

          const SizedBox(height: 10),

          // Имя
          const Center(
            child: Text(
              "Акжол Алимжан",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          const SizedBox(height: 5),

          const Center(
            child: Text(
              "alimok20@worldpeas.com",
              style: TextStyle(color: Colors.grey),
            ),
          ),

          const SizedBox(height: 30),

          // Меню профиля
          const Divider(),

          ListTile(
            leading: const Icon(Icons.shopping_bag),
            title: const Text("Мои заказы"),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {},
          ),

          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text("Настройки"),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {},
          ),

          ListTile(
            leading: const Icon(Icons.support_agent),
            title: const Text("Поддержка"),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {},
          ),

          const Divider(),

          const SizedBox(height: 20),

          // About us
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              "О нас",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          const Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              "World Peas — это сервис доставки свежих продуктов. "
              "Мы работаем с лучшими поставщиками и доставляем "
              "качественные продукты прямо к вашей двери.",
              style: TextStyle(color: Colors.grey),
            ),
          ),

          const SizedBox(height: 20),

          const Center(
            child: Text(
              "Version 1.0",
              style: TextStyle(color: Colors.grey),
            ),
          ),

          const SizedBox(height: 20),

          
        ],
      ),
    );
  }
}
