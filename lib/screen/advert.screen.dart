import 'dart:ffi';

import 'package:flutter/material.dart';
import '../components/bottom.bar.dart';
import '../components/card.advert.dart';

class AdvertScreen extends StatefulWidget {
  const AdvertScreen({super.key, required this.title});
  final String title;
  @override
  State<AdvertScreen> createState() => _AdvertScreenState();
}

class _AdvertScreenState extends State<AdvertScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: SingleChildScrollView(
            child: Column(
          children: [
            cardAdvert(context,"name",12,"sdsad","dsasa"),
            cardAdvert(context,"name",12,"sdsad","dsasa"),
            cardAdvert(context,"name",12,"sdsad","dsasa"),
            cardAdvert(context,"name",12,"sdsad","dsasa"),
            cardAdvert(context,"name",12,"sdsad","dsasa"),
            cardAdvert(context,"name",12,"sdsad","dsasa"),
            cardAdvert(context,"name",12,"sdsad","dsasa"),
            cardAdvert(context,"name",12,"sdsad","dsasa"),
            cardAdvert(context,"name",12,"sdsad","dsasa"),
            cardAdvert(context,"name",12,"sdsad","dsasa"),
            cardAdvert(context,"name",12,"sdsad","dsasa"),
          ],
        )),
        bottomNavigationBar: bottomBar(context));
  }
}
