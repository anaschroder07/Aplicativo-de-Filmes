/*import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Assistidos extends StatelessWidget {
  const Assistidos ({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          contentPadding: const EdgeInsets.all(15.0),
          title: const Text("John Wick - Baba Yaga"),
          subtitle: const Text("Triste, mas muito bom!!!"),
          leading: FittedBox(            
          fit: BoxFit.fill,          
          child: Image.network('https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcTvfkYNcjh7mncO6XPUlv611d5yqHUkGZMjGq8PXmKzGqeyC23A')
          ),
          trailing: FittedBox(
          fit: BoxFit.fill,
          child: Row(
          children: const <Widget>[
            Icon(Icons.star_border),
            Icon(Icons.star_border),
            Icon(Icons.star_border),
            Icon(Icons.star_border),
            Icon(Icons.star_border),
          ],
          ),
        ),
          onTap: (){},
        ),
        ListTile(
          contentPadding: const EdgeInsets.all(20.0),
          title: Text("Tudo em todo lugar ao mesmo tempo"),
          subtitle: Text("Nao sabia se ria, se chorava, mas é muito bom!!!"),
          leading: FittedBox(            
          fit: BoxFit.fill,          
          child: Image.network('https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcRUIm9P_8LVR6KHcFvTvYvxjshn9I3oGdwZWqK7Svtx6InZHtje')
          ),
          trailing: FittedBox(
          fit: BoxFit.fill,
          child: Row(
          children: const <Widget>[
            Icon(Icons.star),
            Icon(Icons.star),
            Icon(Icons.star),
            Icon(Icons.star_half),
            Icon(Icons.star_border),
          ],
          ),
        ),
        onTap: (){},
        ),
        ListTile(
          contentPadding: const EdgeInsets.all(15.0),
          title: const Text("Creed I"),
          subtitle: const Text("Muito bom!!!"),
          leading: FittedBox(            
          fit: BoxFit.fill,          
          child: Image.network('https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcSXGAEcmNISelKVvPVjiQW3DHFJlY9Ncat0_A8t4aF6UYszbCNB')
          ),
          trailing: FittedBox(
          fit: BoxFit.fill,
          child: Row(
          children: const <Widget>[
            Icon(Icons.star),
            Icon(Icons.star),
            Icon(Icons.star),
            Icon(Icons.star_half),
            Icon(Icons.star_border),
          ],
          ),
        ),
          onTap: (){},
        ),
        ListTile(
          contentPadding: const EdgeInsets.all(15.0),
          title: const Text("Creed II"),
          subtitle: const Text("O melhor de todos, foda demais!"),
          leading: FittedBox(            
          fit: BoxFit.fill,          
          child: Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSlv4l4a8cwicapG4q1R3syDlepV7O-7-P2VhcSgJHWYjiKgnss')
          ),
          trailing: FittedBox(
          fit: BoxFit.fill,
          child: Row(
          children: const <Widget>[
            Icon(Icons.star),
            Icon(Icons.star),
            Icon(Icons.star),
            Icon(Icons.star),
            Icon(Icons.star_border),
          ],
          ),
        ),
          onTap: (){},
        ),
        ListTile(
          contentPadding: const EdgeInsets.all(15.0),
          title: const Text("Creed III"),
          subtitle: const Text("Faltou o Rocky"),
          leading: FittedBox(            
          fit: BoxFit.fill,          
          child: Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSGJmpojhOWQFz93yVXm24txNjXKQMIu60CZMep0NMb&usqp=CAE&s')
          ),
          trailing: FittedBox(
          fit: BoxFit.fill,
          child: Row(
          children: const <Widget>[
            Icon(Icons.star),
            Icon(Icons.star),
            Icon(Icons.star),
            Icon(Icons.star_border),
            Icon(Icons.star_border),
          ],
          ),
        ),
          onTap: (){},
        ),
        ListTile(
          contentPadding: const EdgeInsets.all(15.0),
          title: const Text("John Wick - De volta ao jogo"),
          subtitle: const Text("O cara é brabo demais"),
          leading: FittedBox(            
          fit: BoxFit.fill,          
          child: Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQk7voNRRu6463-4p0g96EcyFloooEsFwqj0_eUet8CBymO-uBp')
          ),
          trailing: FittedBox(
          fit: BoxFit.fill,
          child: Row(
          children: const <Widget>[
            Icon(Icons.star),
            Icon(Icons.star),
            Icon(Icons.star),
            Icon(Icons.star_half),
            Icon(Icons.star_border),
          ],
          ),
        ),
          onTap: (){},
        ), 
        ListTile(
          contentPadding: const EdgeInsets.all(15.0),
          title: const Text("John Wick - Um novo dia para matar"),
          subtitle: const Text("Sensacional! O melhor dos quatro."),
          leading: FittedBox(            
          fit: BoxFit.fill,          
          child: Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQKVmgRV186D_SVV69Pnvh1boyGPy0HaDoUMN--v6C9mooaSlzq')
          ),
          trailing: FittedBox(
          fit: BoxFit.fill,
          child: Row(
          children: const <Widget>[
            Icon(Icons.star),
            Icon(Icons.star),
            Icon(Icons.star),
            Icon(Icons.star),
            Icon(Icons.star_half),
          ],
          ),
        ),
          onTap: (){},
        ),
        ListTile(
          contentPadding: const EdgeInsets.all(15.0),
          title: const Text("John Wick - Parabellum"),
          subtitle: const Text("Não é tao bom quanto o 2, mas é foda também."),
          leading: FittedBox(            
          fit: BoxFit.fill,          
          child: Image.network('https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcQE5yMnEb0MQgXjw_a2VustPbw6LJ7wGnPo6Cx4g3uzeJyVEhXH')
          ),
          trailing: FittedBox(
          fit: BoxFit.fill,
          child: Row(
          children: const <Widget>[
            Icon(Icons.star),
            Icon(Icons.star),
            Icon(Icons.star),
            Icon(Icons.star),
            Icon(Icons.star_border),
          ],
          ),
        ),
          onTap: (){},
        ),
        ListTile(
          contentPadding: const EdgeInsets.all(15.0),
          title: const Text("Barbie e o Castelo de Diamantes"),
          subtitle: const Text("O melhor filme do mundo!"),
          leading: FittedBox(            
          fit: BoxFit.fill,          
          child: Image.network('https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcRT_19Rz8gH_okvE6ZWs0ribMr_hMa5CspEsA04V-SLhPKPDaSc')
          ),
          trailing: FittedBox(
          fit: BoxFit.fill,
          child: Row(
          children: const <Widget>[
            Icon(Icons.star),
            Icon(Icons.star),
            Icon(Icons.star),
            Icon(Icons.star),
            Icon(Icons.star),
          ],
          ),
        ),
          onTap: (){},
        )
      ],
    );
  }
}*/

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:trabalho1/screens/cadastro.dart';

import '../bloc/manage_db_bloc.dart';
import '../bloc/monitor_db_bloc.dart';
import '../model/note_collection.dart';
import 'cadastro.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';

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
    return SingleChildScrollView(
      child: Column(
        children: [
          Text(filePNG),
          ClipRRect(child: Image.network(userImageUrl)),
        ],
      ),
    );
  }
}
 /*BlocBuilder<MonitorBloc, MonitorState>(builder: (context, state) {
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
    });*/
