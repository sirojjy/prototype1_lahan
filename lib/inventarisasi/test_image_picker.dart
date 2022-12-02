import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:prototype1_lahan/share/custom_appbar.dart';


class ImagePicker extends StatefulWidget {
  const ImagePicker({Key? key}) : super(key: key);


  @override
  State<ImagePicker> createState() => _ImagePickerState();
}

class _ImagePickerState extends State<ImagePicker> {

     String? fileUrl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(judulMenu: 'Image Picker',),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[(fileUrl != null)
                ? Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black54),
                image: const DecorationImage(
                  image: NetworkImage("assets/images/logo.png"),
                  fit: BoxFit.cover,
                ),
              ),

            )
                : Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black54),
              ),
              child: SvgPicture.asset("assets/icons/menu_task.svg",),
            ),
              ElevatedButton(
                child: const Text('Ambil Gambar',),
                onPressed: () {},
              )
            ],
          ),
        )
      ),
    );
  }
}

class ServiceDb {
  static CollectionReference tbl_Inventarisasi = FirebaseFirestore.instance.collection('test_image');

  static Future<void> createData(String id, {String? lokasi, String? tanggal}) async {
    return await tbl_Inventarisasi.doc(id).set({
      'lokasi': lokasi,
      'tanggal': tanggal,
    });
  }
  static Future<DocumentSnapshot> getData(String id) async => await tbl_Inventarisasi.doc(id).get();

  static Future<void> deleteData(String id) async {
    await tbl_Inventarisasi.doc(id).delete();
  }

  // static Future<String> uploadImage(File fileUrl) async {
  //   String fileName = basename(fileUrl.path);
  //
  //
  // }
}
