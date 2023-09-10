import 'package:flutter/material.dart';

class ForgetPassword_Screen extends StatefulWidget {
  const ForgetPassword_Screen({super.key});

  @override
  State<ForgetPassword_Screen> createState() => _ForgetPassword_ScreenState();
}

class _ForgetPassword_ScreenState extends State<ForgetPassword_Screen> {
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
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20.0),
                        bottomRight: Radius.circular(20.0)),
                    gradient: LinearGradient(colors: [
                      Color.fromARGB(255, 31, 46, 60),
                      Color.fromARGB(255, 22, 37, 53)
                    ], begin: Alignment.topLeft, end: Alignment.bottomRight),
                  ),
                ),

                // top container text 1
                const Positioned(
                  bottom: 130,
                  left: 15,
                  child: Text(
                    'Forgot Password',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 45.0,
                        fontFamily: 'ADLaMDisplay'),
                  ),
                ),

                // top container text 2
                const Positioned(
                  bottom: 90,
                  left: 15,
                  child: Text(
                    'Enter the Security Pin',
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
                // controller: nameController,
                decoration: InputDecoration(
                  hintText: '**********',
                  labelText: 'Enter Verification Code',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),

            // SignUp Elevated Button
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
          ],
        ),
      ),
    );
  }
}
