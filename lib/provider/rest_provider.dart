import 'dart:async';
//import 'dart:io';

import 'package:dio/dio.dart';
import 'package:socket_io_client/socket_io_client.dart';

import '../model/note.dart';
import '../model/note_collection.dart';

class RestDataProvider {
  static RestDataProvider helper = RestDataProvider._createInstance();

  RestDataProvider._createInstance();

  final Dio _dio = Dio();

  String prefixUrl =
      "https://si7001s2023backend-production-bfd9.up.railway.app/notes/";
  String suffixUrl = "";

  insertNote(Note note) async {
    _dio.post(
      prefixUrl + suffixUrl,
      data: note.toMap(),
    );
  }

  updateNote(String noteId, Note note) async {
    _dio.put(
      prefixUrl + noteId + suffixUrl,
      data: note.toMap(),
    );
  }

  deleteNote(String noteId) async {
    _dio.delete(
      prefixUrl + noteId + suffixUrl,
    );
  }

  Future<NoteCollection> getNoteList() async {
    Response response = await _dio.get(prefixUrl + suffixUrl);

    NoteCollection noteCollection = NoteCollection();

    response.data.forEach((value) {
      noteCollection.insertNoteOfId(
          value["id"].toString(),
          Note.fromMap(
              {"title": value["title"], "description": value["description"]}));
    });
    return noteCollection;
  }

  /*
  Stream
  */
  notify(String noteId, Note? note) {
    // Se note == null -> delete ocorreu em noteId
    // CC --> acabou de haver um mudança com noteId
    _controller?.sink.add([noteId, note]);
  }

  Stream get stream {
    _controller ??= StreamController.broadcast();

    Socket socket = io(
        "https://si7001s2023backend-production-bfd9.up.railway.app",
        OptionBuilder().setTransports(['websocket']) // for Flutter or Dart VM
            //.disableAutoConnect()  // disable auto-connection
            .build());

    socket.on("server_information", (data) {
      String noteId = data["noteId"].toString();
      String title = data["title"];
      // String description = data["description"];

      if (title == "") {
        notify(noteId, null);
      } else {
        Note note = Note.fromMap(data);
        notify(noteId, note);
      }
    });

    return _controller!.stream;
  }

  StreamController? _controller;
}
