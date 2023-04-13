import 'package:flutter/material.dart';
import 'package:prototype1_lahan/dashboard/part_dashboard/total/tabel_rincian_bidang.dart';

class RicianBidang extends StatefulWidget {
  const RicianBidang({Key? key}) : super(key: key);

  @override
  State<RicianBidang> createState() => _RicianBidangState();
}

class _RicianBidangState extends State<RicianBidang> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Container(
          // height: 250,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ]),
          child: Column (
            children: [
              SizedBox(height: 10,),
              SizedBox(child: Text('RINCIAN BIDANG',
                  style: Theme.of(context).textTheme.bodyLarge
              ),height: 20,),
              TabelRicianBidang(),
              SizedBox(height: 10,),

            ],
          ),
        ));
  }
}
