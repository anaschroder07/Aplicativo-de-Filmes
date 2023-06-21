import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trabalho1/bloc/reviews_bloc.dart';

import '../data/local/local_database.dart';

Future<ListView> getReviewListView({int delete = 1}) async {
  ReviewDataProvider reviewList = ReviewDataProvider();
  final reviews = await reviewList.listarReviews();
  return ListView.builder(
    itemCount: delete == 0 ? reviews.length - 1 : reviews.length,
    itemBuilder: (context, index) {
      return ListTile(
        title: Text(reviews[index]),
        trailing: SizedBox(
          width: 100,
          child: Row(children: [
            IconButton(
                onPressed: () {
                  BlocProvider.of<ReviewsBloc>(context)
                      .add(RemoveReviewsEvent(reviews[index]));
                  getReviewListView(delete: 0);
                },
                icon: const Icon(Icons.delete))
          ]),
        ),
      );
    },
  );
}

class Assistidos extends StatelessWidget {
  const Assistidos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReviewsBloc, ReviewsState>(
      builder: (context, state) {
        return FutureBuilder<ListView>(
          future: getReviewListView(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Ocorreu um erro ao carregar as avaliações.');
            } else {
              return snapshot.data ?? Placeholder();
            }
          },
        );
      },
    );
  }
}
