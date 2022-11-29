import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

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

  final CollectionReference _inventarisasi =
      FirebaseFirestore.instance.collection('inventarisasi');

  Future<void> _create([DocumentSnapshot? documentSnapshot]) async {
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
                  decoration: const InputDecoration(labelText: 'namaPemilik'),
                ),
                TextField(
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  controller: _nibController,
                  decoration: const InputDecoration(
                    labelText: 'nib',
                  ),
                ),
                TextField(
                  controller: _nikController,
                  decoration: const InputDecoration(labelText: 'nik'),
                ),
                TextField(
                  controller: _traseController,
                  decoration: const InputDecoration(labelText: 'trase'),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  child: const Text('Create'),
                  onPressed: () async {
                    final String namaPemilik = _namaController.text;
                    final String? nib = _nibController.text;
                    final String? nik = _nikController.text;
                    final String? trase = _traseController.text;
                    if (nib != null) {
                      await _inventarisasi
                          .add(
                          {
                            "namaPemilik": namaPemilik,
                            "nib": '$nib',
                            "nik": '$nik',
                            "trase": '$trase',
                          });
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

  Future<void> _update([DocumentSnapshot? documentSnapshot]) async {
    if (documentSnapshot != null) {
      _namaController.text = documentSnapshot['namaPemilik'];
      _nibController.text = documentSnapshot['nib'];
      _nikController.text = documentSnapshot['nik'];
      _nibController.text = documentSnapshot['alamatPemilik'];
      _nibController.text = documentSnapshot['tglLahir'];
      _nibController.text = documentSnapshot['noAlasHak'];
      _nibController.text = documentSnapshot['jenisHak'];
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
                  decoration: const InputDecoration(labelText: 'namaPemilik'),
                ),
                TextField(
                  // keyboardType:
                  //     const TextInputType.numberWithOptions(decimal: true),
                  controller: _nibController,
                  decoration: const InputDecoration(labelText: 'nib',),
                ),
                TextField(
                  // keyboardType:
                  //     const TextInputType.numberWithOptions(decimal: true),
                  controller: _nikController,
                  decoration: const InputDecoration(labelText: 'nik',),
                ),
                TextField(
                  // keyboardType:
                  //     const TextInputType.numberWithOptions(decimal: true),
                  controller: _traseController,
                  decoration: const InputDecoration(labelText: 'trase',),
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
                      await _inventarisasi
                          .doc(documentSnapshot!.id)
                          .update(
                          {"namaPemilik": namaPemilik,
                            "nib": '$nib',
                            "nik": '$nik',
                            "trase": '$trase',
                          });
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

  Future<void> _delete(String productId) async {
    await _inventarisasi.doc(productId).delete();

    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text("NIB Berhasil dihapus")));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                children: [
                   Expanded(
                    child: Text("Tabel Inventarisasi"),
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
                                    Text(documentSnapshot['nib']),
                                    Text(documentSnapshot['trase']),
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
                                          onPressed: () =>
                                              _delete(documentSnapshot.id),
                                          icon: Icon(Icons.delete)),
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
        )
    );
  }
}
