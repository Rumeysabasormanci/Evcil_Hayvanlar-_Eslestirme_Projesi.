import 'package:flutter/material.dart';
import '../components/bottom.bar.dart';
import '../components/post.card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.title});
  final String title;
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body:  const Center(
        child: Column(
          children: [
            PostCard(age: "5", sex: "tras", weight: "eadw", title: "dea", image: "dwdaw"),
          ],
        )
      ),
      bottomNavigationBar: bottomBar(context)
    );
  }
}
