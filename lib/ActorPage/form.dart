import 'package:demo_arq/cubit/general_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyForm extends StatelessWidget {
  const MyForm({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    TextEditingController txtController = TextEditingController();
    
    return Column(
      children: [

        TextInput(txtController: txtController),
        MyButton(txtController: txtController),

      ],
    );
  }
}

class DemoTexto extends StatelessWidget {
  const DemoTexto({
    Key? key,
    required this.miIcono,
    required this.miTexto
  }) : super(key: key);

  final IconData miIcono;
  final String miTexto;

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
      icon: Icon(miIcono),
      label: Text(miTexto),
      
    ),);
  }
}

class MyButton extends StatelessWidget {
  const MyButton({
    Key? key,
    required this.txtController,
  }) : super(key: key);

  final TextEditingController txtController;



  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: const Text("Enviar"),


      onPressed: (){

        final value = txtController.text;

        final actorCubit = context.read<MainCubit>();
        
        actorCubit.getActorById(value);
      },
       
    );
  }


}
//==================================================================

class TextInput extends StatelessWidget {
  const TextInput({
    Key? key,
    required this.txtController,
  }) : super(key: key);

  final TextEditingController txtController;

  @override
  Widget build(BuildContext context) {
    return Padding(
     padding: const EdgeInsets.all(12.0),
     child: TextField(
       controller: txtController,
       decoration: const InputDecoration(
         label: Text("Ingrese numero del 1 al 50")
       ),
     ),
        );
  }
}


