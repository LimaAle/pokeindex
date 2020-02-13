import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokindex/app/modules/home/home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "First"}) : super(key: key);

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
        body: Column(
          children: <Widget>[
            // Expanded(
            //   child: ListView(
            //     children: <Widget>[
            //       Image.asset(
            //         'assets/arcanine.png',
            //       ),
            //       Image.asset(
            //         'assets/ninetales.png',
            //       ),
            //       Image.asset(
            //         'assets/bulbasaur.gif',
            //       )
            //     ],
            //   ),
            // ),
            Expanded(
              child: Observer(
                builder: (_) {
                  if (homeController.pokemon.error != null) {
                    return Center(
                      child: Text('Error'),
                    );
                  }
                  if (homeController.pokemon.value == null) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  var list = homeController.pokemon.value;
                  return GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 2.0,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: list.length,
                      itemBuilder: (_, index) {
                        return Container(
                          margin: EdgeInsets.symmetric(horizontal: 20),
                          decoration: BoxDecoration(
                              color: Colors.amber,
                              borderRadius: BorderRadius.circular(20)),
                          child: Column(
                            children: <Widget>[
                              Text(list[index].name),
                              FractionallySizedBox(
                                alignment: Alignment.centerRight,
                                widthFactor: 0.5,
                                child: Image.asset(
                                  'assets/bulbasaur.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ],
                          ),
                        );
                      });
                },
              ),
            ),
          ],
        ));
  }
}
