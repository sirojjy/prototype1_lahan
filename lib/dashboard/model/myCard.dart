import 'package:flutter/material.dart';
import 'package:prototype1_lahan/share/item.dart';

class MyCard extends StatelessWidget {

  const MyCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Color(0xFF0AC9B1),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('IPAL',
            style: TextStyle(
              color: whiteColor,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          Row(
            children: [
              Text('300',
                style: TextStyle(
                  color: whiteColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                ),
              ),
              Text(' Bidang',
                style: TextStyle(
                  color: whiteColor,
                  fontSize: 15,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('300.000 m2',
                style: TextStyle(
                  color: whiteColor,
                  fontSize: 15,
                ),
              ),
              Text('Rp. 300.000.000.000',
                style: TextStyle(
                  color: whiteColor,
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
