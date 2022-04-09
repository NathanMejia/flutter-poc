import 'package:demo_arq/DetailsPage/cubit/detail_cubit.dart';
import 'package:demo_arq/cubit/general_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DetailCubit(context),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Details Page"),
        ),
        body: const Content(),
      ),
    );
  }
}

class Content extends StatelessWidget {
  const Content({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<MainCubit>();
    final actorModel = cubit.state.actorModel!;

    final cubitGeneral = context.read<MainCubit>();
    final cubitDetails = context.read<DetailCubit>();
    cubitGeneral.data = cubitDetails.algo;

    return Column(
      children: [
        Image.network(
          actorModel.img,
          height: 400,
        ),
        Text("ID : ${actorModel.charId}"),
        Text(
          "Name: ${actorModel.name}",
        ),
        Text("NickName : ${actorModel.nickname}")
      ],
    );
  }
}
