import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:notes_app/models/notes.dart';
import 'package:notes_app/views/screen/auth/login.dart';
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

  // get snapshots
  static Stream<QuerySnapshot> itemStream() {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      return FirebaseFirestore.instance
          .collection('notes')
          .where('uid', isEqualTo: user.uid)
          .snapshots();
    } else {
      // Handle the case where the user is not authenticated.
      return Stream.empty(); // Return an empty stream or handle it as needed.
    }
  }

  // delete docs
  static void deleteDocs(String document) async {
    await FirebaseFirestore.instance.collection('notes').doc(document).delete();
  }

  // update docs
  static void updateDocs(String title, String desc, String docsID) async {
    try {
      Notes_MDL notes_mdl = Notes_MDL(
          title: title,
          desc: desc,
          uid: FirebaseAuth.instance.currentUser!.uid);
      await FirebaseFirestore.instance
          .collection('notes')
          .doc(docsID)
          .update(notes_mdl.toJson())
          .then((value) {
        Get.offAll(HomeScreen());
      });
    } catch (e) {
      Get.snackbar(title, e.toString());
    }
  }
}
