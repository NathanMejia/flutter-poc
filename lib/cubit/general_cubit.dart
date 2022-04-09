import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:demo_arq/ApiManager/apimanager.dart';
import 'package:demo_arq/model/actor_model.dart';
import 'package:flutter/cupertino.dart';

part 'general_state.dart';

class MainCubit extends Cubit<ActorState> {



  String? data;

  StreamController mainCubitStream = StreamController();
  StreamSink get sinkCubitStream => mainCubitStream.sink;

  final _apiManager = ApiManager();

  MainCubit() : super(InitialActorState()){

    mainCubitStream.stream.listen((event) {
      
    });

  }


  void getActorById(String id)async{

   emit(LoadingActorState());

   final actorModel =  await _apiManager.fetchActorFromApiById(id);

   if(actorModel == null){
     emit(ErrorActorState());
     return;
   }

   emit(ReadyActorState(actorModel));



  }

}
