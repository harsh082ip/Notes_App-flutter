import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app/controller/notes_controller.dart';
import 'package:notes_app/views/screen/add_notes_screen.dart';
import 'package:notes_app/views/screen/edit_notes_screen.dart';
import 'package:notes_app/views/widgets/app_drawer.dart';

import '../../models/notes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: AppDrawer(),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        child: StreamBuilder<QuerySnapshot>(
          stream: NotesController.itemStream(),
          builder: ((context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            }
            if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
              return Center(child: Text('No items found.'));
            }

            final List<DocumentSnapshot> documents = snapshot.data!.docs;
            // return ListView.builder(
            //     itemCount: documents.length,
            //     itemBuilder: (context, index) {
            //       final item = documents[index].data() as Map<String, dynamic>;
            //       // final item = Notes_MDL.fromSnap(documents[index].data());
            //       return ListTile(
            //         onTap: () {
            //           Get.to(EditNotes_Screen(
            //             title: item['title'],
            //             desc: item['desc'],
            //             docID: documents[index].id.toString(),
            //           ));
            //         },
            //         title: Text(item['title']),
            //         subtitle: Text(item['desc']),
            //         trailing: InkWell(
            //           onTap: () {
            //             NotesController.deleteDocs(documents[index].id);
            //           },
            //           child: Icon(
            //             Icons.delete_forever,
            //             color: Colors.red,
            //           ),
            //         ),
            //       );
            //     });
            return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    mainAxisExtent: 150),
                itemCount: documents.length,
                itemBuilder: (context, builder) {
                  return Container(
                    margin: EdgeInsets.all(10.0),
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    color: Color.fromARGB(255, 139, 231, 120),
                    child: Container(),
                  );
                });
          }),
        ),
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
