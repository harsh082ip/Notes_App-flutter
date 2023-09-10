import 'package:flutter/material.dart';
import 'package:notes_app/controller/notes_controller.dart';

class AddNotes extends StatefulWidget {
  const AddNotes({super.key});

  @override
  State<AddNotes> createState() => _AddNotesState();
}

class _AddNotesState extends State<AddNotes> {
  FocusNode myFocusNode = FocusNode();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 8, 43, 72),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color.fromARGB(255, 8, 43, 72),
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white70,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              NotesController.addNotes(
                  titleController.text, descController.text);
            },
            icon: const Icon(
              Icons.check,
              color: Colors.white70,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 25.0),
            child: Form(
                child: Column(children: [
              TextField(
                controller: titleController,
                textInputAction: TextInputAction.newline,
                maxLines: null,
                style: TextStyle(
                    fontSize: 40.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                    hintText: 'Title',
                    hintStyle: TextStyle(
                      color: Colors.white70,
                      fontSize: 45.0,
                    ),
                    enabledBorder:
                        UnderlineInputBorder(borderSide: BorderSide.none),
                    focusedBorder:
                        UnderlineInputBorder(borderSide: BorderSide.none)),
              ),
              const SizedBox(
                height: 20.0,
              ),
              TextField(
                controller: descController,
                focusNode: myFocusNode,
                textInputAction: TextInputAction.newline,
                maxLines: null,
                style: const TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
                decoration: const InputDecoration(
                  enabledBorder:
                      UnderlineInputBorder(borderSide: BorderSide.none),
                  focusedBorder:
                      UnderlineInputBorder(borderSide: BorderSide.none),
                ),
              )
            ])),
          ),
        ),
      ),
    );
  }
}
