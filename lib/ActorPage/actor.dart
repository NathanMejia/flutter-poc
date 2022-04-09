import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/general_cubit.dart';
import '../model/actor_model.dart';

class Actor extends StatelessWidget {
  const Actor({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainCubit, ActorState>(

      buildWhen: (previous, current) =>
          current is LoadingActorState ||
          current is ReadyActorState   ||
          current is ErrorActorState,

      builder: (context, state) {
        
        if (state is LoadingActorState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (state.actorModel != null) {
          return ActorWidget(
            actorModel: state.actorModel!,
          );
        }
        return const Placeholder(fallbackHeight: 300,);
      },
    );
  }
}

class ActorWidget extends StatelessWidget {
  const ActorWidget({Key? key, required this.actorModel}) : super(key: key);

  final ActorModel actorModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.network(
          actorModel.img,
          height: 300,
        ),
        
        TextButton(
          onPressed: () => Navigator.pushNamed(context, "details"),
          child:  const Text("DETAILS HERE!"))
      ],
    );
  }
}

class AppCoordinator {

  static goToScreen(BuildContext context, String pageName){

    Navigator.pushNamed(context, pageName);

  }
}