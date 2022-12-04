import 'package:flutter/material.dart';

import '../../share/item.dart';

class TabelIssueCard extends StatefulWidget {
  const TabelIssueCard({Key? key}) : super(key: key);

  @override
  State<TabelIssueCard> createState() => _TabelIssueCardState();
}

class _TabelIssueCardState extends State<TabelIssueCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Container(
        // width: 400,
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: DataTable(
          columns: <DataColumn>[
            DataColumn(
                label: Expanded(
                  child: Text('Bidang',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                )
            ),
            DataColumn(
                label: Expanded(
                  child: Text('Nama',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                )
            ),
            DataColumn(
                label: Expanded(
                  child: Text('Issue',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                )
            )
          ],
          rows: [
            DataRow(cells: <DataCell>[
              DataCell(Text('10001')),
              DataCell(Text('Budi')),
              DataCell(Text('Berkas alas hak tidak lengkap')),
            ]),
            DataRow(cells: <DataCell>[
              DataCell(Text('10002')),
              DataCell(Text('Rudi')),
              DataCell(Text('Tanah Sengketa')),
            ]),
            DataRow(cells: <DataCell>[
              DataCell(Text('10003')),
              DataCell(Text('Wati')),
              DataCell(Text('Kurang ahli waris')),
            ]),
          ],
        ),
      ),
    );
  }
}
