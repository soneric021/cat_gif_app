import 'package:cat_gif_app/components/cat_gif.dart';
import 'package:cat_gif_app/model/api/api_response.dart';
import 'package:cat_gif_app/viewmodel/cat_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ApiResponse _apiResponse = Provider.of<CatViewModel>(context).response;
    return Scaffold(
      body: Container(
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/background.jpg"), fit: BoxFit.cover)),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
            margin: const EdgeInsets.only(top: 200),
            child: SizedBox(
              width: double.infinity,
              height: 200,
              child: Container(
                child: getCatGif(context, _apiResponse),
              ),
            ),
          ),
          const Spacer(),
          ElevatedButton(
            onPressed: () => {
              Provider.of<CatViewModel>(context, listen: false).fetchCatData()
            },
            child: const Text('Meow!'),
          )
        ]),
      ),
    );
  }
}
