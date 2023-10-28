import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/matchlist.dart';

class AddTeam extends StatefulWidget {
  const AddTeam({super.key});

  @override
  State<AddTeam> createState() => _AddTeamState();
}

class _AddTeamState extends State<AddTeam> {
  TextEditingController teamcontroller = TextEditingController();
  String teamcontrolleer = "";
  void navigateToSecondPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DataTableDemo(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ADD Team'),
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(245, 245, 245, 1),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Team Name :- ',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  )),
              SizedBox(
                height: 8,
              ),
              TextField(
                  controller: teamcontroller,
                  decoration: const InputDecoration(
                    labelText: "Enter Team Name",
                    labelStyle: TextStyle(color: Colors.black),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(
                          width: 1, color: Colors.black), //<-- SEE HERE
                    ),
                  )),
              SizedBox(
                height: 5,
              ),
              Text('Team Logo',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  )),
              TextField(
                  controller: teamcontroller,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.image),
                    labelText: "Select Team Logo",
                    labelStyle: TextStyle(color: Colors.white),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(
                          width: 1, color: Colors.black), //<-- SEE HERE
                    ),
                  )),
              SizedBox(
                height: 7,
              ),
              Row(children: [
                CupertinoButton(
                  color: Colors.blue,
                  child: const Text('Save'),
                  onPressed: () {},
                ),
                SizedBox(
                  width: 5,
                ),
                CupertinoButton(
                  color: Colors.red,
                  child: const Text('Cancel'),
                  onPressed: () {},
                ),
              ])
            ],
          ),
        ),
      ),
    );
  }
}
