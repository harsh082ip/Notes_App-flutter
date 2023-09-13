import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:github_sign_in_plus/github_sign_in_plus.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:notes_app/models/users.dart';
import 'package:notes_app/views/screen/auth/login.dart';
import 'package:notes_app/views/screen/auth/verify_email_address.dart';
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
          Get.off(VerifyEmailAddress());
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

  // Google Authenticaton
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  Future<User?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await _googleSignIn.signIn();
      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;
        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );
        final UserCredential authResult =
            await _auth.signInWithCredential(credential);
        final User? user = authResult.user;
        return user;
      }
    } catch (error) {
      print("Google Sign-In Error: $error");
      Get.snackbar('Error', error.toString());
      return null;
    }
  }

  // Github Authentication
  // Future<UserCredential?> githubAuth(BuildContext context) async {
  //   try {
  //     final GitHubSignIn gitHubSignIn = GitHubSignIn(
  //         clientId: '9550b73e6294a431447b',
  //         clientSecret: 'cc847a3245209c665ce67d6dbd92dfdee01bfcf8',
  //         redirectUrl:
  //             'https://notesapp-flutter-82e1a.firebaseapp.com/__/auth/handler');
  //     var result = await gitHubSignIn.signIn(context);
  //     final githubAuthCredential = GithubAuthProvider.credential(result.token!);
  //     return await FirebaseAuth.instance
  //         .signInWithCredential(githubAuthCredential);
  //   } catch (e) {
  //     log(e.toString());
  //     Get.snackbar('Some Error Occured', e.toString());
  //   }
  // }

  //Github Auth
  Future<UserCredential?> githubAuth(BuildContext context) async {
    try {
      final GitHubSignIn gitHubSignIn = GitHubSignIn(
          clientId: '9550b73e6294a431447b',
          clientSecret: 'cc847a3245209c665ce67d6dbd92dfdee01bfcf8',
          redirectUrl:
              'https://notesapp-flutter-82e1a.firebaseapp.com/__/auth/handler');

      var result = await gitHubSignIn.signIn(context);

      if (result != null && result.token != null) {
        final githubAuthCredential =
            GithubAuthProvider.credential(result.token!);
        return await FirebaseAuth.instance
            .signInWithCredential(githubAuthCredential);
      } else {
        // Handle the case where result or result.token is null
        Get.snackbar('GitHub Sign-In Failed', 'Unable to sign in with GitHub.');
        return null;
      }
    } catch (e) {
      log(e.toString());
      Get.snackbar('Some Error Occurred', e.toString());
      return null;
    }
  }

  // email verification
  Future sendVerificationLink() async {
    try {
      final user = FirebaseAuth.instance.currentUser!;
      await user.sendEmailVerification();
    } catch (e) {
      Get.snackbar('Error', 'Some Error Occured');
    }
  }

  // logout user
  void logout() async {
    try {
      await FirebaseAuth.instance.signOut().then((value) {
        Get.offAll(LoginScreen());
      });
    } catch (e) {
      Get.snackbar('Error logging out', e.toString());
    }
  }
}
