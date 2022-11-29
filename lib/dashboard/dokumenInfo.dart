import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:prototype1_lahan/inventarisasi/inventarisasi.dart';

class DokumenInfo extends StatelessWidget {
  const DokumenInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Tahapan'),

          ],
        ),
        SizedBox(height: 10,),
        Container(
          
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Color(0xffececec),
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 3,
                offset: Offset(0, 3),
              )],
          ),
          child: GestureDetector(
            onTap: () => {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const Inventarisasi()))
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        color: Color(0xff208aee),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: SvgPicture.asset("assets/icons/Documents.svg", color: Color(
                          0xffffffff),),
                    ),
                    Text("500",style: TextStyle(fontWeight: FontWeight.w700),),

                  ],
                ),
                Row(
                  children: [
                    Text(
                      "Inventarisasi",
                      style: TextStyle(
                          fontWeight: FontWeight.w700
                      ),
                    ),],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Data Lengkap:"),
                    Text("300")
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Data Kurang:"),
                    Text("200")
                  ],
                ),
              ],
            ),
          )
        )
      ],
    );
  }
}
