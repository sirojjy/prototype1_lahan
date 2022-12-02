
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

part 'inven_event.dart';
part 'inven_state.dart';

class InvenBloc extends Bloc<InvenEvent, InvenState> {
  InvenBloc() : super(const InvenState()) {
    on<AddInvenEvent>(_addInvent);
    on<UpdateInvenEvent>(_updateInvent);
    on<DeleteInventEvent>(_deleteInvent);
  }

  _addInvent(AddInvenEvent event, Emitter<InvenState> emit) {
    // SharedPreferences prefs = await SharedPreferences

    final CollectionReference _inventarisasi =
    FirebaseFirestore.instance.collection('inventarisasi');

  emit(
    state.copyWith(
      status:InvenStateStatus.loading
    )
  );


  _inventarisasi
      .add(
      {
        "namaPemilik": event.namaPemilik,
        "nib": event.nib,
        "nik": event.nik,
        "trase": event.trase,
      });
  }

   _updateInvent(UpdateInvenEvent event, Emitter<InvenState> emit) {

     final CollectionReference _inventarisasi =
     FirebaseFirestore.instance.collection('inventarisasi');

    emit(
      state.copyWith(
        status: InvenStateStatus.loading
      )
    );

    _inventarisasi
        .doc(event.id)
        .update(
        {"namaPemilik": event.namaPemilik,
          "nib": event.nib,
          "nik": event.nik,
          "trase": event.trase,
        });
  }




   _deleteInvent(DeleteInventEvent event, Emitter<InvenState> emit) {
     final CollectionReference _inventarisasi =
     FirebaseFirestore.instance.collection('inventarisasi');

     emit(
         state.copyWith(
             status: InvenStateStatus.loading
         )
     );

     _inventarisasi
         .doc(event.id)
         .delete();
  }
}
