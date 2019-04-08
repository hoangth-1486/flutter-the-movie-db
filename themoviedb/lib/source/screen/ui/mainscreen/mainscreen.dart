import 'package:flutter/material.dart';
import 'package:themoviedb/source/base/block_provider.dart';
import 'package:themoviedb/source/screen/ui/mainscreen/main_screen_bloc.dart';

class MainWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MainWidgetState();
  }
}

class MainWidgetState extends State<MainWidget> {
  final _widgetOptions = [
    Text('Index 0: Home'),
    Text('Index 1: Business'),
    Text('Index 2: School')
  ];

  @override
  Widget build(BuildContext context) {
    final MainScreenBloc mainBloc = BlocProvider.of<MainScreenBloc>(context);
    return StreamBuilder<int>(
        initialData: 0,
        stream: mainBloc.selectedBottomNavigation.stream,
        builder: (BuildContext contex, AsyncSnapshot<int> snapshot) {
          return Scaffold(
              appBar: AppBar(
                title: Text("The Movie DB"),
              ),
              body: Center(
                child: _widgetOptions.elementAt(snapshot.data),
              ),
              bottomNavigationBar: BottomNavigationBar(
                items: <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                      icon: Icon(Icons.home),
                      title: Text("Movie"),
                      backgroundColor: Colors.grey[850]),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.queue_music), title: Text("Music")),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.favorite), title: Text("Favorite")),
                ],
                currentIndex: snapshot.data,
                fixedColor: Colors.deepOrange,
                onTap: (int selected) {
                  mainBloc.selectedBottomNavigation.sink.add(selected);
                },
              ));
        });
  }
}
