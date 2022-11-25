import 'package:flutter/material.dart';
import 'package:mywalls/screens/createdocscreen.dart';
import 'package:mywalls/screens/deletedocscreen.dart';
import 'package:mywalls/screens/readdocsreen.dart';

import 'screens/updatedocscreen.dart';

class ControllerScreen extends StatelessWidget {
  const ControllerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Controls",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Select the action you want to perform :",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            Btn(
              width: width,
              color: Colors.green.shade600,
              btnName: "Create Document",
              func: () => const CreateDocScreen(),
            ),
            Btn(
              width: width,
              color: Colors.green.shade900,
              btnName: "Get all Documents",
              func: () => const ReadAlldocScreen(),
            ),
            Btn(
              width: width,
              color: Colors.blue.shade900,
              btnName: "Get One Document",
              func: () => const ReadOneDocScreen(),
            ),
            Btn(
              width: width,
              color: Colors.yellow.shade800,
              btnName: "Update Document",
              func: () => const UpdateDocScreen(),
            ),
            Btn(
              width: width,
              color: Colors.red.shade900,
              btnName: "Delete Document",
              func: () => const DeleteDocScreen(),
            ),
          ],
        ),
      ),
    );
  }
}

class Btn extends StatelessWidget {
  const Btn({
    Key? key,
    required this.width,
    required this.color,
    required this.btnName,
    required this.func,
  }) : super(key: key);

  final double width;
  final Color color;
  final String btnName;
  final Function func;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            fixedSize: Size(width, 50),
            backgroundColor: color,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            elevation: 0,
            padding: const EdgeInsets.symmetric(vertical: 10)),
        onPressed: () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => func())),
        child: Text(
          btnName,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
