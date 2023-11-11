import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taggame/log.dart';
import 'package:taggame/pages/home/home_page_cubit_state.dart';

const _tag = 'home_page_cubit';

class HomePageCubit extends Cubit<HomePageCubitState> {
  HomePageCubit()
      : super(
          HomePageCubitState((b) => b),
        ) {
    _init();
  }

  void _init() {
    Log.d(_tag, '_init');
  }
}
