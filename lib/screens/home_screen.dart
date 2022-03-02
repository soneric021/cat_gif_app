import 'package:cached_network_image/cached_network_image.dart';
import 'package:cat_gif_app/model/api/api_response.dart';
import 'package:cat_gif_app/model/cat.dart';
import 'package:cat_gif_app/viewmodel/cat_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Widget getCatGift(BuildContext context, ApiResponse apiResponse) {
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
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => Icon(Icons.error)),
        );
      case Status.ERROR:
        return const Center(
          child: Text('Por favor intentalo denuevo!'),
        );
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ApiResponse _apiResponse = Provider.of<CatViewModel>(context).response;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cat GIFF APP"),
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        getCatGift(context, _apiResponse),
        ElevatedButton(
          onPressed: () => {
            Provider.of<CatViewModel>(context, listen: false).fetchCatData()
          },
          child: const Text('Meow!'),
        )
      ]),
    );
  }
}