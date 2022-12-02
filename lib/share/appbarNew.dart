import 'package:flutter/material.dart';

class AppbarNew extends StatelessWidget {
  final String title;
   const AppbarNew({Key? key,
     required this.title
   }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,
          style: const TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            child: const Icon(Icons.menu),
          )
        ],
      ),
    );
  }
}
