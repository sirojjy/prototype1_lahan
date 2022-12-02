import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prototype1_lahan/inventarisasi/bloc/inven_bloc.dart';
import 'package:prototype1_lahan/share/custom_appbar.dart';

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
                TextField(
                  controller: _namaController,
                  decoration: const InputDecoration(labelText: 'Nama Pemilik'),
                ),
                TextField(
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  controller: _nibController,
                  decoration: const InputDecoration(
                    labelText: 'NIB',
                  ),
                ),
                TextField(
                  controller: _nikController,
                  decoration: const InputDecoration(labelText: 'NIK'),
                ),
                TextField(
                  controller: _traseController,
                  decoration: const InputDecoration(labelText: 'Trase'),
                ),
                const SizedBox(
                  height: 10,
                ),

                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: ElevatedButton(
                      onPressed: () => {
                        // Navigator.push(context, MaterialPageRoute(builder: (context) =>  ImagePicker()))
                      },
                      child: const Text('Tambah Gambar')
                  ),
                ),
                Center(
                  child: ElevatedButton(
                    child: const Text('Create'),
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
    return SafeArea(
        child: Scaffold(
          appBar: const CustomAppBar(judulMenu: 'Daftar Inventarisasi',),
          body: Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Row(
                  children: [
                      Expanded(
                      child: Text(" "),
                    ),
                    ElevatedButton(
                      onPressed: () => _create(),
                      child: const Icon(Icons.add),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
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
                                margin: const EdgeInsets.all(10),
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
                                    width: 100,
                                    child: Row(
                                      children: [
                                        IconButton(
                                          onPressed: () => _update(documentSnapshot),
                                          icon: const Icon(Icons.edit),
                                        ),
                                        IconButton(
                                            onPressed: () {
                                              BlocProvider.of<InvenBloc>(context).add(DeleteInventEvent(id: documentSnapshot.id));
                                            },
                                            icon: const Icon(Icons.delete)),
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
        ),
    );
  }
}
