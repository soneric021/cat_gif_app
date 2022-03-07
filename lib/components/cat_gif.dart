import 'package:cached_network_image/cached_network_image.dart';
import 'package:cat_gif_app/components/choice_option.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/Cat.dart';
import '../model/api/api_response.dart';
import '../viewmodel/cat_view_model.dart';

class CatGif extends StatelessWidget {
  final apiResponse;
  const CatGif({this.apiResponse, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (apiResponse.status) {
      case Status.INITIAL:
        Provider.of<CatViewModel>(context, listen: false).fetchCatData();
        return const Center(
          child: Text('Buscando gif de gatos'),
        );

      case Status.LOADING:
        return const Center(
            child: CircularProgressIndicator(backgroundColor: Colors.grey));

      case Status.COMPLETED:
        Cat _cat = apiResponse.data as Cat;
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

      case Status.ERROR:
        return const Center(
          child: Text('Por favor intentalo denuevo!'),
        );
      default:
        return const Center(
          child: Text('Por favor intentalo denuevo!'),
        );
    }
  }
}
