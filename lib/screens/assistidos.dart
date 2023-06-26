import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/manage_db_bloc.dart';
import '../bloc/monitor_db_bloc.dart';
import '../main.dart';
import '../model/note.dart';
import '../model/note_collection.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

import '../provider/firestore_firebase.dart';

Future<String> getImageUrl(fileName) async {
  firebase_storage.Reference imageRef =
      firebase_storage.FirebaseStorage.instance.ref().child('images/$fileName');

  try {
    String downloadUrl = await imageRef.getDownloadURL();
    return downloadUrl;
  } catch (e) {
    throw Exception('A imagem não foi encontrada.');
  }
}

class Assistidos extends StatelessWidget {
  const Assistidos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Assistidos'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirestoreDatabase.helper.noteCollection
            .doc(username)
            .collection(username)
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const CircularProgressIndicator();
          }

          List<Note> notes = snapshot.data!.docs.map((doc) {
            Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
            return Note.fromMap(data);
          }).toList();

          return ListView.builder(
            itemCount: notes.length,
            itemBuilder: (context, index) {
              Note note = notes[index];
              return ListTile(
                title: Text(note.movie),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Review: ${note.review}'),
                    Text('Rating: ${note.rating}'),
                  ],
                ),
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    FirestoreDatabase.helper.deleteNote(note.movie);
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
