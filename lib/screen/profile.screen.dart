import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:rumeysa_21070690018_finish_project/hook/navigation.helper.dart';
import 'package:rumeysa_21070690018_finish_project/models/advert.dart';
import 'package:rumeysa_21070690018_finish_project/models/auth.dart';
import '../components/bottom.bar.dart';
import '../components/card.advert.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key, required this.title});
  final String title;
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

const listTextStyle = TextStyle(fontSize: 18, fontWeight: FontWeight.w500);
class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/login5.jpeg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "BİLGİLER",
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w800),
                ),
                ListTile(
                  title: const Text(
                    "İsim",
                    style: listTextStyle,
                  ),
                  subtitle: Text("${Auth.user?.name}", style: listTextStyle),
                ),
                ListTile(
                  title: const Text("Soyisim", style: listTextStyle),
                  subtitle: Text(
                    "${Auth.user?.surname}",
                    style: listTextStyle,
                  ),
                ),
                ListTile(
                  title: const Text(
                    "E-mail",
                    style: listTextStyle,
                  ),
                  subtitle: Text("${Auth.user?.email}", style: listTextStyle),
                ),
                ElevatedButton(
                  onPressed: () => goPage(context, "login"),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                  ),
                  child: const SizedBox(
                    height: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Çıkış Yap",
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )),
          ),
        ),
        bottomNavigationBar: bottomBar(context));
  }
}
