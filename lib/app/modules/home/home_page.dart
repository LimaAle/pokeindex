import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokindex/app/modules/home/home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final homeController = Modular.get<HomeController>();
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Observer(
          builder: (_) {
            if(homeController.pokemon.error != null){
              return Center(
                child: Text('Error'),
              );
            }
            if(homeController.pokemon.value == null){
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            var list = homeController.pokemon.value;
            return ListView.builder(
                itemCount: list.length, itemBuilder: (_, index) {
                  return ListTile(
                    title: Text(list[index].name),
                  );
                });
          },
        ));
  }
}
