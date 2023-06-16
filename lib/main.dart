import 'package:flutter/material.dart';
import 'package:rumeysa_21070690018_finish_project/screen/add.pet.screen.dart';
import 'package:rumeysa_21070690018_finish_project/screen/advert.screen.dart';
import 'package:rumeysa_21070690018_finish_project/screen/home.screen.dart';
import 'package:rumeysa_21070690018_finish_project/screen/login.screen.dart';
import 'package:rumeysa_21070690018_finish_project/screen/pet.info.screen.dart';
import 'package:rumeysa_21070690018_finish_project/screen/register.screen.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      showSemanticsDebugger: false,

      routes: {
        '/': (context) => const HomeScreen(title: 'Home Page'),
        '/login': (context) => const LoginScreen(title: "login"),
        '/register': (context) => const RegisterScreen(title: "register"),
        '/advert': (context) => const AdvertScreen(title: "Advert"),
        '/add': (context) =>  AddPetScreen(title: "add"),
        '/pet': (context) => petInfoScreen(title: "pet", Age: 12, Kilo:13.0, Gender: "kadın",Genus: "golden",About: "blabla",),
      },
      initialRoute: "/",
      title: 'Flutter App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xff7A6D72)),
      ),
    );

  // selam :)

  }
}

