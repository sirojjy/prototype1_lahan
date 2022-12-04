import 'package:flutter/material.dart';

import '../../share/item.dart';

class TabelBidangCard extends StatefulWidget {
  const TabelBidangCard({Key? key}) : super(key: key);

  @override
  State<TabelBidangCard> createState() => _TabelBidangCardState();
}

class _TabelBidangCardState extends State<TabelBidangCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Container(
        width: 400,
        // padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: DataTable(
          columns: <DataColumn>[
            DataColumn(
                label: Expanded(
                  child: Text('Area',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                )
            ),
            DataColumn(
                label: Expanded(
                  child: Text('Jumlah Bidang',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                )
            ),
            DataColumn(
                label: Expanded(
                  child: Text('Luas Bidang',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                )
            )
          ],
          rows: [
            DataRow(cells: <DataCell>[
              DataCell(Text('IPAL1')),
              DataCell(Text('12')),
              DataCell(Text('212.000 m2')),
            ]),
            DataRow(cells: <DataCell>[
              DataCell(Text('IPAL2')),
              DataCell(Text('12')),
              DataCell(Text('212.000 m2')),
            ]),
            DataRow(cells: <DataCell>[
              DataCell(Text('IPAL3')),
              DataCell(Text('12')),
              DataCell(Text('212.000 m2')),
            ]),
          ],
        ),
      ),
    );
  }
}
