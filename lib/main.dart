import 'package:demo_arq/DetailsPage/details_page.dart';
import 'package:demo_arq/cubit/general_cubit.dart';
import 'package:demo_arq/ActorPage/actor_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(const MyApp());


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MainCubit(),
      child: MaterialApp(
        theme: ThemeData.dark(),
        debugShowCheckedModeBanner: false,
        initialRoute: "home",
        routes: {
          "home"   : (context) => const HomePage(),
          "details": (context) => const DetailsPage()  
        },
      ),
    );
  }
}
