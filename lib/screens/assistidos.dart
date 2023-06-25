import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/manage_db_bloc.dart';
import '../bloc/monitor_db_bloc.dart';
import '../model/note_collection.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

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
  Assistidos({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MonitorBloc, MonitorState>(builder: (context, state) {
      NoteCollection noteCollection = state.noteCollection;
      return ListView.builder(
        itemCount: noteCollection.length(),
        itemBuilder: (context, position) {
          return ListTile(
            leading: const Icon(Icons.abc),
            trailing: SizedBox(
              width: 100,
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      BlocProvider.of<ManageBloc>(context).add(UpdateRequest(
                        noteId: noteCollection.getIdAtIndex(position),
                        previousNote: noteCollection.getNoteAtIndex(position),
                      ));
                    },
                    icon: const Icon(Icons.edit),
                  ),
                  IconButton(
                    onPressed: () {
                      BlocProvider.of<ManageBloc>(context).add(DeleteEvent(
                        noteId: noteCollection.getIdAtIndex(position),
                      ));
                    },
                    icon: const Icon(Icons.delete),
                  )
                ],
              ),
            ),
            title: Text(noteCollection.getNoteAtIndex(position).review),
            subtitle: Text(noteCollection.getNoteAtIndex(position).rating),
          );
        },
      );
    });
  }
}
