import 'package:image_picker/image_picker.dart';

Future<String> getCamera() async {
  ImagePicker imagePicker = ImagePicker();
  PickedFile pickedFile =
      await imagePicker.getImage(source: ImageSource.camera);
  return pickedFile.path;
}
