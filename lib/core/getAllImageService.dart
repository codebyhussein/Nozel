import 'package:firebase_storage/firebase_storage.dart';

Future<List<String>> getImagesFromFirebaseStorage(
    {String? NameofFolder}) async {
  final FirebaseStorage storage = await FirebaseStorage.instance;
  final ListResult result = await storage.ref('$NameofFolder/').listAll();

  List<String> imageUrls = [];

  for (final Reference ref in result.items) {
    final String downloadUrl = await ref.getDownloadURL();
    imageUrls.add(downloadUrl);
  }

  return imageUrls;
}
