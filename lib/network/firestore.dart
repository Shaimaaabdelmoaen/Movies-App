import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:movies_app/model/detail/Details.dart';

class FireStoreUtils{
  static CollectionReference<Details> getCollection(){
    return FirebaseFirestore.instance.collection("movies").
    withConverter<Details>
      (fromFirestore: (snapshot, _) => Details.fromFireStore(snapshot.data()!),
        toFirestore: (value, _) =>value.toFireStore());
  }
  static Future<void> addDataToFireStore(Details model){
    var colRef = getCollection();
    var docRef = colRef.doc();
    model.id = docRef.id;
    return docRef.set(model);
  }

  static Future<void> deleteDataFromFireStore(Details model)async{
    var colRef = getCollection();
    return colRef.doc(model.id).delete();
  }

  static Stream<QuerySnapshot<Details>> getRealTimeDataFromFireStore() {
    var snapshot = getCollection().snapshots();
    print('Snapshot: $snapshot');
    return snapshot;
  }
}
