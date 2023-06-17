import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rumeysa_21070690018_finish_project/screen/add.pet.screen.dart';
import 'package:rumeysa_21070690018_finish_project/screen/advert.screen.dart';
import 'package:rumeysa_21070690018_finish_project/screen/home.screen.dart';
import 'package:rumeysa_21070690018_finish_project/screen/login.screen.dart';
import 'package:rumeysa_21070690018_finish_project/screen/pet.info.screen.dart';
import 'package:rumeysa_21070690018_finish_project/screen/profile.screen.dart';
import 'package:rumeysa_21070690018_finish_project/screen/register.screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      showSemanticsDebugger: false,
      debugShowMaterialGrid: false,
      routes: {
        '/login': (context) => const LoginScreen(title: "Giriş Yap"),
        '/home': (context) => const HomeScreen(title: 'Anasayfa'),
        '/register': (context) => const RegisterScreen(title: "Kaydol"),
        '/advert': (context) => const AdvertScreen(title: "İlanlar"),
        '/add': (context) =>  const AddPetScreen(title: "İlan Ekle"),
        '/profile': (context) =>  const ProfileScreen(title: "Profil"),
        '/pet': (context) => const petInfoScreen(title: "İlan Detayı"),
      },

      initialRoute: "/login",
      title: 'Flutter App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xff7A6D72)),
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
      ),
    );
  }
}
