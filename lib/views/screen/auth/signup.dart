import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app/views/screen/auth/login.dart';

class SignUp_Screen extends StatefulWidget {
  const SignUp_Screen({super.key});

  @override
  State<SignUp_Screen> createState() => _SignUp_ScreenState();
}

class _SignUp_ScreenState extends State<SignUp_Screen> {
  bool isobscureText = true;
  void toggleobscure() {
    setState(() {
      isobscureText = !isobscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
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
                  bottom: 120,
                  left: 15,
                  child: Text(
                    'Register',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 60.0,
                        fontFamily: 'ADLaMDisplay'),
                  ),
                ),

                // top container text 2
                const Positioned(
                  bottom: 80,
                  left: 15,
                  child: Text(
                    'Register your account',
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
              margin: EdgeInsets.only(left: 15, right: 15, top: 30.0),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: 'John Fernendez',
                  labelText: 'Full Name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),

            // Email Text field with validator
            Container(
              margin: EdgeInsets.only(top: 22.0, left: 15.0, right: 15.0),
              child: TextFormField(
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
                onPressed: () {},
                child: const Text(
                  'Sign Up',
                  style: TextStyle(
                      color: Color.fromARGB(255, 69, 69, 69), fontSize: 25.0),
                ),
              ),
            ),

            Container(
              margin: const EdgeInsets.only(top: 18.0),
              child: Row(
                children: [
                  Container(
                    height: 25.0,
                    width: MediaQuery.of(context).size.width * 0.33,
                    child: const Divider(
                      color: Colors.black,
                      thickness: 0.6,
                      indent: 20,
                      endIndent: 10,
                    ),
                  ),

                  // or login with text and divider
                  Container(
                    height: 25.0,
                    width: MediaQuery.of(context).size.width * 0.33,
                    child: const Center(
                        child: Text(
                      'or sign up with',
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

            // google and facebook  buttons
            Container(
              margin: const EdgeInsets.only(top: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Google Outlined Button
                  Container(
                    width: MediaQuery.of(context).size.width * 0.4,
                    height: 50.0,
                    child: OutlinedButton(
                      onPressed: () {},
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

                  // Facebook Outlined Button
                  Container(
                    width: MediaQuery.of(context).size.width * 0.4,
                    height: 50.0,
                    child: OutlinedButton(
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/facebook.png',
                            height: 30,
                          ),
                          const SizedBox(
                            width: 10.0,
                          ),
                          const Text(
                            'Facebook',
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
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Already have an account?',
                    style: TextStyle(fontSize: 18.0),
                  ),
                  const SizedBox(
                    width: 6.0,
                  ),
                  InkWell(
                    onTap: () {
                      Get.off(LoginScreen());
                    },
                    child: const Text(
                      'Login here',
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
