//Data provider para o bd local sqflite

import 'dart:async';
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:trabalho1/model/review.dart';

import '../../model/collection/review_collection.dart';

class DatabaseLocalServer {
  static DatabaseLocalServer helper = DatabaseLocalServer._createInstance();

  DatabaseLocalServer._createInstance();

  static Database? _database;

  String reviewTable = "review_table";
  String colId = "id";
  String colComment = "comment";
  String colStars = "stars";

  Future<Database> get database async{
    _database ??= await initializeDatabase();
    return _database!;
  }

  Future<Database> initializeDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + "reviews.db";

    return openDatabase(path, version: 1, onCreate: _createDb);

  }

  _createDb(Database db, int newVersion){
    db.execute("""
      CREATE TABLE $reviewTable(
        $colId INTEGER PRIMARY KEY AUTOINCREMENT,
        $colComment TEXT,
        $colStars REAL
      );
    """);
  }

  Future<int> insertReview(Review review) async {
    Database db = await this.database;
    return db.insert(reviewTable, review.toMap());
  }

  Future<int> updateReview(int reviewId, Review review) async {
    Database db = await this.database;
    return db.update(reviewTable, review.toMap(), where: "$colId = ?", whereArgs: [reviewId]);
  }

  Future<int> deleteReview(int reviewId) async {
    Database db = await database;
    return db.rawDelete("""
      DELETE FROM $reviewTable WHERE  $colId = $reviewId;  
      """);
  }

  Future<ReviewCollection> getReviewList() async {
    Database db = await database;
    var reviewMapList = await db.rawQuery("""
         SELECT * FROM $reviewTable;
    """);

    ReviewCollection reviewCollection = ReviewCollection();
    for (int i = 0; i < reviewMapList.length; i++) {
      reviewCollection.insertReviewOfId(
          reviewMapList[i][colId].toString(),
          Review.fromMap(
            reviewMapList[i],
          ));
    }
    return reviewCollection;
  }

/*
notify(String reviewId, Review? review) {
    // Se review == null -> delete ocorreu em reviewId
    // CC --> acabou de haver um mudança com reviewId
    _controller?.sink.add([reviewId, review]);
  }

  Stream get stream {
    _controller ??= StreamController.broadcast();
    return _controller!.stream;
  }

  StreamController? _controller;*/
}