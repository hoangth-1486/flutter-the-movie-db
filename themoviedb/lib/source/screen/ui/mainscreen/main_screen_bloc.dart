import 'package:themoviedb/source/base/block_provider.dart';
import 'dart:async';

class MainScreenBloc extends BlocBase {
  StreamController selectedBottomNavigation = StreamController<int>();

  @override
  void dispose() {
    selectedBottomNavigation.close();
  }
}
