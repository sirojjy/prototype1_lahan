import 'package:flutter/material.dart';
import 'package:prototype1_lahan/share/item.dart';

class MyCard extends StatelessWidget {
  final String? titleCard;
  final String? jumlahBidang;
  final String? jumlahLuas;
  final String? jumlahNilai;
  final color;
  // final String s= num.toString().replaceAll((regex), '');

  const MyCard({Key? key,
    this.titleCard,
    this.jumlahBidang,
    this.jumlahLuas,
    this.jumlahNilai,
    this.color
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Container(
        width: 320,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(titleCard ?? '0',
              style: const TextStyle(
                color: whiteColor,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 10,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(jumlahBidang.toString(),
                  style: const TextStyle(
                    color: whiteColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                  ),
                ),
                const Text(' Bidang',
                  style: TextStyle(
                    color: whiteColor,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('$jumlahLuas m2',
                  style: const TextStyle(
                    color: whiteColor,
                    fontSize: 15,
                  ),
                ),
                Text('Rp $jumlahNilai',
                  style: const TextStyle(
                    color: whiteColor,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
