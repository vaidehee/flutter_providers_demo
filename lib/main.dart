import 'package:flutter/material.dart';
import 'package:flutter_providers/provider_class/app_state.dart';
import 'package:flutter_providers/ui/home_screen.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Providers',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChangeNotifierProvider<AppStateClass>(
        child: HomeScreenProviders(),
        create: (_)=> AppStateClass(),
      ),
    );
  }
}


