import 'package:cat_gif_app/bloc/bloc_cat/cat_bloc.dart';
import 'package:cat_gif_app/di/injection_container.dart';
import 'package:cat_gif_app/model/cat_repository.dart';
import 'package:cat_gif_app/screens/home_screen.dart';
import 'package:cat_gif_app/viewmodel/cat_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

void main() {
  init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cat Gif App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(create: (context) => CatBloc(), child: HomeScreen()),
    );
  }
}
