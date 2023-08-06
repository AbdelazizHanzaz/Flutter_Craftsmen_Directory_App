import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../models/craftsmen.dart';
import '../models/review.dart';
import '../models/service_category.dart';
import '../models/user.dart';

class DatabaseService {
  // Singleton instance
  static final DatabaseService _instance = DatabaseService._internal();

  // Private constructor
  DatabaseService._internal();

  // Factory constructor
  factory DatabaseService() => _instance;

  // Database
  static Database? _db;

  Future<Database> get database async {
    if (_db != null) return _db!;

    _db = await _initDB();
    return _db!;
  }

  // Initialize database
  _initDB() async {
    String path = await getDatabasesPath();
    return openDatabase(join(path, 'craftsmen.db'),
        version: 1, onCreate: _onCreate);
  }

  // SQL to create tables
  Future _onCreate(Database db, int version) async {
    await db.execute(''' 
      CREATE TABLE users(
        id INTEGER PRIMARY KEY,
        name TEXT NOT NULL,
        email TEXT NOT NULL,
        phone TEXT NOT NULL
      )
    ''');

    await db.execute('''
      CREATE TABLE craftsmen(
        id INTEGER PRIMARY KEY,
        user_id INTEGER NOT NULL,
        bio TEXT NOT NULL,
        services TEXT NOT NULL,
        portfolio TEXT NOT NULL,
        FOREIGN KEY(user_id) REFERENCES users(id) 
      )
    ''');

    await db.execute('''
      CREATE TABLE reviews(
        id INTEGER PRIMARY KEY,
        craftsman_id INTEGER NOT NULL,
        user_id INTEGER NOT NULL,
        rating INTEGER NOT NULL,
        comment TEXT,
        FOREIGN KEY(craftsman_id) REFERENCES craftsmen(id),
        FOREIGN KEY(user_id) REFERENCES users(id)
      )
    ''');

    await db.execute('''
    CREATE TABLE service_categories(
      id INTEGER PRIMARY KEY,
      name TEXT NOT NULL
    )
  ''');
  }

  // User CRUD methods

  Future<int> createUser(User user) async {
    final dbClient = await database;
    return await dbClient.insert('users', user.toJson());
  }

  Future<List<User>> getUsers() async {
    final dbClient = await database;
    final maps = await dbClient.query('users');

    return List.generate(maps.length, (index) {
      return User.fromJson(maps[index]);
    });
  }

  Future<int> updateUser(User user) async {
    final dbClient = await database;
    return await dbClient
        .update('users', user.toJson(), where: 'id = ?', whereArgs: [user.id]);
  }

  Future<int> deleteUser(int id) async {
    final dbClient = await database;
    return await dbClient.delete('users', where: 'id = ?', whereArgs: [id]);
  }

  // Craftsman CRUD methods

  Future<int> createCraftsman(Craftsman craftsman) async {
    final dbClient = await database;
    return await dbClient.insert('craftsmen', craftsman.toJson());
  }

  Future<List<Craftsman>> getCraftsmen() async {
    final dbClient = await database;

    final maps = await dbClient.query('craftsmen');

    return List.generate(maps.length, (index) {
      return Craftsman.fromJson(maps[index]);
    });
  }

  Future<int> updateCraftsman(Craftsman craftsman) async {
    final dbClient = await database;
    return await dbClient.update('craftsmen', craftsman.toJson(),
        where: 'id = ?', whereArgs: [craftsman.id]);
  }

  Future<int> deleteCraftsman(int id) async {
    final dbClient = await database;
    return await dbClient.delete('craftsmen', where: 'id = ?', whereArgs: [id]);
  }


Future<List<Craftsman>> searchCraftsmen(String query) async {

  List<Craftsman> craftsmen = [];

  if (query.isEmpty) {
    // Return all if empty query
    craftsmen = await getCraftsmen(); 
  } else {
    // Search by name 
    final nameMatches = await searchCraftsmenByName(query);

    // Search by services
    final serviceMatches = await searchCraftsmenByCategory(query);

    // Combine results
    craftsmen = [...nameMatches, ...serviceMatches];
  }

  // Remove duplicates
  craftsmen = craftsmen.toSet().toList();

  return craftsmen;
  
}

Future<int> getUserIdForCraftsman(int craftsmanId) async {

  final dbClient = await database;

  List<Map> result = await dbClient.query(
    'craftsmen', 
    where: 'id = ?',
    whereArgs: [craftsmanId],
    limit: 1
  );

  if (result.isEmpty) {
    return -1; 
  } else {
    return result.first['user_id'] as int;
  }

}

  // Review CRUD methods

  Future<int> createReview(Review review) async {
    final dbClient = await database;
    return await dbClient.insert('reviews', review.toJson());
  }

  Future<List<Review>> getReviews() async {
    final dbClient = await database;

    final maps = await dbClient.query('reviews');

    return List.generate(maps.length, (index) {
      return Review.fromJson(maps[index]);
    });
  }

  Future<int> updateReview(Review review) async {
    final dbClient = await database;
    return await dbClient.update('reviews', review.toJson(),
        where: 'id = ?', whereArgs: [review.id]);
  }

  Future<int> deleteReview(int id) async {
    final dbClient = await database;
    return await dbClient.delete('reviews', where: 'id = ?', whereArgs: [id]);
  }

  // Service Category CRUD

  Future<int> createCategory(ServiceCategory category) async {
    final dbClient = await database;
    return await dbClient.insert('service_categories', category.toJson());
  }

  Future<List<ServiceCategory>> getCategories() async {
    final dbClient = await database;

    final maps = await dbClient.query('service_categories');

    return List.generate(maps.length, (index) {
      return ServiceCategory.fromJson(maps[index]);
    });
  }

  Future<int> updateCategory(ServiceCategory category) async {
    final dbClient = await database;
    return await dbClient.update('service_categories', category.toJson(),
        where: 'id = ?', whereArgs: [category.id]);
  }

  Future<int> deleteCategory(int id) async {
    final dbClient = await database;
    return await dbClient
        .delete('service_categories', where: 'id = ?', whereArgs: [id]);
  }

  // Search by name
  Future<List<Craftsman>> searchCraftsmenByName(String name) async {
    final dbClient = await database;

    final maps = await dbClient
        .query('craftsmen', where: 'name LIKE ?', whereArgs: ['%$name%']);

    return maps.map((map) => Craftsman.fromJson(map)).toList();
  }

// Search by category
  Future<List<Craftsman>> searchCraftsmenByCategory(String category) async {
    final dbClient = await database;

    final maps = await dbClient.query('craftsmen',
        where: 'services LIKE ?', whereArgs: ['%$category%']);

    return maps.map((map) => Craftsman.fromJson(map)).toList();
  }

// Search by location
  Future<List<Craftsman>> searchCraftsmenByLocation(String city) async {
    final dbClient = await database;

    final maps =
        await dbClient.query('craftsmen', where: 'city = ?', whereArgs: [city]);

    return maps.map((map) => Craftsman.fromJson(map)).toList();
  }

// Sort by rating
  Future<List<Craftsman>> getAllCraftsmenSortedByRating() async {
    final dbClient = await database;

    final maps = await dbClient.query('craftsmen', orderBy: 'rating DESC');

    return maps.map((map) => Craftsman.fromJson(map)).toList();
  }

  // Search reviews by craftsman
  Future<List<Review>> getReviewsForCraftsman(int craftsmanId) async {
  final dbClient = await database;
  
  final maps = await dbClient.query('reviews', 
      where: 'craftsman_id = ?', 
      whereArgs: [craftsmanId]);

  return maps.map((map) => Review.fromJson(map)).toList();
}
  // Search reviews by user
Future<List<Review>> getReviewsByUser(int userId) async {
  final dbClient = await database;

  final maps = await dbClient.query('reviews', 
      where: 'user_id = ?',
      whereArgs: [userId]);

  return maps.map((map) => Review.fromJson(map)).toList();
}

// Get craftsmen with most reviews
Future<List<Craftsman>> getCraftsmenByReviewCount() async {
  final dbClient = await database;
  
  final maps = await dbClient.rawQuery('''
    SELECT craftsmen.* 
    FROM craftsmen
    INNER JOIN reviews
    ON craftsmen.id = reviews.craftsman_id
    GROUP BY craftsmen.id
    ORDER BY COUNT(reviews.id) DESC
  ''');

  return maps.map((map) => Craftsman.fromJson(map)).toList();
}


}
