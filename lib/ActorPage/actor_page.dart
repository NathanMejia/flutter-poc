
import 'package:demo_arq/ActorPage/actor.dart';
import 'package:demo_arq/ActorPage/form.dart';
import 'package:demo_arq/cubit/general_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: BlocListener<MainCubit, ActorState>(
        listenWhen: (previous, current) => current is ErrorActorState,
        
        listener: (context, state) => 
          ScaffoldMessenger.of(context).showMaterialBanner(myMaterialBanner(context)),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [ 
            Actor(),
           MyForm() ],
      ),
    ));
  }
}


MaterialBanner myMaterialBanner(BuildContext context){
    return MaterialBanner(
      backgroundColor: const Color.fromARGB(255, 255, 129, 120),
      content: const Text("Ha ocurrido un Error"), 
      actions: [IconButton(onPressed: (){
        ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
      }, icon: const Icon(Icons.close))]);
}



