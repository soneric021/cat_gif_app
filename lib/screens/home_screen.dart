import 'package:cat_gif_app/bloc/bloc_cat/cat_bloc.dart';
import 'package:cat_gif_app/components/cat_gif.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    context.read<CatBloc>().add(LoadCatEvent());
    return Scaffold(
      body: Container(
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/background.jpg"), fit: BoxFit.cover)),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const SizedBox(
            width: double.infinity,
            height: 600,
            child: CatGif(),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 20),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(shape: const StadiumBorder()),
              onPressed: () {
                context.read<CatBloc>().add(LoadCatEvent());
              },
              child: const Text('Meow!'),
            ),
          )
        ]),
      ),
    );
  }
}
