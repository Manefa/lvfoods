import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ivfoods_mobile_app/constants.dart';
import 'package:ivfoods_mobile_app/routes.dart';
import 'core/utils/simple_bloc_delegate.dart';
import 'injection_container.dart' as di;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  Bloc.observer = SimpleBlocDelegate();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lv food',
      debugShowCheckedModeBanner: false,
      color: kPrimaryColor,
      initialRoute: "/",
      routes: routes,
    );
  }
}
