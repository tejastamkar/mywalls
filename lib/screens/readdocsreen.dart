import 'package:flutter/material.dart';
import 'package:mywalls/api/fetchapi.dart';

class ReadAlldocScreen extends StatefulWidget {
  const ReadAlldocScreen({Key? key}) : super(key: key);

  @override
  State<ReadAlldocScreen> createState() => _ReadAlldocScreenState();
}

class _ReadAlldocScreenState extends State<ReadAlldocScreen> {
  List _userModel = [];
  bool loader = true;
  void _getData() async {
    _userModel = (await RestApiCalls().getUsers());
    if (_userModel.isNotEmpty) setState(() => loader = false);
  }

  @override
  void initState() {
    _getData();
    super.initState();
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
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "All the Collection Data :",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            loader
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.builder(
                    shrinkWrap: true,
                    itemCount: _userModel.length,
                    itemBuilder: ((context, index) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Text(
                                _userModel[index].name,
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w500),
                              ),
                              const Spacer(),
                              Text(
                                "${_userModel[index].age}",
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        )))
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
          onPressed: () => _getData(),
          child: const Text(
            "Refresh",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}

class ReadOneDocScreen extends StatefulWidget {
  const ReadOneDocScreen({Key? key}) : super(key: key);

  @override
  State<ReadOneDocScreen> createState() => _ReadOneDocScreenState();
}

class _ReadOneDocScreenState extends State<ReadOneDocScreen> {
  List _userModel = [];
  bool loader = true;
  final TextEditingController _id = TextEditingController();
  void _getData() async {
    _userModel = (await RestApiCalls().getUser(id: _id.text));
    if (_userModel.isNotEmpty) setState(() => loader = false);
  }

  @override
  void initState() {
    _getData();
    super.initState();
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
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Enter Document ID :",
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
                onChanged: ((value) => setState(() => loader = true)),
                controller: _id,
              ),
            ),
            loader
                ? const Text("Give the ID to get the Data")
                : ListView.builder(
                    shrinkWrap: true,
                    itemCount: _userModel.length,
                    itemBuilder: ((context, index) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Text(
                                _userModel[index].name,
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w500),
                              ),
                              const Spacer(),
                              Text(
                                "${_userModel[index].age}",
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        )))
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
          onPressed: () => _getData(),
          child: const Text(
            "Get Data",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}
