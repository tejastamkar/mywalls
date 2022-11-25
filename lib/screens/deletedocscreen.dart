import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mywalls/api/fetchapi.dart';

class DeleteDocScreen extends StatefulWidget {
  const DeleteDocScreen({Key? key}) : super(key: key);

  @override
  State<DeleteDocScreen> createState() => _DeleteDocScreenState();
}

class _DeleteDocScreenState extends State<DeleteDocScreen> {
  List _userModel = [];
  bool loader = true;
  void _getData() async {
    _userModel = (await RestApiCalls().getUsers());
    if (_userModel.isNotEmpty) setState(() => loader = false);
  }

  void _removeData({required String id}) async {
    String msg =
        await RestApiCalls().deleteUser(id: id).whenComplete(() => _getData());
    showMsg(msg: msg);
    // print(msg);
  }

  void showMsg({required String msg}) => Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.grey.shade300,
      textColor: Colors.white,
      fontSize: 16.0);

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
                              IconButton(
                                  onPressed: () =>
                                      _removeData(id: _userModel[index].id),
                                  icon: Icon(
                                    Icons.delete_forever,
                                    color: Colors.red.shade600,
                                  ))
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
