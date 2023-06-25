import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/note.dart';
import '../model/note_collection.dart';

//import 'package:cloud'

class FirestoreDatabase {
  static FirestoreDatabase helper = FirestoreDatabase._createInstance();

  CollectionReference noteCollection =
      FirebaseFirestore.instance.collection("notes");

  String? uid;

  FirestoreDatabase._createInstance();

  insertNote(Note note) async {
    noteCollection
        .doc(uid)
        .collection("my_notes")
        .add({"review": note.review, "rating": note.rating});
  }

  updateNote(String noteId, Note note) async {
    noteCollection
        .doc(uid)
        .collection("my_notes")
        .doc(noteId)
        .update({"review": note.review, "rating": note.rating});
  }

  deleteNote(String noteId) async {
    noteCollection.doc(uid).collection("my_notes").doc(noteId).delete();
  }

  Future<NoteCollection> getNoteList() async {
    QuerySnapshot snapshot =
        await noteCollection.doc(uid).collection("my_notes").get();

    NoteCollection nc = NoteCollection();
    for (var doc in snapshot.docs) {
      Note note = Note.fromMap(doc.data());
      nc.insertNoteOfId(doc.id, note);
    }
    return nc;
  }

  /*
  Stream
  */
  Stream get stream {
    return noteCollection
        .doc(uid)
        .collection("my_notes")
        .snapshots()
        .map((QuerySnapshot snapshot) {
      NoteCollection nc = NoteCollection();
      for (var doc in snapshot.docs) {
        Note note = Note.fromMap(doc.data());
        nc.insertNoteOfId(doc.id, note);
      }
      return nc;
    });
  }
}
