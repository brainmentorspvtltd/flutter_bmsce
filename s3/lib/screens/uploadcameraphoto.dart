import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/utils/camera.dart';
import 'package:shop_app/utils/firebaseobj.dart';

class UploadCameraPhoto extends StatefulWidget {
  @override
  _UploadCameraPhotoState createState() => _UploadCameraPhotoState();
}

class _UploadCameraPhotoState extends State<UploadCameraPhoto> {
  String filePath = "";

  FirebaseStorage _firebaseStorage;

  _initFireBaseStorage() {
    _firebaseStorage = FirebaseStorage.instanceFor(
        app: FireBaseAppObject.app, bucket: 'gs://shopdb-c84e2.appspot.com');
  }

  @override
  initState() {
    super.initState();
    _initFireBaseStorage();
  }

  String imagePath;
  String downloadURL =
      "https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/600px-No_image_available.svg.png";
  String msg = "";
  _uploadPhoto() {
    imagePath = "/images/${DateTime.now()}.jpg";
    Reference childPath = _firebaseStorage.ref().child(imagePath);
    UploadTask uploadTask = childPath.putFile(File(filePath));
    uploadTask.then((TaskSnapshot snapshot) async {
      downloadURL = await snapshot.ref.getDownloadURL();
      msg = "File Uploaded..";
      setState(() {});
    }).catchError((err) {});
    if (uploadTask.snapshot.state == TaskState.success) {
      msg = "File Uploaded..";
    } else {
      msg = "Not Uploaded...";
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Upload'),
      ),
      body: Column(
        children: [
          Image.network(downloadURL),
          Text(
            msg,
            style: TextStyle(fontSize: 32),
          ),
          RaisedButton(
            onPressed: () async {
              filePath = await getCamera();
            },
            child: Text('Take a Pic'),
          ),
          RaisedButton(
            onPressed: () {
              _uploadPhoto();
            },
            child: Text('Upload It'),
          )
        ],
      ),
    );
  }
}
