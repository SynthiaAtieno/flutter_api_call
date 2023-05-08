import 'package:flutter/material.dart';
import 'package:flutter_api_practice/pages/home_page.dart';
import 'package:flutter_api_practice/provider/pets_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PetsProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'My Api Call',
        theme: ThemeData(
          primaryColor: Colors.blue,
          fontFamily: 'Georgia',
        ),
        home: const HomePage(),
      ),
    );
  }
}
