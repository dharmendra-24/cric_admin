import 'dart:convert';
import 'dart:math';
import 'package:flutter_application_1/Homescreen.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_model_list/dropdown_model_list.dart';
import 'package:flutter_application_1/matchlist.dart';
import 'package:intl/intl.dart';
import '';

class AddMatch extends StatefulWidget {
  const AddMatch({super.key});

  @override
  State<AddMatch> createState() => _AddMatchState();
}

class _AddMatchState extends State<AddMatch>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  @override
  void initState() {
    super.initState();
    timeinput.text = "";
    _controller = AnimationController(vsync: this);
  }

  OptionItem optionItemSelected1 = OptionItem(title: "Select Team 1");
  OptionItem optionItemSelected2 = OptionItem(title: "Select Team 2");
  TextEditingController dateInput = TextEditingController();
  TextEditingController headingcontroller = TextEditingController();

  TimeOfDay selectedTime = TimeOfDay(hour: 00, minute: 00);
  late String hour, minute, time;

  TextEditingController team1controller = TextEditingController();
  TextEditingController tosscontroller = TextEditingController();
  TextEditingController team2controller = TextEditingController();
  TextEditingController timeinput = TextEditingController();
  TextEditingController scontroller = TextEditingController();
  TextEditingController matchcontroller = TextEditingController();

  String dateInputtext = "";
  String timeInputtext = "";

  String matchcontrollertext = "";
  // void navigateToSecondPage() {
  //   matchcontrollertext = matchcontroller.text;
  //   timeInputtext = timeinput.text;
  //   dateInputtext = dateInput.text;
  //   Navigator.push(
  //     context,
  //     MaterialPageRoute(
  //       builder: (context) =>
  //           DataTableDemo(date: dateInputtext, time: timeInputtext),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(245, 245, 245, 1),
      // appBar: AppBar(
      //   automaticallyImplyLeading: false,
      //   title: const Text("Add Match"),
      //   centerTitle: true,
      //   elevation: 2,
      // ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SafeArea(
          child: Container(
            // padding: EdgeInsets.only(left: 10, right: 10),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            // decoration: BoxDecoration(color: Colors.grey),
            decoration: const BoxDecoration(color: Colors.white),
            padding: const EdgeInsets.only(left: 20, right: 20, top: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  '     Teams :-',
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        width: 110,
                        height: 40,
                        child: TextField(
                          controller: scontroller,
                          decoration: const InputDecoration(
                            // hintText: "Enter Match no",
                            labelText: 'M.No ',
                            // labelStyle: TextStyle(color: Colors.white),
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              borderSide: BorderSide(
                                  width: 1, color: Colors.black), //<-- SEE HERE
                            ),
                          ),
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: Container(
                          width: MediaQuery.of(context).size.width * .3,
                          height: 40,
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: TextField(
                            controller: team1controller,
                            decoration: const InputDecoration(
                              //  labelText: "Enter Team1",
                              hintText: 'Team1',
                              //labelStyle: TextStyle(color: Colors.white),
                              enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                                borderSide: BorderSide(
                                    width: 1,
                                    color: Colors.black), //<-- SEE HERE
                              ),
                            ),
                          ),
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: Container(
                          margin: const EdgeInsets.only(top: 18, bottom: 20),
                          width: 50,
                          height: 40,
                          //padding: const EdgeInsets.only(b),
                          decoration: const BoxDecoration(
                            color: Colors.red,
                            //shape: BoxShape.rectangle,
                          ),
                          child: const Center(
                              child: Text(
                            'VS',
                            style: TextStyle(color: Colors.white),
                          )),
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: Container(
                          width: MediaQuery.of(context).size.width * .3,
                          height: 40,
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: TextField(
                              controller: team2controller,
                              decoration: const InputDecoration(
                                //labelText: "Enter Team2",
                                hintText: 'Team2',
                                //labelStyle: TextStyle(color: Colors.white),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                  borderSide: BorderSide(
                                      width: 1,
                                      color: Colors.black), //<-- SEE HERE
                                ),
                              )),
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  '     Select Logos',
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      HomeScreen(
                        title: "Logo Team1",
                      ),
                      SizedBox(
                        width: 100,
                      ),
                      HomeScreen(
                        title: "Logo Team2",
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  '     Toss',
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * .3,
                  height: 40,
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: TextField(
                      controller: tosscontroller,
                      decoration: const InputDecoration(
                        hintText: "Toss",
                        //hintText: 'Toss',
                        //  labelStyle: TextStyle(color: Colors.white),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(
                              width: 1, color: Colors.black), //<-- SEE HERE
                        ),
                      )),
                ),
                const Text('     Date :-',
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.bold)),
                Container(
                    width: MediaQuery.of(context).size.width * .3,
                    height: 40,
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    // height: MediaQuery.of(context).size.width / 11,
                    child: TextField(
                      controller: dateInput,
                      decoration: const InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                            borderSide: BorderSide(
                                width: 1, color: Colors.black), //<-- SEE HERE
                          ),
                          suffixIcon: Icon(Icons.calendar_today),
                          //   labelStyle: TextStyle(color: Colors.white),
                          labelText: "Select Date"),
                      readOnly: true,
                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1950),
                            lastDate: DateTime(2100));

                        if (pickedDate != null) {
                          String formattedDate =
                              DateFormat('yyyy-MM-dd').format(pickedDate);
                          print(formattedDate);
                          setState(() {
                            dateInput.text = formattedDate;
                          });
                        } else {}
                      },
                    )),
                const SizedBox(
                  height: 10,
                ),
                const Text('     Time :-',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    )),
                Container(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  width: MediaQuery.of(context).size.width * .3,
                  height: 40,
                  //height: 120,
                  child: Center(
                    child: TextField(
                      controller:
                          timeinput, //editing controller of this TextField
                      decoration: const InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                            borderSide:
                                BorderSide(width: 1, color: Colors.black),
                          ),
                          suffixIcon: Icon(Icons.timer),
                          hintText: "Enter Time"),

                      onTap: () async {
                        TimeOfDay? pickedTime = await showTimePicker(
                          initialTime: TimeOfDay.now(),
                          context: context,
                        );

                        if (pickedTime != null) {
                          setState(
                            () {
                              // timeinput.text = pickedTime.hour();
                              hour = pickedTime.hour.toString();
                              minute = pickedTime.minute.toString();
                              time = hour + ':' + minute;
                              timeinput.text = time;
                            },
                          );
                        } else {}
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    children: [
                      CupertinoButton(
                        color: Colors.blue,
                        child: const Text('  Submit  ',
                            style:
                                TextStyle(fontSize: 15, color: Colors.white)),
                        onPressed: () async {
                          // navigateToSecondPage();
                          final team1 = team1controller.text;
                          final team2 = team2controller.text;
                          final dateInput1 = dateInput.text;
                          //   final timeInput1 = timeinput.text;
                          final toss = tosscontroller.text;

                          await postData(
                              team1: team1,
                              team2: team2,
                              date: dateInput1,
                              // time: timeInput1,
                              toss: toss);
                          scontroller.clear();
                          team1controller.clear();
                          tosscontroller.clear();
                          team2controller.clear();
                          dateInput.clear();
                          timeinput.clear();
                        },
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      CupertinoButton(
                        color: Colors.red,
                        child: const Text(
                          '  Cancel ',
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> postData({
    required String team1,
    required String team2,
    required String date,
    // required String time,
    required String toss,
  }) async {
    final String apiUrl =
        'https://cricket-api-lilac.vercel.app//api/cricket/matchs';
    final Map<String, dynamic> team1data = {'name': team1};
    final Map<String, dynamic> team2data = {'name': team2};
    final Map<String, dynamic> data1 = {
      'team1': team1data,
      'team2': team2data,
      'date': date,
      'tossWinner': toss,
    };
    final response = await http.post(
      Uri.parse(apiUrl),
      // headers: {
      //   'Content-Type': 'application/json',
      // },
      body: json.encode([data1]),
    );

    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Data posted successfully'),
      ));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Error posting data: ${response.statusCode}'),
      ));
    }
  }
}
