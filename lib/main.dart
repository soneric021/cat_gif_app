import 'package:cat_gif_app/model/cat_repository.dart';
import 'package:cat_gif_app/screens/home_screen.dart';
import 'package:cat_gif_app/viewmodel/cat_view_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: CatViewModel(CatRepository()))
      ],
      child: MaterialApp(
        title: 'Cat Gif App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomeScreen(),
      ),
    );
  }
}
