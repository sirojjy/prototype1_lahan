import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prototype1_lahan/inventarisasi/bloc/inven_bloc.dart';
import 'package:prototype1_lahan/share/custom_appbar.dart';

import '../share/appbarNew.dart';
import '../share/item.dart';

class Inventarisasi extends StatefulWidget {
  const Inventarisasi({Key? key}) : super(key: key);

  @override
  State<Inventarisasi> createState() => _InventarisasiState();
}

class _InventarisasiState extends State<Inventarisasi> {

  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _nibController = TextEditingController();
  final TextEditingController _nikController = TextEditingController();
  final TextEditingController _traseController = TextEditingController();
  // final TextEditingController _fileController = FileEditingController();

  final CollectionReference _inventarisasi =
      FirebaseFirestore.instance.collection('inventarisasi');

  Future<void> _create() async {
    await showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext ctx) {
          return Container(
            padding: EdgeInsets.only(
                top: 20,
                left: 20,
                right: 20,
                bottom: MediaQuery.of(ctx).viewInsets.bottom + 20),
            decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: _namaController,
                  decoration: const InputDecoration(labelText: 'Issue'),
                ),
                // TextField(
                //   keyboardType:
                //   const TextInputType.numberWithOptions(decimal: true),
                //   controller: _nibController,
                //   decoration: const InputDecoration(
                //     labelText: 'NIB',
                //   ),
                // ),
                // TextField(
                //   controller: _nikController,
                //   decoration: const InputDecoration(labelText: 'NIK'),
                // ),
                // TextField(
                //   controller: _traseController,
                //   decoration: const InputDecoration(labelText: 'Trase'),
                // ),
                // const SizedBox(
                //   height: 10,
                // ),

                const SizedBox(
                  height: 20,
                ),

                // Center(
                //   child: ElevatedButton(
                //       onPressed: () => {
                //         // Navigator.push(context, MaterialPageRoute(builder: (context) =>  ImagePicker()))
                //       },
                //       child: const Text('Tambah Gambar')
                //   ),
                // ),
                Center(
                  child: ElevatedButton(
                    child: const Text('Tambah Issue'),
                    onPressed: () async {
                      final String namaPemilik = _namaController.text;
                      final String? nib = _nibController.text;
                      final String? nik = _nikController.text;
                      final String? trase = _traseController.text;
                      // final String? file = _fileController.text;
                      if (nib != null) {
                        BlocProvider.of<InvenBloc>(context).add(AddInvenEvent(
                          namaPemilik: namaPemilik,
                          nib: nib,
                          nik: nik,
                          trase: trase,
                          // file: file,
                        ));
                        _namaController.text = '';
                        _nibController.text = '';
                        _nikController.text = '';
                        _traseController.text = '';
                        // _fileController.text = '';
                        Navigator.of(context).pop();
                      }
                    },
                  ),
                )

              ],
            ),
          );
        });
  }

  Future<void> _viewIssue() async {
    await showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext ctx){
          return Container(
            height: 400,
              padding: const EdgeInsets.only(top: 20),
            child: const Card(
              child: const ListTile(
                title: Text('Detail Issue'),
              ),
            ),
          );
    }
    );
  }

  Future<void> _update([DocumentSnapshot? documentSnapshot]) async {
    if (documentSnapshot != null) {
      print('oke');
      _namaController.text = documentSnapshot['namaPemilik'];
      _nibController.text = documentSnapshot['nib'];
      _nikController.text = documentSnapshot['nik'];
      // _nibController.text = documentSnapshot['alamatPemilik'];
      // _nibController.text = documentSnapshot['tglLahir'];
      // _nibController.text = documentSnapshot['noAlasHak'];
      // _nibController.text = documentSnapshot['jenisHak'];
      _traseController.text = documentSnapshot['trase'];
    }

    await showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext ctx) {
          return Padding(
            padding: EdgeInsets.only(
                top: 20,
                left: 20,
                right: 20,
                bottom: MediaQuery.of(ctx).viewInsets.bottom + 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(),
                TextField(
                  controller: _namaController,
                  decoration: const InputDecoration(labelText: 'Nama Pemilik'),
                ),
                TextField(

                  controller: _nibController,
                  decoration: const InputDecoration(labelText: 'NIB',),
                ),
                TextField(

                  controller: _nikController,
                  decoration: const InputDecoration(labelText: 'NIK',),
                ),
                TextField(

                  controller: _traseController,
                  decoration: const InputDecoration(labelText: 'Trase',),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  child: const Text('Update'),
                  onPressed: () async {
                    final String namaPemilik = _namaController.text;
                    final String? nib = _nibController.text;
                    final String? nik = _nikController.text;
                    final String? trase = _traseController.text;
                    if (nib != null) {
                      BlocProvider.of<InvenBloc>(context).add(UpdateInvenEvent(
                        id:documentSnapshot?.id,
                        namaPemilik: namaPemilik,
                        nib: nib,
                        nik: nik,
                        trase: trase,
                      ));
                      _namaController.text = '';
                      _nibController.text = '';
                      _nikController.text = '';
                      _traseController.text = '';
                      Navigator.of(context).pop();
                    }
                  },
                )
              ],
            ),
          );
        });
  }

  Future<void> _delete(String inventarisasiId) async {
    await _inventarisasi.doc(inventarisasiId).delete();
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text("NIB Berhasil dihapus")));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
                height: MediaQuery.of(context).size.height,
                padding: const EdgeInsets.all(10),
                child:
              Column(
                children: [
                  AppbarNew(title: 'Inventarisasi'),
                  const SizedBox(height: 20,),
                  Expanded(
                    child: StreamBuilder(
                      stream: _inventarisasi.snapshots(), //build connection
                      builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                        if (streamSnapshot.hasData) {
                          return ListView.builder(
                              itemCount: streamSnapshot.data!.docs.length,
                              itemBuilder: (context, index) {
                                final DocumentSnapshot documentSnapshot =
                                streamSnapshot.data!.docs[index];
                                return Card(
                                  margin: const EdgeInsets.all(5.0),
                                  child: ListTile(
                                    title: Text(documentSnapshot['namaPemilik']),
                                    subtitle: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            const Text('NIB: '),
                                            Text(documentSnapshot['nib']),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            const Text('Trase: '),
                                            Text(documentSnapshot['trase']),
                                          ],
                                        ),
                                      ],
                                    ),
                                    trailing: SizedBox(
                                      width: 155,
                                      child: Row(
                                        children: [
                                          GestureDetector(
                                            onTap: () => _viewIssue(),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  color: warningColor,
                                                  borderRadius: BorderRadius.circular(5)
                                              ),
                                              padding: const EdgeInsets.all(5),
                                              child: const Text('1 Issue', style: const TextStyle(color: whiteColor),),
                                            ),
                                          ),
                                          const SizedBox(width: 20,),
                                          GestureDetector(
                                            onTap: () => _create(),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  color: const Color(0xFF2697FF),
                                                  borderRadius: BorderRadius.circular(5)
                                              ),
                                              padding: const EdgeInsets.all(5),
                                              child: const Text('+ Issue', style: const TextStyle(color: whiteColor),),
                                            ),
                                          ),
                                          // IconButton(
                                          //   onPressed: () => _update(documentSnapshot),
                                          //   icon: const Icon(Icons.edit),
                                          // ),
                                          // IconButton(
                                          //     onPressed: () {
                                          //       BlocProvider.of<InvenBloc>(context).add(DeleteInventEvent(id: documentSnapshot.id));
                                          //     },
                                          //     icon: const Icon(Icons.delete)
                                          // ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              });
                        }
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          )
      ),
    );
  }
}
