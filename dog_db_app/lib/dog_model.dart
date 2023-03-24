import 'package:sqflite/sqflite.dart';

import 'db_helper.dart';

class Dog {
  final int? id;
  final String name;
  final int age;

  const Dog({
    this.id,
    required this.name,
    required this.age,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'age': age,
    };
  }
 
  @override
  String toString() {
    return 'Dog{id: $id, name: $name, age: $age}';
  }

static Future<List<Dog>> getDog() async {
    final Database db = await DbHelper.initDb();
    final List<Map<String, dynamic>> maps = await db.query('dogs');
    return List.generate(maps.length, (i) {
      return Dog(
        id: maps[i]['id'],
        name: maps[i]['name'],
        age: maps[i]['age'],
      );
    });
  }

 static Future<int> insertDog(Dog dog) async {
    final Database db = await DbHelper.initDb();
    final int result = await db.insert('dogs', dog.toMap());
    return result;
  }

  static Future<int> updateDog(Dog dog) async {
    final Database db = await DbHelper.initDb();
    return await db.update(
      'dogs',
      dog.toMap(),
      where: 'id = ?',
      whereArgs: [dog.id],
    );
  }

  static Future<int> deleteDog(int id) async {
    final Database db = await DbHelper.initDb();
    return await db.delete(
      'dogs',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

}
