import 'dart:ffi';

import 'package:flutter/material.dart';
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

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: SingleChildScrollView(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "BİLGİLER",
                    textAlign: TextAlign.start,
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w800),
                  ),
                  Text(
                    "Name: ${Auth.user?.name}",
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    "Surname: ${Auth.user?.surname}",
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    "Email: ${Auth.user?.email}",
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  ElevatedButton(onPressed: (){
                    Advert.resetAdvert();
                  }, child: Text("Reset"))
                ],
              ),
            ),
          ],
        )),
        bottomNavigationBar: bottomBar(context));
  }
}
