import 'package:flutter/material.dart';
import 'package:stockkkkkk/infra/configuration/injection.dart';

import 'application/adapters/flutter/home.dart';

void main() {
  setupInjection();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.deepOrange, brightness: Brightness.dark),
      home: const HomePage(title: 'Stockkkkkkkkkkkkkkkk'),
    );
  }
}
