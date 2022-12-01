import 'package:flutter/material.dart';

class AppbarNew extends StatelessWidget {
  final String title;
   const AppbarNew({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
          ),
          Icon(Icons.menu)
        ],
      ),
    );
  }
}
