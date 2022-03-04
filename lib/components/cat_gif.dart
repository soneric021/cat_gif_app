import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/api/api_response.dart';
import '../viewmodel/cat_view_model.dart';

Widget getCatGif(BuildContext context, ApiResponse apiResponse) {
  switch (apiResponse.status) {
    case Status.INITIAL:
      Provider.of<CatViewModel>(context, listen: false).fetchCatData();
      return const Center(
        child: Text('Buscando gif de gatos'),
      );

    case Status.LOADING:
      return const Center(child: CircularProgressIndicator());

    case Status.COMPLETED:
      var _cat = apiResponse.data;
      const String _baseUrl = "https://cataas.com";
      return Center(
        child: CachedNetworkImage(
            imageUrl: _baseUrl + _cat.url,
            placeholder: (context, url) => const CircularProgressIndicator(),
            errorWidget: (context, url, error) => const Icon(Icons.error)),
      );

    case Status.ERROR:
      return const Center(
        child: Text('Por favor intentalo denuevo!'),
      );
  }
}
