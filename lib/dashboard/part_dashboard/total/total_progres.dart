import 'package:flutter/material.dart';

class TitleCardComponent extends StatelessWidget {
  final String? titleCard;
  final String? text1;
  final String? text2;
  final Color? color1;
  final Color? color2;
  const TitleCardComponent(
      {Key? key,
      this.text1,
      this.text2,
      required,
      this.titleCard,
      this.color1,
      this.color2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 3),
              )
            ],
          ),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(5),
                      topRight: Radius.circular(5)),
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: const Alignment(0.8, 1),
                      colors: <Color>[
                        color1!,
                        color2!,
                      ]),
                ),
                width: double.infinity,
                height: 40,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '$titleCard',
                    style: const TextStyle(fontSize: 20, color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(5),
                      bottomRight: Radius.circular(5)),
                  color: Colors.white,
                ),
// height: 40,
                child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                    child: Table(
                      columnWidths: const <int, TableColumnWidth>{
                        0: IntrinsicColumnWidth(),
                        1: FlexColumnWidth(),
                      },
                      children: <TableRow>[
                        TableRow(children: [
                          Container(
                            height: 30,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 30),
                              child: Text(
                                'Kebutuhan Lahan ',
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                            ),
                          ),
                          Container(
                            height: 30,
                            child: Text(
                              ': 517 Bidang',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          ),
                        ]),
                        TableRow(children: [
                          Container(
                            height: 30,
                            child: Text(' '),
                          ),
                          Container(
                            height: 30,
                            child: Text(
                              ': 373,64 Ha',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          ),
                        ]),
                        TableRow(children: [
                          Container(
                            height: 30,
                            child: Text(
                              'Sudah Bebas',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          ),
                          Container(
                            height: 30,
                            child: Text(
                              ': 92 Bidang',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          ),
                        ]),
                        TableRow(children: [
                          Container(
                            height: 30,
                            child: Text(' '),
                          ),
                          Container(
                            height: 30,
                            child: Text(
                              ': 60,51 Ha',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          ),
                        ]),
                        TableRow(children: [
                          Container(
                            height: 30,
                            child: Text(
                              'Belum Bebas',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          ),
                          Container(
                            height: 30,
                            child: Text(
                              ': 425 Bidang',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          ),
                        ]),
                        TableRow(children: [
                          Container(
                            height: 30,
                            child: Text(' '),
                          ),
                          Container(
                            height: 30,
                            child: Text(
                              ': 313,13 Ha',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          ),
                        ]),
                      ],
                    )),
              )
            ],
          ),
        )),
      ],
    );
  }
}
