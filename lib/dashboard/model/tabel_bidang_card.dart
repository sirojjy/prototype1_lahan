import 'package:flutter/material.dart';

class TabelBidangCard extends StatefulWidget {
  const TabelBidangCard({Key? key}) : super(key: key);

  @override
  State<TabelBidangCard> createState() => _TabelBidangCardState();
}

class _TabelBidangCardState extends State<TabelBidangCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
            DataCell(Text('212.000m2')),
          ]),
          DataRow(cells: <DataCell>[
            DataCell(Text('IPAL2')),
            DataCell(Text('12')),
            DataCell(Text('212.000m2')),
          ]),
          DataRow(cells: <DataCell>[
            DataCell(Text('IPAL3')),
            DataCell(Text('12')),
            DataCell(Text('212.000m2')),
          ]),
        ],
      ),
    );
  }
}
