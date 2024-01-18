import 'package:sqflite/sqflite.dart' as sql;

import 'model/barang_model.dart';
import 'model/transaksi_model.dart';

class SQLHelper {
  // Barang
  static Future<void> createTableBarang(sql.Database db) async {
    await db.execute("""CREATE TABLE barang (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      nama_barang TEXT NOT NULL,
      kode_barang TEXT NOT NULL,
      nomor_barang INTEGER NOT NULL,
      harga_barang TEXT NOT NULL,
      jumlah_barang TEXT NOT NULL,
      total_harga_barang TEXT NOT NULL
    )
  """);
  }

  static Future<sql.Database> dbBarang() async {
    return sql.openDatabase('barang.db', version: 1,
        onCreate: (db, version) async {
      await createTableBarang(db);
    });
  }

  static Future<int> insertBarang(BarangModel barangModel) async {
    final db = await SQLHelper.dbBarang();
    return db.insert('barang', barangModel.toMap());
  }

  static Future<List<BarangModel>> getBarangData() async {
    final db = await SQLHelper.dbBarang();
    final List<Map<String, dynamic>> maps = await db.query('barang');
    return maps.map((e) => BarangModel.fromJson(e)).toList();
  }

  static Future<int> deleteBarang(int id) async {
    final db = await SQLHelper.dbBarang();
    return db.delete('barang', where: 'id = ?', whereArgs: [id]);
  }

  static Future<int> updateBarang(BarangModel barangModel) async {
    final db = await SQLHelper.dbBarang();
    return db.update('barang', barangModel.toMap(), where: 'id = ?', whereArgs: [barangModel.id]);
  }

  static Future<List<String>> getProductCode() async {
    final db = await SQLHelper.dbBarang();

    final List<Map<String, dynamic>> productCodeMaps = await db.query(
      'barang',
      columns: ['kode_barang'],
    );

    return productCodeMaps.map((map) => map['kode_barang'] as String).toList();
  }

  // Transaksi
  static Future<void> createTable(sql.Database db) async {
    await db.execute("""CREATE TABLE transaksi (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      nomor_transaksi INTEGER NOT NULL,
      tanggal_transaksi TEXT NOT NULL,
      kode_customer TEXT NOT NULL,
      nama_customer TEXT NOT NULL,
      nohp_customer TEXT NOT NULL
    )
  """);
  }
  static Future<sql.Database> db() async {
    return sql.openDatabase('transaksi.db', version: 1,
        onCreate: (db, version) async {
      await createTable(db);
    });
  }

  static Future<int> insert(TransactionModel transactionModel) async {
    final db = await SQLHelper.db();
    return db.insert('transaksi', transactionModel.toMap());
  }

  static Future<List<TransactionModel>> getTransaksiData() async {
    final db = await SQLHelper.db();
    final List<Map<String, dynamic>> maps = await db.query('transaksi');
    return maps.map((e) => TransactionModel.fromJson(e)).toList();
  }

  static Future<int> deleteTransaksi(int id) async {
    final db = await SQLHelper.db();
    return db.delete('transaksi', where: 'id = ?', whereArgs: [id]);
  }

  static Future<int> update(TransactionModel transactionModel) async {
    final db = await SQLHelper.db();
    return db.update('transaksi', transactionModel.toMap(),
        where: 'id = ?', whereArgs: [transactionModel.id]);
  }
}
