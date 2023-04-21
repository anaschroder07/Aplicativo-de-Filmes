import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Assistidos extends StatelessWidget {
  const Assistidos ({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
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
          subtitle: const Text("Adonis Johnson, filho do campeão de boxe Apollo Creed, pede a Rocky Balboa, que está aposentado, para ser seu treinador.\nRocky aceita, mas tem dúvidas se Adonis tem o coração de um verdadeiro lutador."),
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
          subtitle: const Text("Adonis enfrenta o maior desafio de sua vida: um inimigo que está ligado ao passado de sua família.\nAo lado de Rocky Balboa, eles enfrentam o passado para descobrir pelo quê vale a pena lutar."),
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
          subtitle: const Text("Depois de dominar os ringues, Adonis Creed tem prosperado com sua carreira e família. Quando um amigo de infância e ex-prodígio do boxe, Damian,\nressurge após uma longa sentença na prisão, o campeão fica ansioso para provar que merece sua chance. O confronto entre ex-amigos é mais do que\napenas uma luta. Para acertar as contas, Adonis deve colocar seu futuro em risco para enfrentar Damian, um lutador que não tem nada a perder."),
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
          subtitle: const Text("John Wick é um lendário assassino de aluguel aposentado, lidando com o luto após perder o grande amor de sua vida.\nQuando um gângster invade sua casa, mata seu cachorro e rouba seu carro, ele é forçado a voltar à ativa e inicia sua vingança."),
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
          subtitle: const Text("John Wick é forçado a deixar a aposentadoria mais uma vez por causa de uma promessa antiga e viaja para Roma, com o objetivo\nde ajudar um velho amigo a derrubar uma organização secreta, perigosa e mortal de assassinos procurados em todo o mundo."),
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
          subtitle: const Text("O lendário John Wick luta para sair de Nova York quando um contrato de 14 milhões de dólares faz dele o alvo dos maiores\nassassinos do mundo."),
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
          title: const Text("John Wick - Baba Yaga"),
          subtitle: const Text("Com o preço por sua cabeça cada vez maior, o lendário assassino de aluguel John Wick leva sua luta contra o High Table global enquanto\nprocura os jogadores mais poderosos do submundo, de Nova York a Paris, do Japão a Berlim."),
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
          contentPadding: const EdgeInsets.all(15.0),
          title: const Text("Barbie e o Castelo de Diamantes"),
          subtitle: const Text("Liana e Alexa saem da sua cabana humilde para vender flores na vila e acabam conhecendo Melody, a guardiã do Castelo de Diamante.\nAs duas decidem ajudá-la a impedir que a chave do castelo seja roubada por Lídia, uma musa egoísta."),
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
}