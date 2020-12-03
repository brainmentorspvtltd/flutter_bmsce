import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mymusicapp/models/user.dart';

class DbOperations {
  static FirebaseFirestore dbReference = FirebaseFirestore.instance;
  static Future<String> addUser(User userObject) async {
    CollectionReference userCollection = dbReference.collection('users');
    try {
      await userCollection.add(_convertIntoMap(userObject));
    } catch (ex) {
      return "Problem in User Register";
    }
    return "User Added SuccessFully";
  }

// Continus Form of Read (Real time Read) / Streaming
  static Stream<QuerySnapshot> readRealTime() {
    Query query = dbReference.collection('users');
    return query.snapshots();
  }

  // One time read
  static Future<List<QueryDocumentSnapshot>> readAllUsers() async {
    CollectionReference collectionReference = dbReference.collection('users');
    //Future<QuerySnapshot> futurequerySnapshot = collectionReference.get();
    QuerySnapshot querySnapshot = await collectionReference.get();
    return querySnapshot.docs;
    //futurequerySnapshot.then((value) => null)
    //return futurequerySnapshot;
  }

  /*collectTheDataInUser( Future<QuerySnapshot> futurequerySnapshot){
    futurequerySnapshot.then((QuerySnapshot snapshot) {
      snapshot.docs.l
    })
  }*/

  static Map<String, dynamic> _convertIntoMap(User userObject) {
    return {
      "userid": userObject.userid,
      "password": userObject.password,
      "email": userObject.email,
      "phone": userObject.phone
    };
  }
}
