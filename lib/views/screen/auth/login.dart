import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app/controller/firebase_auth.dart';
import 'package:notes_app/views/screen/auth/signup.dart';

import '../home.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isobscureText = true;
  void toggleobscure() {
    setState(() {
      isobscureText = !isobscureText;
    });
  }

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    // Inside your build method
    if (isLoading) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                // top container
                Container(
                  height: MediaQuery.of(context).size.height * 0.35,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(colors: [
                        Color.fromARGB(255, 31, 46, 60),
                        Color.fromARGB(255, 22, 37, 53)
                      ], begin: Alignment.topLeft, end: Alignment.bottomRight),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(0.0),
                          bottomRight: Radius.circular(999.0))),
                ),

                // top container text 1
                const Positioned(
                  bottom: 160,
                  left: 15,
                  child: Text(
                    'Sign in to your',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 45.0,
                        fontFamily: 'ADLaMDisplay'),
                  ),
                ),

                // top container text 2
                const Positioned(
                  bottom: 110,
                  left: 15,
                  child: Text(
                    'Account',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 45.0,
                        fontFamily: 'ADLaMDisplay'),
                  ),
                ),

                // top container text 3
                const Positioned(
                  bottom: 60,
                  left: 15,
                  child: Text(
                    'Sign in to your account',
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 18.0,
                        fontFamily: 'ADLaMDisplay'),
                  ),
                ),
              ],
            ),

            // Email Text field with validator
            Container(
              margin: EdgeInsets.only(left: 15, right: 15, top: 55.0),
              child: TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    hintText: 'abc@yahoo.com',
                    labelText: 'Email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter an email';
                    }
                    if (!RegExp(
                            r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
                        .hasMatch(value)) {
                      return 'Enter a valid email';
                    }
                    return null;
                  }),
            ),

            // Password Text field with validator
            Container(
              margin: EdgeInsets.only(top: 22.0, left: 15.0, right: 15.0),
              child: TextFormField(
                controller: passwordController,
                obscureText: isobscureText,
                decoration: InputDecoration(
                    suffixIcon: IconButton(
                      icon: Icon(
                        isobscureText ? Icons.visibility : Icons.visibility_off,
                      ),
                      onPressed: toggleobscure,
                    ),
                    hintText: '**********',
                    labelText: 'Password',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12))),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a password';
                  }
                  if (!RegExp(
                          r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$%^&*]).{8,}$')
                      .hasMatch(value)) {
                    return 'Password must be 8 characters with upper, lower, number, and special char';
                  }
                  return null;
                },
              ),
            ),

            // Forget Password Inkwell Text
            Container(
              margin: const EdgeInsets.only(right: 15, top: 20.0),
              alignment: Alignment.topRight,
              child: InkWell(
                onTap: () {},
                child: const Text(
                  'Forget Password?',
                  style: TextStyle(
                      color: Color.fromARGB(255, 19, 195, 24),
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),

            // Login Elevated Button
            Container(
              margin: const EdgeInsets.only(top: 30.0),
              width: MediaQuery.of(context).size.width * 0.9,
              height: 50.0,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: ContinuousRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                    backgroundColor: const Color.fromARGB(255, 192, 232, 99)),
                onPressed: () {
                  Auth.instance
                      .login(emailController.text, passwordController.text);
                },
                child: const Text(
                  'Login',
                  style: TextStyle(
                      color: Color.fromARGB(255, 69, 69, 69), fontSize: 25.0),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 25.0),
              child: Row(
                children: [
                  Container(
                    height: 25.0,
                    width: MediaQuery.of(context).size.width * 0.33,
                    child: const Divider(
                      color: Colors.black,
                      thickness: 0.6,
                      indent: 20,
                      endIndent: 0,
                    ),
                  ),

                  // or login with text and divider
                  Container(
                    height: 25.0,
                    width: MediaQuery.of(context).size.width * 0.33,
                    child: const Center(
                        child: Text(
                      'or login with',
                      style: TextStyle(fontSize: 20.0),
                    )),
                  ),
                  Container(
                    height: 25.0,
                    width: MediaQuery.of(context).size.width * 0.33,
                    child: const Divider(
                      color: Colors.black,
                      thickness: 0.6,
                      indent: 0,
                      endIndent: 20,
                    ),
                  ),
                ],
              ),
            ),

            // google and github  buttons
            Container(
              margin: const EdgeInsets.only(top: 35.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Google Outlined Button
                  Container(
                    width: MediaQuery.of(context).size.width * 0.4,
                    height: 50.0,
                    child: OutlinedButton(
                      onPressed: () {
                        isLoading = true;
                        Auth.instance.signInWithGoogle().then((value) {
                          Get.snackbar('Login Successful',
                              'You have successfully logged in');
                          isLoading = false;
                          Get.off(HomeScreen());
                        });
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/google.png',
                            height: 30,
                          ),
                          const SizedBox(
                            width: 10.0,
                          ),
                          const Text(
                            'Google',
                            style:
                                TextStyle(fontSize: 20.0, color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 15.0,
                  ),

                  // GitHub Outlined Button
                  Container(
                    width: MediaQuery.of(context).size.width * 0.4,
                    height: 50.0,
                    child: OutlinedButton(
                      // style: ButtonStyle(
                      // shape: MaterialStatePropertyAll(
                      //     ContinuousRectangleBorder(
                      //         side: BorderSide(color: Colors.green)))),
                      onPressed: () {
                        Auth.instance.githubAuth(context).then((value) {
                          Get.snackbar('Login Successful',
                              'You have successfully logged in');
                          Get.off(HomeScreen());
                        });
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/github.png',
                            height: 30,
                          ),
                          const SizedBox(
                            width: 10.0,
                          ),
                          const Text(
                            'GitHub',
                            style:
                                TextStyle(fontSize: 20.0, color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Register here text
            SizedBox(height: MediaQuery.of(context).size.height * 0.1),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Don\'t have an account?',
                    style: TextStyle(fontSize: 18.0),
                  ),
                  const SizedBox(
                    width: 6.0,
                  ),
                  InkWell(
                    onTap: () {
                      Get.off(SignUp_Screen());
                    },
                    child: const Text(
                      'Register',
                      style: TextStyle(
                          color: Color.fromARGB(255, 17, 255, 0),
                          fontSize: 18.0),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
