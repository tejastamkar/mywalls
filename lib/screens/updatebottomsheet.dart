import 'package:flutter/material.dart';
import 'package:mywalls/api/fetchapi.dart';

class UpdateDocBottomSheet extends StatefulWidget {
  final String id;
  final Function func;
  const UpdateDocBottomSheet({Key? key, required this.id, required this.func})
      : super(key: key);

  @override
  State<UpdateDocBottomSheet> createState() => _UpdateDocBottomSheetState();
}

class _UpdateDocBottomSheetState extends State<UpdateDocBottomSheet> {
  final TextEditingController _name = TextEditingController(),
      _age = TextEditingController();
  String status = "Ready";

  _updateUser() async {
    status = await RestApiCalls()
        .updateDoc(name: _name.text, age: _age.text, id: widget.id)
        .whenComplete(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(
          20, 20, 20, MediaQuery.of(context).viewInsets.bottom + 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Updating the data for id: ${widget.id}",
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
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
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  fixedSize: Size(width, 50),
                  backgroundColor: Colors.green.shade600,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  elevation: 0,
                  padding: const EdgeInsets.symmetric(vertical: 10)),
              onPressed: () => _updateUser().whenComplete(() => widget.func()),
              child: const Text(
                "Update",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
