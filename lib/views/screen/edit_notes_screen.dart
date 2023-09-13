import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app/controller/notes_controller.dart';
import 'package:notes_app/views/screen/home.dart';

class EditNotes_Screen extends StatefulWidget {
  String title;
  String desc;
  String docID;
  EditNotes_Screen(
      {super.key,
      required this.title,
      required this.desc,
      required this.docID});

  @override
  State<EditNotes_Screen> createState() => _EditNotes_ScreenState();
}

class _EditNotes_ScreenState extends State<EditNotes_Screen> {
  FocusNode myFocusNode = FocusNode();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descController = TextEditingController();
  // String myString = "Hello, World!";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    titleController.text = widget.title;
    descController.text = widget.desc;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 8, 43, 72),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color.fromARGB(255, 8, 43, 72),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white70,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              NotesController.updateDocs(
                  titleController.text, descController.text, widget.docID);
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
              TextFormField(
                // initialValue: widget.title,
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
              TextFormField(
                // initialValue: widget.desc,
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
