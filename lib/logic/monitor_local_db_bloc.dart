import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trabalho1/data/local/local_database.dart';

import '../model/collection/review_collection.dart';
import 'monitor_local_db_event.dart';
import 'monitor_local_db_state.dart';

class MonitorBloc extends Bloc<MonitorEvent, MonitorState> {
  MonitorBloc(): super(MonitorState(reviewCollection: ReviewCollection())){
    add(AskNewList());
  } 


  Stream<MonitorState> mapEventToState(MonitorEvent event) async* {
    if (event is AskNewList) {
      ReviewCollection reviewCollection = 
        await DatabaseLocalServer.helper.getReviewList();
      yield MonitorState(reviewCollection: reviewCollection);
    }
  }  
  
}




