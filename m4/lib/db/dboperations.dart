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

  static Future<QuerySnapshot> readAllUsers() {
    CollectionReference collectionReference = dbReference.collection('users');
    Future<QuerySnapshot> futurequerySnapshot = collectionReference.get();
    return futurequerySnapshot;
  }

  static Map<String, dynamic> _convertIntoMap(User userObject) {
    return {
      "userid": userObject.userid,
      "password": userObject.password,
      "email": userObject.email,
      "phone": userObject.phone
    };
  }
}
