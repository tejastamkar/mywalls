// ignore_for_file: file_names, prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mywalls/fruitsCard.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final Stream<QuerySnapshot> datafruit =
      FirebaseFirestore.instance.collection('fruits').snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('MyWalls'),
        centerTitle: true,
        backgroundColor: Colors.red[500],
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: datafruit,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Something Went Wrong');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text('loading data');
          }
          final data = snapshot.requireData;
          return ListView.builder(
            shrinkWrap: true,
            itemCount: data.size,
            itemBuilder: (context, index) {
              // return Text(
              //     '${data.docs[index]['Name']} and ${data.docs[index]['Color']}');
              return Padding(
                // Column(children: [
                padding: const EdgeInsets.all(10.0),
                child: FruitsCards(
                    name: '${data.docs[index]['Name']}',
                    color: '${data.docs[index]['Color']}',
                    delete: () async {
                      await FirebaseFirestore.instance
                          .runTransaction((Transaction myTransaction) async {
                        myTransaction
                            .delete(snapshot.data!.docs[index].reference);
                      });
                    }),
                // ),D
                // ],
              );
            },
          );
        },
      ),
    );
  }
}
