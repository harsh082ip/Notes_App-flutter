import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:notes_app/models/notes.dart';
import 'package:notes_app/views/screen/home.dart';

class NotesController {
  // Add notes to cloud firestore
  static void addNotes(String title, String desc) async {
    try {
      if (title.isNotEmpty && desc.isNotEmpty) {
        Notes_MDL notes_mdl = Notes_MDL(
            title: title,
            desc: desc,
            uid: FirebaseAuth.instance.currentUser!.uid);

        await FirebaseFirestore.instance
            .collection('notes')
            .doc()
            .set(notes_mdl.toJson())
            .then((value) {
          Get.snackbar('Note saved Successfully', '');
          Get.offAll(HomeScreen());
        });
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }
}
