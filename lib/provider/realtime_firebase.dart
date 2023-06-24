import 'dart:async';
import 'package:dio/dio.dart';
import '../model/note.dart';
import '../model/note_collection.dart';

class RealtimeDatabaseProvider {
  static RealtimeDatabaseProvider helper =
      RealtimeDatabaseProvider._createInstance();

  RealtimeDatabaseProvider._createInstance();

  final Dio _dio = Dio();

  String prefixUrl = "https://si7001s2023-default-rtdb.firebaseio.com/";
  String suffixUrl = ".json";

  insertNote(Note note) async {
    _dio.post(
      prefixUrl + suffixUrl,
      data: note.toMap(),
    );
  }

  updateNote(String noteId, Note note) async {
    _dio.put(
      "$prefixUrl$noteId/$suffixUrl",
      data: note.toMap(),
    );
  }

  deleteNote(String noteId) async {
    _dio.delete(
      "$prefixUrl$noteId/$suffixUrl",
    );
  }

  Future<NoteCollection> getNoteList() async {
    Response response = await _dio.get(prefixUrl + suffixUrl);

    NoteCollection noteCollection = NoteCollection();

    response.data.forEach((key, value) {
      //print(value);
      noteCollection.insertNoteOfId(
          key,
          Note.fromMap(
              {"title": value["title"], "description": value["description"]}));
    });
    return noteCollection;
  }
}