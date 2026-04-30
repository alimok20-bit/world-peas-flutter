import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseService {
  DatabaseService._privateConstructor();
  static final DatabaseService instance = DatabaseService._privateConstructor();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, 'world_peas.db');
    return await openDatabase(path, version: 1, onCreate: _createDatabase);
  }

  Future<void> _createDatabase(Database db, int version) async {
    await db.execute('''
      CREATE TABLE categories(
        name TEXT PRIMARY KEY,
        icon TEXT,
        color INTEGER
      )
    ''');

    await db.execute('''
      CREATE TABLE products(
        name TEXT PRIMARY KEY,
        category TEXT,
        price INTEGER,
        color INTEGER,
        imagePath TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE cart(
        productName TEXT PRIMARY KEY,
        price INTEGER,
        quantity INTEGER
      )
    ''');

    await _seedCategories(db);
    await _seedProducts(db);
  }

  Future<void> _seedCategories(Database db) async {
    final categories = [
      {'name': 'Фрукты и овощи', 'icon': 'local_florist', 'color': 0xFFFF9800},
      {'name': 'Мясо и птица', 'icon': 'set_meal', 'color': 0xFFFF5252},
      {'name': 'Готовые блюда', 'icon': 'restaurant', 'color': 0xFF4CAF50},
      {
        'name': 'Молочные продукты',
        'icon': 'emoji_food_beverage',
        'color': 0xFF03A9F4,
      },
      {'name': 'Выпечка', 'icon': 'cake', 'color': 0xFF795548},
      {'name': 'Напитки', 'icon': 'local_drink', 'color': 0xFF009688},
    ];

    for (final category in categories) {
      await db.insert('categories', category);
    }
  }

  Future<void> _seedProducts(Database db) async {
    final products = [
      {
        'name': 'Яблоко',
        'category': 'Фрукты и овощи',
        'price': 3500,
        'color': 0xFFFF5252,
        'imagePath': 'assets/images/product_яблоко.webp',
      },
      {
        'name': 'Банан',
        'category': 'Фрукты и овощи',
        'price': 1500,
        'color': 0xFFFFEB3B,
        'imagePath': 'assets/images/product_банан.webp',
      },
      {
        'name': 'Морковь',
        'category': 'Фрукты и овощи',
        'price': 1000,
        'color': 0xFFFF9800,
        'imagePath': 'assets/images/product_морковь.webp',
      },
      {
        'name': 'Томат',
        'category': 'Фрукты и овощи',
        'price': 2500,
        'color': 0xFFF44336,
        'imagePath': 'assets/images/product_томат.webp',
      },
      {
        'name': 'Груша',
        'category': 'Фрукты и овощи',
        'price': 2800,
        'color': 0xFF4CAF50,
        'imagePath': 'assets/images/product_груша.webp',
      },
      {
        'name': 'Огурец',
        'category': 'Фрукты и овощи',
        'price': 1200,
        'color': 0xFF8BC34A,
        'imagePath': 'assets/images/product_огурец.webp',
      },
      {
        'name': 'Курица',
        'category': 'Мясо и птица',
        'price': 5000,
        'color': 0xFF795548,
        'imagePath': 'assets/images/product_курица.jpg',
      },
      {
        'name': 'Говядина',
        'category': 'Мясо и птица',
        'price': 6000,
        'color': 0xFFFF5252,
        'imagePath': 'assets/images/product_говядина.webp',
      },
      {
        'name': 'Свинина',
        'category': 'Мясо и птица',
        'price': 5000,
        'color': 0xFFFF9800,
        'imagePath': 'assets/images/product_свинина.jpg',
      },
      {
        'name': 'Баранина',
        'category': 'Мясо и птица',
        'price': 7000,
        'color': 0xFFFF5722,
        'imagePath': 'assets/images/product_баранина.webp',
      },
      {
        'name': 'Индейка',
        'category': 'Мясо и птица',
        'price': 5200,
        'color': 0xFF4CAF50,
        'imagePath': 'assets/images/product_индейка.webp',
      },
      {
        'name': 'Пицца',
        'category': 'Готовые блюда',
        'price': 3000,
        'color': 0xFFFF9800,
        'imagePath': 'assets/images/product_пицца.webp',
      },
      {
        'name': 'Бургер',
        'category': 'Готовые блюда',
        'price': 2500,
        'color': 0xFF795548,
        'imagePath': 'assets/images/product_бургер.webp',
      },
      {
        'name': 'Паста',
        'category': 'Готовые блюда',
        'price': 2000,
        'color': 0xFFFFEB3B,
        'imagePath': 'assets/images/product_паста.webp',
      },
      {
        'name': 'Салат',
        'category': 'Готовые блюда',
        'price': 3000,
        'color': 0xFF4CAF50,
        'imagePath': 'assets/images/product_салат.jpg',
      },
      {
        'name': 'Суши-сет',
        'category': 'Готовые блюда',
        'price': 4500,
        'color': 0xFF03A9F4,
        'imagePath': 'assets/images/product_суши_сет.webp',
      },
      {
        'name': 'Молоко',
        'category': 'Молочные продукты',
        'price': 1400,
        'color': 0xFF2196F3,
        'imagePath': 'assets/images/product_молоко.webp',
      },
      {
        'name': 'Сыр',
        'category': 'Молочные продукты',
        'price': 4200,
        'color': 0xFFFFC107,
        'imagePath': 'assets/images/product_сыр.webp',
      },
      {
        'name': 'Йогурт',
        'category': 'Молочные продукты',
        'price': 900,
        'color': 0xFFFF4081,
        'imagePath': 'assets/images/product_йогурт.webp',
      },
      {
        'name': 'Творог',
        'category': 'Молочные продукты',
        'price': 1700,
        'color': 0xFF009688,
        'imagePath': 'assets/images/product_творог.webp',
      },
      {
        'name': 'Хлеб',
        'category': 'Выпечка',
        'price': 900,
        'color': 0xFF795548,
        'imagePath': 'assets/images/product_хлеб.webp',
      },
      {
        'name': 'Булочка',
        'category': 'Выпечка',
        'price': 800,
        'color': 0xFFFF9800,
        'imagePath': 'assets/images/product_булочка.webp',
      },
      {
        'name': 'Круассан',
        'category': 'Выпечка',
        'price': 1100,
        'color': 0xFFFFEB3B,
        'imagePath': 'assets/images/product_круассан.webp',
      },
      {
        'name': 'Пирожное',
        'category': 'Выпечка',
        'price': 1400,
        'color': 0xFFE91E63,
        'imagePath': 'assets/images/product_пирожное.webp',
      },
      {
        'name': 'Сок',
        'category': 'Напитки',
        'price': 1200,
        'color': 0xFFFFAB40,
        'imagePath': 'assets/images/product_сок.webp',
      },
      {
        'name': 'Вода',
        'category': 'Напитки',
        'price': 600,
        'color': 0xFF03A9F4,
        'imagePath': 'assets/images/product_вода.webp',
      },
      {
        'name': 'Кофе',
        'category': 'Напитки',
        'price': 1800,
        'color': 0xFF795548,
        'imagePath': 'assets/images/product_кофе.webp',
      },
      {
        'name': 'Чай',
        'category': 'Напитки',
        'price': 1000,
        'color': 0xFF4CAF50,
        'imagePath': 'assets/images/product_чаи.webp',
      },
    ];

    for (final product in products) {
      await db.insert('products', product);
    }
  }

  Future<List<Map<String, dynamic>>> getCategories() async {
    final db = await database;
    return await db.query('categories');
  }

  Future<List<Map<String, dynamic>>> getProductsByCategory(
    String category,
  ) async {
    final db = await database;
    return await db.query(
      'products',
      where: 'category = ?',
      whereArgs: [category],
    );
  }

  Future<List<Map<String, dynamic>>> getCartItems() async {
    final db = await database;
    return await db.query('cart');
  }

  Future<void> addOrUpdateCartItem(String name, int price) async {
    final db = await database;
    final existing = await db.query(
      'cart',
      where: 'productName = ?',
      whereArgs: [name],
    );
    if (existing.isEmpty) {
      await db.insert('cart', {
        'productName': name,
        'price': price,
        'quantity': 1,
      });
    } else {
      final currentQty = existing.first['quantity'] as int;
      await db.update(
        'cart',
        {'quantity': currentQty + 1},
        where: 'productName = ?',
        whereArgs: [name],
      );
    }
  }

  Future<void> removeCartItem(String name) async {
    final db = await database;
    await db.delete('cart', where: 'productName = ?', whereArgs: [name]);
  }

  Future<void> clearCart() async {
    final db = await database;
    await db.delete('cart');
  }

  Future<void> updateCartQuantity(String name, int quantity) async {
    final db = await database;
    if (quantity <= 0) {
      await removeCartItem(name);
      return;
    }
    await db.update(
      'cart',
      {'quantity': quantity},
      where: 'productName = ?',
      whereArgs: [name],
    );
  }
}
