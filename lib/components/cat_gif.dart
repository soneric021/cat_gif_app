import 'package:cached_network_image/cached_network_image.dart';
import 'package:cat_gif_app/bloc/bloc_cat/cat_bloc.dart';
import 'package:cat_gif_app/components/choice_option.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../model/Cat.dart';

class CatGif extends StatelessWidget {
  const CatGif({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CatBloc, CatState>(builder: (context, state) {
      if (state is CatLoadingState) {
        return const Center(
            child: CircularProgressIndicator(backgroundColor: Colors.grey));
      }

      if (state is CatCompletedState) {
        Cat _cat = state.cat;
        const String _baseUrl = "https://cataas.com";
        return Column(children: [
          CachedNetworkImage(
              imageUrl: _baseUrl + _cat.url!,
              placeholder: (context, url) =>
                  const CircularProgressIndicator(backgroundColor: Colors.grey),
              errorWidget: (context, url, error) => const Icon(Icons.error)),
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _cat.tags!
                      .map((filter) => ChoiceOption(text: filter))
                      .toList(),
                )),
          )
        ]);
      }

      if (state is CatErrorState) {
        print(state.messageError);
        return const Center(
          child: Text('Por favor intentalo denuevo!'),
        );
      }

      return Container();
    });
  }
}
