import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:notes_app/models/users.dart';
import 'package:notes_app/views/screen/home.dart';

class Auth extends GetxController {
  static Auth instance = Get.find();

  // Sign Up function
  void SignUp(String name, String email, String password) async {
    try {
      if (name.isNotEmpty && email.isNotEmpty && password.isNotEmpty) {
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);

        MyUser myuser =
            MyUser(name: name, email: email, uid: userCredential.user!.uid);

        await FirebaseFirestore.instance
            .collection('Users')
            .doc(userCredential.user!.uid)
            .set(myuser.toJson())
            .then((value) {
          Get.snackbar('SignUp Successful', 'You have signed up successfully');
          Get.off(HomeScreen());
        });
      } else {
        Get.snackbar('Incomplete Details', 'Fill all the required fields');
      }
    } catch (e) {
      Get.snackbar('Error', 'Some Error Occured');
    }
  }

  //Login function
  void login(String email, String password) async {
    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password)
            .then((value) {
          Get.snackbar('Congrats', 'Login Successful');
          Get.to(const HomeScreen());
        });
      } else {
        Get.snackbar('Error', 'Enter all the required details');
      }
    } catch (e) {
      Get.snackbar('Error Signing in', e.toString());
    }
  }
}
