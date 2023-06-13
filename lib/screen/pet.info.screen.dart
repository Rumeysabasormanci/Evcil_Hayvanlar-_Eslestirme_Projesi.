import 'dart:ffi';

import 'package:flutter/material.dart';
import '../components/bottom.bar.dart';
import '../components/card.advert.dart';

class petInfoScreen extends StatefulWidget {
  const petInfoScreen({super.key, required this.title});
  final String title;
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
                      const Text("Yaş: ", style: TextStyle(fontSize: 18),),
                      const Text("Kilo: ", style: TextStyle(fontSize: 18),),
                      const Text("Cins: ", style: TextStyle(fontSize: 18),),
                      const Text("Cinsiyet: ", style: TextStyle(fontSize: 18),),
                      const Text("İletişim Bilgileri",textAlign: TextAlign.start,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
                      ElevatedButton(onPressed: (){},
                          child: Row(
                            children: [
                              Icon(Icons.phone, size: 25, color: Colors.black),
                          Text("İLETİŞİM")
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
