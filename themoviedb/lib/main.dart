import 'package:flutter/material.dart';
import 'package:themoviedb/source/base/block_provider.dart';
import 'package:themoviedb/source/screen/ui/mainscreen/main_screen_bloc.dart';
import 'package:themoviedb/source/screen/ui/mainscreen/mainscreen.dart';

void main() => runApp(MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: BlocProvider<MainScreenBloc>(
        bloc: MainScreenBloc(),
        child: MainWidget(),
      ),
    ));
