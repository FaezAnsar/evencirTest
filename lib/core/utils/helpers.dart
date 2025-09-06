import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

bool isType<T, Y>() => T == Y;

void displayToastMessage(String text, {Toast toastLength = Toast.LENGTH_LONG}) {
  Fluttertoast.showToast(
    msg: text,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 2,
    backgroundColor: Colors.black87,
    textColor: Colors.white,
    webShowClose: true,
    toastLength: toastLength,
  );
}

String getImageExtension(File imageFile) {
  String filePath = imageFile.path;
  String extension = filePath.substring(filePath.lastIndexOf('.'));
  return extension; // e.g., '.jpg', '.png'
}

void showSnackBar(
  BuildContext context,
  String message, {
  SnackBarAction? action,
}) {
  ScaffoldMessenger.of(
    context,
  ).showSnackBar(SnackBar(content: Text(message), action: action));
}

/// Shows an image picker with options for camera or gallery.
/// Returns the selected image file.
// Future<void> showImagePickerBottomSheet(
//   BuildContext context,
//   void Function(File image) onPick,
// ) async {
//   await showModalBottomSheet<void>(
//     context: context,
//     shape: const RoundedRectangleBorder(
//       borderRadius: BorderRadius.vertical(top: Radius.circular(12.0)),
//     ),
//     builder: (BuildContext context) {
//       return SafeArea(
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: <Widget>[
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Text('Add Parking Space Image', style: Theme.of(context).textTheme.titleLarge),
//             ),
//             ListTile(
//               leading: const Icon(Icons.camera_alt, color: Colors.blue),
//               title: const Text('Take a photo'),
//               onTap: () async {
//                 Navigator.of(context).pop();
//                 final pickedImage = await ImagePicker().pickImage(
//                   source: ImageSource.camera,
//                   imageQuality: 80,
//                 );
//                 if (pickedImage != null) {
//                   onPick(File(pickedImage.path));
//                 }
//               },
//             ),
//             ListTile(
//               leading: const Icon(Icons.photo_library, color: Colors.green),
//               title: const Text('Choose from gallery'),
//               onTap: () async {
//                 Navigator.of(context).pop();
//                 final pickedImage = await ImagePicker().pickImage(
//                   source: ImageSource.gallery,
//                   imageQuality: 80,
//                 );
//                 if (pickedImage != null) {
//                   onPick(File(pickedImage.path));
//                 }
//               },
//             ),
//             const SizedBox(height: 16.0),
//           ],
//         ),
//       );
//     },
//   );
// }

/// Opens the place picker and returns the selected location.
/// Returns the location details including latitude, longitude, and formatted address.
