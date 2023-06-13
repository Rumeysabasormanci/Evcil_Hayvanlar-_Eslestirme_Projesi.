import 'package:flutter/material.dart';

import '../hook/navigation.helper.dart';

class PostCard extends StatefulWidget {
  const PostCard({super.key,
    required this.title,
    required this.age,
    required this.image,
    required this.weight,
    required this.sex,
  });
  final String title;
  final String image;
  final String age;
  final String weight;
  final String sex;
  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 300,
          height: 300,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.grey[300],
          ),
          child: Center(
            child: Icon(
              Icons.pets,
              size: 200,
              color: Colors.black,
            ),
          ),
        ),
        SizedBox(height: 45),
        Text(
          'EN UYGUN EŞİ BUL',
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(height: 65),
        ElevatedButton(
          onPressed: () => goPage(context,"advert"),
          child: Text('KEŞFET'),
        ),
      ],
    );
  }
}
