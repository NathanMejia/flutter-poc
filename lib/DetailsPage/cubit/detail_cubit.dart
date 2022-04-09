import 'dart:async';
import 'package:demo_arq/cubit/general_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'detail_state.dart';

class DetailCubit extends Cubit<DetailState> {

  String algo = "HOLA MUNDO";


  BuildContext context;
  late StreamSink generalCubitSink;

  DetailCubit(this.context) : super(DetailInitial()){

    generalCubitSink = context.read<MainCubit>().sinkCubitStream;



  }
}
