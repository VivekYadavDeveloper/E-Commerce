import 'dart:io';
import 'package:futkart/db/cart_db_model.dart';
import 'package:futkart/db/db_helper_model.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  // databse name/databse file name
  static const dbName = "futcart.db";
  static const dbVersion = 1;

  //  table name
  static const wishListTable = "wishlistTable";
  static const cartTable = "cartTable";

  //  wishlist table column name
  static const columnProductId = 'product_id';
  static const columnProductName = 'product_name';
  static const columnProductCartonSize = 'product_carton_size';
  static const columnProductPrice = 'product_price';
  static const columnProductImgUrl = 'product_img_url';

  //  cart table column name
  static const cartProductId = 'product_id';
  static const cartProductName = 'product_name';
  static const cartProductCartonSize = 'product_carton_size';
  static const cartProductQuantity = 'quantity';
  static const cartProductPrice = 'product_price';
  static const cartProductImgUrl = 'product_img_url';

  // class constructor
  static final DbHelper dbhelper = DbHelper();

  //   db intitialize
  static Database? _database;

  Future<Database?> get database async {
    if (_database != null) {
      return _database;
    } else {
      _database = await initDB();
      return _database;
    }
  }

  initDB() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, dbName);
    return await openDatabase(path, version: dbVersion, onCreate: onCreate);
  }

  Future onCreate(Database db, int version) async {
    db.execute('''
        CREATE TABLE $wishListTable (
          $columnProductId Text PRIMARY KEY,
          $columnProductName TEXT NOT NULL,
          $columnProductCartonSize TEXT NOT NULL,
          $columnProductPrice TEXT NOT NULL,
          $columnProductImgUrl TEXT NOT NULL
        )
      ''');

    db.execute('''
        CREATE TABLE $cartTable (
          $cartProductId Text PRIMARY KEY,
          $cartProductName TEXT NOT NULL,
          $cartProductCartonSize TEXT NOT NULL,
          $cartProductQuantity TEXT NOT NULL,
          $cartProductPrice TEXT NOT NULL,
          $cartProductImgUrl TEXT NOT NULL
        )
      ''');
  }

  ///////////////////////////////////////////////////////      wishlist table CRUD
  insertData(Map<String, dynamic> data) async {
    Database? db = await dbhelper.database;
    return await db!.insert(wishListTable, data);
  }

  // Future<List<Map<String , dynamic>>>  getData() async {
  //   Database? db = await dbhelper.database;
  //   return await db!.query(cartrTable);
  // }

  Future<List<DbHelperModel>> getData() async {
    Database? db = await dbhelper.database;
    List<Map<String, dynamic>> result = await db!.query(wishListTable);
    print("////////////////////////////////////////////////////////////");
    print(result);
    return result.map((e) => DbHelperModel.fromJson(e)).toList();
    // return await db!.query(cartrTable);
  }

  Future<int> updateData(Map<String, dynamic> data) async {
    Database? db = await dbhelper.database;
    String id = data[columnProductId];
    return await db!.update(wishListTable, data,
        where: '$columnProductId = ?', whereArgs: [id]);
  }

  Future<int> deleteData(String id) async {
    Database? db = await dbhelper.database;
    return await db!
        .delete(wishListTable, where: '$columnProductId = ?', whereArgs: [id]);
  }

  ///////////////////////////////////////////////////////////////////////     cart table CRUD
  ///////////////////////////////////////////////////////////////////////
  insertCartData(Map<String, dynamic> data) async {
    Database? db = await dbhelper.database;
    return await db!.insert(cartTable, data);
  }

  Future<List<CartDBModel>> getCartData() async {
    Database? db = await dbhelper.database;
    List<Map<String, dynamic>> result = await db!.query(cartTable);
    print(
        "////////////////////////////////////////////////////////////  result");
    print(result);
    return result.map((e) => CartDBModel.fromJson(e)).toList();
    // return await db!.query(cartrTable);
  }

  Future<int> updateCartData(Map<String, dynamic> data) async {
    Database? db = await dbhelper.database;
    String id = data[columnProductId];
    return await db!.update(cartTable, data,
        where: '$columnProductId = ?', whereArgs: [id]);
  }

  Future<int> deleteCartData(String id) async {
    Database? db = await dbhelper.database;
    return await db!
        .delete(cartTable, where: '$columnProductId = ?', whereArgs: [id]);
  }

  Future deleteCartTable() async {
    Database? db = await dbhelper.database;
    return await db!.rawQuery('DELETE FROM ${cartTable}');
  }
}
