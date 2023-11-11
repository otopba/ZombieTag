import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:taggame/app/app.dart';
import 'package:taggame/di.dart';
import 'package:taggame/repos/shared_preferences_repository.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  await SharedPreferencesRepository.instance.init();

  await di.setup();

  runApp(const App());
}

