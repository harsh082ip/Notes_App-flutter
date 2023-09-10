import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app/views/screen/add_notes_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.amber,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(AddNotes());
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
