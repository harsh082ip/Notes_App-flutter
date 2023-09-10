import 'package:cloud_firestore/cloud_firestore.dart';

class Notes_MDL {
  String title;
  String desc;
  String uid;
  Notes_MDL({required this.title, required this.desc, required this.uid});

  // app ---> firebase
  Map<String, dynamic> toJson() {
    return {'title': title, 'desc': desc, 'uid': uid};
  }

  // firebasee ----> app
  static Notes_MDL fromSnap(DocumentSnapshot snap) {
    var snapshots = snap.data() as Map<String, dynamic>;

    return Notes_MDL(
      title: snapshots['title'],
      desc: snapshots['desc'],
      uid: snapshots['uid'],
    );
  }
}
