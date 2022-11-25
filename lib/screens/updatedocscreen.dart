import 'package:flutter/material.dart';
import 'package:mywalls/api/fetchapi.dart';
import 'package:mywalls/screens/updatebottomsheet.dart';

class UpdateDocScreen extends StatefulWidget {
  const UpdateDocScreen({Key? key}) : super(key: key);

  @override
  State<UpdateDocScreen> createState() => _UpdateDocScreenState();
}

class _UpdateDocScreenState extends State<UpdateDocScreen> {
  List _userModel = [];
  bool loader = true;
  void _getData() async {
    _userModel = (await RestApiCalls().getUsers());
    if (_userModel.isNotEmpty) setState(() => loader = false);
  }

  void _showSheet({required String id}) => showModalBottomSheet(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(25.0))),
      enableDrag: true,
      isScrollControlled: true,
      context: context,
      builder: (context) => Material(
              child: UpdateDocBottomSheet(
            id: id,
            func: () {
              Navigator.pop(context);
              _getData();
            },
          )));

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
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                          child: InkWell(
                            onTap: () => _showSheet(id: _userModel[index].id),
                            child: Row(
                              children: [
                                Text(
                                  _userModel[index].name,
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500),
                                ),
                                const Spacer(),
                                Text(
                                  "${_userModel[index].age}",
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                const Icon(
                                  Icons.edit_note_sharp,
                                  size: 30,
                                )
                              ],
                            ),
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
