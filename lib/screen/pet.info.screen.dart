import 'dart:ffi';

import 'package:flutter/material.dart';
import '../components/bottom.bar.dart';
import '../components/card.advert.dart';

class petInfoScreen extends StatefulWidget {
  const petInfoScreen({super.key,
    required this.title,
    required this.Age,
    required this.Kilo,
    required this.Genus,
    required this.Gender
  });

  final String title;
  final int? Age;
  final double? Kilo;
  final String Genus;
  final String Gender;
  @override
  State<petInfoScreen> createState() => _petInfoScreenState();
}

class _petInfoScreenState extends State<petInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body:  SingleChildScrollView(

            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Image(image: AssetImage('assets/kopus.jpeg'),  height: 250, fit: BoxFit.cover),
                const Text("ALEX", textAlign: TextAlign.center,style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold), ),
                Container(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                       const Text("BİLGİLER",textAlign: TextAlign.start,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
                       Text("Yaş: ${widget.Age}", style: TextStyle(fontSize: 18),),
                       Text("Kilo: ${widget.Kilo}", style: TextStyle(fontSize: 18),),
                       Text("Cins: ${widget.Genus}", style: TextStyle(fontSize: 18),),
                       Text("Cinsiyet: ${widget.Gender}", style: TextStyle(fontSize: 18),),
                       const Text("İletişim Bilgileri",textAlign: TextAlign.start,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
                      ElevatedButton(onPressed: (){},
                          child: const Row(
                            children: [
                              Icon(Icons.phone, size: 25, color: Colors.black),
                          Text("İLETİŞİM"),
                            ],
                          ))
                    ],
                  ),
                ),
              ],
            )),
        bottomNavigationBar: bottomBar(context));
  }
}
 