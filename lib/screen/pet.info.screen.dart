import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:rumeysa_21070690018_finish_project/hook/file.helper.dart';
import 'package:rumeysa_21070690018_finish_project/models/advert.dart';
import '../components/bottom.bar.dart';
import 'package:url_launcher/url_launcher.dart';

class petInfoScreen extends StatefulWidget {
  const petInfoScreen({super.key, required this.title});

  final String title;

  @override
  State<petInfoScreen> createState() => _petInfoScreenState();
}

Future<void> _launchPhoneCall(String? phoneNumber) async {
  print(phoneNumber);

  var url = Uri(host: phoneNumber, scheme: 'tel');
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    throw 'Arama başlatılamadı: $url';
  }
}

const listTextStyle = TextStyle(fontSize: 18, fontWeight: FontWeight.w500);
class _petInfoScreenState extends State<petInfoScreen> {
  List<int> imageBytes = (Advert.selectedAdvert?.image != null
      ? base64Decode(Advert.selectedAdvert!.image!)
      : [0]);
  @override


  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      bottomNavigationBar: bottomBar(context),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image
            (Advert.selectedAdvert?.image != null)
                ? SizedBox(
                    width: double.infinity,
                    height: 250,
                    child: Image.memory(Uint8List.fromList(imageBytes),
                        fit: BoxFit.cover),
                  )
                : const Text(''),
            Center(
              child: Text(
                Advert.selectedAdvert!.name!,
                textAlign: TextAlign.center,
                style:
                    const TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
              ),
            ),
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
                  ListTile(
                    title: const Text(
                      "Yaş",
                      style: listTextStyle,
                    ),
                    subtitle: Text("${Advert.selectedAdvert?.age}",
                        style: listTextStyle),
                  ),
                  ListTile(
                    title: const Text("Kilo", style: listTextStyle),
                    subtitle: Text(
                      "${Advert.selectedAdvert?.kilo}",
                      style: listTextStyle,
                    ),
                  ),
                  ListTile(
                    title: const Text(
                      "Cins",
                      style: listTextStyle,
                    ),
                    subtitle: Text("${Advert.selectedAdvert?.genus}",
                        style: listTextStyle),
                  ),
                  ListTile(
                    title: const Text(
                      "Cinsiyet",
                      style: listTextStyle,
                    ),
                    subtitle: Text(
                      "${Advert.selectedAdvert?.gender}",
                      style: listTextStyle,
                    ),
                  ),
                  ListTile(
                    title: const Text(
                      "Hakkinda",
                      style: listTextStyle,
                    ),
                    subtitle: Text(
                      "${Advert.selectedAdvert?.bio}",
                      style: listTextStyle,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _launchPhoneCall(Advert.selectedAdvert?.phone);
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    child: const SizedBox(
                      height: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.phone, size: 25, color: Colors.black),
                          Text(
                            "İLETİŞİM",
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
