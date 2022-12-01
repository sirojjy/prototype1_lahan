import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:prototype1_lahan/inventarisasi/inventarisasi.dart';

class Pengumuman extends StatelessWidget {
  const Pengumuman({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //   children: const [
        //     Text('Tahapan'),
        //
        //   ],
        // ),
        const SizedBox(height: 10,),
        GestureDetector(
          onTap: () => {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const Inventarisasi()))
          },
          child: Container(

            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color(0xffececec),
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 3,
                  offset: const Offset(0, 3),
                )],
            ),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      height: 40,
                      width: 40,
                      decoration: const BoxDecoration(
                        color: Color(0xffeec520),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: SvgPicture.asset("assets/icons/Documents.svg", color: const Color(0xffffffff),),
                    ),
                    const Text("500 Bidang",style: TextStyle(fontWeight: FontWeight.w700),),

                  ],
                ),
                Row(
                  children: const [
                    Text(
                      "Pengumuman",
                      style: TextStyle(
                          fontWeight: FontWeight.w700
                      ),
                    ),],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text("Data Lengkap:"),
                    Text("300 Bidang")
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text("Data Kurang:"),
                    Text("200 Bidang")
                  ],
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
