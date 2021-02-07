// import 'package:getmecar_admin/map/run.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:getmecar_admin/map/screens/LatLong.dart';
import 'package:getmecar_admin/map/screens/mapMarker.dart';
import 'package:getmecar_admin/models/booking.dart';
import 'package:getmecar_admin/notification/FirebaseMessaging.dart';

class ListMap extends StatelessWidget {
  // final databaseReference = FirebaseDatabase.instance.reference();
  // Firebase.initializeApp();

  Future getAllBooking() async {
    try {
      final data =
          await FirebaseDatabase.instance.reference().child('Booking').once();

      final list = <Booking>[];
      final map = data.value as Map<dynamic, dynamic> ?? <dynamic, dynamic>{};

      map.forEach((k, v) => list.add(Booking(name: v['name'] ?? null)));

      return list;

      // return (data.value as List<dynamic> ?? [])
      //     .where((e) => e != null)
      //     .map((e) =>
      //         // Booking(email: e['email'] ?? null, name: e['name'] ?? null))
      //         Booking(name: e['name'] ?? null))
      //     .toList();
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: SafeArea(
            child: Container(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.menu,
                  size: 40.0,
                  // onPressed: () => Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => MapMarker())),
                ),
                Text("Admin GetMeCar"),
                // Icon(
                //   Icons.settings,
                //   size: 40.0,
                // ),
                IconButton(
                  alignment: Alignment.topCenter,
                  icon: Image.asset(
                    "assets/notification.png",
                    width: 24,
                  ),
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => FirebaseMessageNotification())),
                ),
              ],
            ),
          ),
        )),
      ),
      body: FutureBuilder(
        future: getAllBooking(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Text("NO DATA !");
          }
          List<Booking> _booking = snapshot.data;
          return ListView.builder(
              itemCount: _booking.length,
              itemBuilder: (context, index) {
                return Container(
                  child: ListTile(
                    leading: Icon(Icons.map, size: 20.0),
                    title: Text("Customer Map"),
                    subtitle: Text("${_booking[index].name} current location"),
                    isThreeLine: true,
                    onTap: () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MapMarker())),
                  ),
                );
              });
        },
      ),
    );
  }
}
