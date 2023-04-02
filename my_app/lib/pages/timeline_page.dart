import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_heatmap_calendar/flutter_heatmap_calendar.dart';
import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TimelinePage extends StatefulWidget {
  const TimelinePage({super.key});

  @override
  State<TimelinePage> createState() => _TimelinePageState();
}

class _TimelinePageState extends State<TimelinePage> {
    late DateTime _selectedDate;
    var db = FirebaseFirestore.instance;
    final user = FirebaseAuth.instance.currentUser!;
    var userID="j";
    List<String> entries=[];


    void _resetSelectedDate() {
      _selectedDate = DateTime.now().add(const Duration(days: 2));
    }

        void getEntries() {
      // db.collection("entries").where("userID", isEqualTo: userID).get().then(
      //   (querySnapshot) {
      //     print("Successfully completed");
      //     for (var docSnapshot in querySnapshot.docs) {
      //       entries.add(docSnapshot.data()[0]); 

      //       // entries.add(docSnapshot.data()["entries"]);
      //       // print('${docSnapshot.id} => ${docSnapshot.data()}');
      //     }
      //     print(entries[0]);
      //   },
      //   onError: (e) => print("Error completing: $e"),
      // );

      StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
  stream: FirebaseFirestore.instance.collection('DriverList').snapshots(),
  builder: (_, snapshot) {
    if (snapshot.hasError) return Text('Error = ${snapshot.error}');

    if (snapshot.hasData) {
      final docs = snapshot.data!.docs;
      return ListView.builder(
        itemCount: docs.length,
        itemBuilder: (_, i) {
          final data = docs[i].data();
          return ListTile(
            title: Text(data['name']),
            subtitle: Text(data['phone']),
          );
        },
      );
    }

    return Center(child: CircularProgressIndicator());
  },
);
    }

    Future getUsernameID() async {
      await FirebaseFirestore.instance.collection('users').get().then(
            (snapshot) => snapshot.docs.forEach((element) {
              print(element.reference.id);
              // userID = element.reference.id;
        
            }),
          );
    }

        @override
    void initState() {
      getUsernameID();
      super.initState();
    }


  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(50),
      child: Column(
        children: [
          CalendarTimeline(
            // showYears: true,
            initialDate: DateTime.now(),
            firstDate: DateTime(2023, 1, 1),
            lastDate: DateTime.now().add(const Duration(days: 365 * 4)),
            onDateSelected: (date) => print(date),
            leftMargin: 60,

            monthColor: Colors.redAccent[200],
            dayColor: Colors.teal[200],
            dayNameColor: const Color(0xFF333A47),
            activeDayColor: Colors.white,
            activeBackgroundDayColor: Colors.redAccent[100],
            dotsColor: const Color(0xFF333A47),
          ),


                StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
  stream: FirebaseFirestore.instance.collection('entries').snapshots(),
  builder: (_, snapshot) {
    if (snapshot.hasError) return Text('Error = ${snapshot.error}');

    if (snapshot.hasData) {
      final docs = snapshot.data!.docs;
      return ListView.builder(
        itemCount: docs.length,
        itemBuilder: (_, i) {
          final data = docs[i].data();
          return ListTile(
            title: Text(data['emoji']),

            subtitle: Text(data['goals']),
          );
        },
      );
    }

    return Center(child: CircularProgressIndicator());
  },
),



          // TextButton(
          //   style: ButtonStyle(
          //     foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
          //   ),
          //   onPressed: () {
          //     getEntries();
          //   },
          //   child: Text('Get entries'),
          // )



        ],
      ),
    );
  }
}
