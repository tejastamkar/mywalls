import 'package:flutter/material.dart';
import 'package:mywalls/api/fetchapi.dart';

class CreateDocScreen extends StatefulWidget {
  const CreateDocScreen({Key? key}) : super(key: key);

  @override
  State<CreateDocScreen> createState() => _CreateDocScreenState();
}

class _CreateDocScreenState extends State<CreateDocScreen> {
  final TextEditingController _name = TextEditingController(),
      _age = TextEditingController();
  String status = "Ready";

  _addUser() async {
    status = await RestApiCalls()
        .addDoc(name: _name.text, age: _age.text)
        .whenComplete(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Home",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Enter Name :",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: TextField(
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color.fromRGBO(106, 140, 175, 1),
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide()),
                ),
                controller: _name,
              ),
            ),
            const Text(
              "Enter Age :",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: TextField(
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color.fromRGBO(106, 140, 175, 1),
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide()),
                ),
                controller: _age,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              status,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            )
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green.shade600,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              elevation: 0,
              padding: const EdgeInsets.symmetric(vertical: 10)),
          onPressed: () => _addUser(),
          child: const Text(
            "Add",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}
