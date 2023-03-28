import 'package:ezown_dashboard/MainContain/Components/side_menu_provider.dart';
import 'package:ezown_dashboard/MainContain/main_contain.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ezowm Dashboard',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home:ChangeNotifierProvider(
        //initiates the instance of DrawerScreenProvider from this point
        create: (context) => SideMenuProvider(),
        //the child that dynamically changes is MainScreen
        child: const MainContain(),
      ),
      //MainContain(),
    );
  }
}

