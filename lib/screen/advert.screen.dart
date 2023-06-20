import 'package:flutter/material.dart';
import 'package:rumeysa_21070690018_finish_project/models/advert.dart';
import '../components/bottom.bar.dart';
import '../components/card.advert.dart';
class AdvertScreen extends StatefulWidget {
  const AdvertScreen({super.key, required this.title});
  final String title;
  @override
  State<AdvertScreen> createState() => _AdvertScreenState();
}
class _AdvertScreenState extends State<AdvertScreen> {
  Future<List<dynamic>?>? adverts;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: FutureBuilder<List<AdvertItem>>(
          future: Advert.getAdverts(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              // While waiting for the future to complete, show a loading indicator
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              // If an error occurred while fetching the data, display an error message
              return Text('Error: ${snapshot.error}');
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              // If no data is available, display a message indicating no adverts
              return Text('No adverts available');
            } else {
              // If data is available, build the list of adverts using ListView.builder
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  final advertItem = snapshot.data![index];
                  return cardAdvert(context,advertItem);
                },
              );
            }
          },
        ),
        bottomNavigationBar: bottomBar(context));
  }
}



