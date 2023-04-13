import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prototype1_lahan/share/item.dart';

class TabelRicianBidang extends StatefulWidget {
  const TabelRicianBidang({Key? key}) : super(key: key);

  @override
  State<TabelRicianBidang> createState() => _TabelRicianBidangState();
}

class _TabelRicianBidangState extends State<TabelRicianBidang> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ///IPAL
        Text(
          '1. IPAL',
          textAlign: TextAlign.left,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        Container(
          width: 550,
          padding: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
            color: whiteColor,
            // borderRadius: BorderRadius.circular(15),
          ),
          child: Table(
            border: const TableBorder(
                horizontalInside: BorderSide(width: 1, color: primaryColor,),
                bottom: BorderSide(width: 1, color: primaryColor,)),
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            children: [
              TableRow(
                  decoration: const BoxDecoration(color: primaryColor),
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: const Text('Area',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: whiteColor),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const Text('Jumlah \n Bidang',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: whiteColor),
                        textAlign: TextAlign.center),
                    const Text('Luas Bidang',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: whiteColor),
                        textAlign: TextAlign.center),
                  ]),
              TableRow(decoration: const BoxDecoration(color: whiteColor), children: [
                Container(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: const Text('IPAL1 + TPST', textAlign: TextAlign.center)),
                const Text('12', textAlign: TextAlign.center),
                const Text('212.966 m2', textAlign: TextAlign.center),
              ]),
              TableRow(decoration: const BoxDecoration(color: whiteColor), children: [
                Container(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: const Text('IPAL2', textAlign: TextAlign.center)),
                const Text('19', textAlign: TextAlign.center),
                const Text('115.711 m2', textAlign: TextAlign.center),
              ]),
              TableRow(decoration: const BoxDecoration(color: whiteColor), children: [
                Container(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: const Text('IPAL3', textAlign: TextAlign.center)),
                const Text('0', textAlign: TextAlign.center),
                const Text('0 m2', textAlign: TextAlign.center),
              ]),
            ],
          ),
        ),

        ///SPAM
        Text(
          '2. SPAM',
          textAlign: TextAlign.left,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        Container(
          width: 550,
          padding: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
            color: whiteColor,
            // borderRadius: BorderRadius.circular(15),
          ),
          child: Table(
            border: const TableBorder(
                horizontalInside: BorderSide(width: 1, color: primaryColor,),
                bottom: BorderSide(width: 1, color: primaryColor,)),
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            children: [
              TableRow(
                  decoration: const BoxDecoration(color: primaryColor),
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: const Text('Area',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: whiteColor),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const Text('Jumlah \n Bidang',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: whiteColor),
                        textAlign: TextAlign.center),
                    const Text('Luas Bidang',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: whiteColor),
                        textAlign: TextAlign.center),
                  ]),
              TableRow(decoration: const BoxDecoration(color: whiteColor), children: [
                Container(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: const Text('Pipa Transmisi', textAlign: TextAlign.center)),
                const Text('79', textAlign: TextAlign.center),
                const Text('39.760 m2', textAlign: TextAlign.center),
              ]),
              TableRow(decoration: const BoxDecoration(color: whiteColor), children: [
                Container(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: const Text('IPA', textAlign: TextAlign.center)),
                const Text('40', textAlign: TextAlign.center),
                const Text('77.200 m2', textAlign: TextAlign.center),
              ]),
            ],
          ),
        ),

        ///KIPP
        Text(
          '3. KIPP',
          textAlign: TextAlign.left,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        Container(
          width: 550,
          padding: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
            color: whiteColor,
            // borderRadius: BorderRadius.circular(15),
          ),
          child: Table(
            border: const TableBorder(
                horizontalInside: BorderSide(width: 1, color: primaryColor,),
                bottom: BorderSide(width: 1, color: primaryColor,)),
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            children: [
              TableRow(
                  decoration: const BoxDecoration(color: primaryColor),
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      child: const Text('Area',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: whiteColor),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const Text('Jumlah \n Bidang',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: whiteColor),
                        textAlign: TextAlign.center),
                    const Text('Luas Bidang',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: whiteColor),
                        textAlign: TextAlign.center),
                  ]),
              TableRow(decoration: const BoxDecoration(color: whiteColor), children: [
                Container(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: const Text('KIPP IKN \n Segmen 1', textAlign: TextAlign.center)),
                const Text('73', textAlign: TextAlign.center),
                const Text('727.476 m2', textAlign: TextAlign.center),
              ]),
              TableRow(decoration: const BoxDecoration(color: whiteColor), children: [
                Container(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: const Text('KIPP IKN \n Segmen 2', textAlign: TextAlign.center)),
                const Text('45', textAlign: TextAlign.center),
                const Text('457.414 m2', textAlign: TextAlign.center),
              ]),
              TableRow(decoration: const BoxDecoration(color: whiteColor), children: [
                Container(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: const Text('KIPP IKN \n Segmen 3', textAlign: TextAlign.center)),
                const Text('62', textAlign: TextAlign.center),
                const Text('264.079', textAlign: TextAlign.center),
              ]),
              TableRow(decoration: const BoxDecoration(color: whiteColor), children: [
                Container(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: const Text('KIPP IKN \n Segmen 4', textAlign: TextAlign.center)),
                const Text('5', textAlign: TextAlign.center),
                const Text('67.855 m2', textAlign: TextAlign.center),
              ]),
              TableRow(decoration: const BoxDecoration(color: whiteColor), children: [
                Container(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: const Text('KIPP IKN \n Segmen 5', textAlign: TextAlign.center)),
                const Text('22', textAlign: TextAlign.center),
                const Text('317.049 m2', textAlign: TextAlign.center),
              ]),
              TableRow(decoration: const BoxDecoration(color: whiteColor), children: [
                Container(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: const Text('KIPP IKN \n Segmen 6', textAlign: TextAlign.center)),
                const Text('6', textAlign: TextAlign.center),
                const Text('18.966 m2', textAlign: TextAlign.center),
              ]),
              TableRow(decoration: const BoxDecoration(color: whiteColor), children: [
                Container(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: const Text('KIPP IKN \n Segmen 7', textAlign: TextAlign.center)),
                const Text('5', textAlign: TextAlign.center),
                const Text('35.148 m2', textAlign: TextAlign.center),
              ]),
              TableRow(decoration: const BoxDecoration(color: whiteColor), children: [
                Container(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: const Text('KIPP IKN \n Segmen 8', textAlign: TextAlign.center)),
                const Text('24', textAlign: TextAlign.center),
                const Text('211.764 m2', textAlign: TextAlign.center),
              ]),
            ],
          ),
        ),
      ],
    );
  }
}
