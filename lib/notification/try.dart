// import 'package:getmecar_admin/map/run.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:getmecar_admin/map/screens/LatLong.dart';
import 'package:getmecar_admin/map/screens/mapMarker.dart';
import 'package:getmecar_admin/models/customer.dart';
import 'package:getmecar_admin/notification/FirebaseMessaging.dart';

class ListMap extends StatelessWidget {
  final databaseReference = FirebaseDatabase.instance.reference();

  Future getAllCustomer() async {
    try {
      return databaseReference
          .child('Customers')
          .once()
          .then((DataSnapshot snapshot) => {
                Customer(
                  email: snapshot.value('email'),
                  name: snapshot.value('name'),
                ),
              });
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getAllCustomer(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return CircularProgressIndicator();
          }

          return Scaffold(
            body: Column(
              children: [
                Text('Hahahs'),
              ],
            ),
          );
        });
  }
}
