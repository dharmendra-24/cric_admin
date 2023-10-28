import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_model_list/dropdown_model_list.dart';
import 'package:flutter_application_1/matchlist.dart';
import 'package:intl/intl.dart';

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
  TextEditingController timeinput = TextEditingController();
  TextEditingController matchcontroller = TextEditingController();
  String dateInputtext = "";
  String timeInputtext = "";
  String matchcontrollertext = "";
  void navigateToSecondPage() {
    matchcontrollertext = matchcontroller.text;
    timeInputtext = timeinput.text;
    dateInputtext = dateInput.text;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            DataTableDemo(date: dateInputtext, time: timeInputtext),
      ),
    );
  }

  DropListModel dropListModel1 = DropListModel([
    OptionItem(id: "1", title: "Australia"),
    OptionItem(id: "2", title: "INDIA"),
    OptionItem(id: "2", title: "Sri Lanka"),
    OptionItem(id: "2", title: "New Zealand"),
    OptionItem(id: "2", title: "South Africa"),
    OptionItem(id: "2", title: "West Indies"),
    OptionItem(id: "2", title: "NetherLand"),
  ]);
  DropListModel dropListModel2 = DropListModel([
    OptionItem(id: "1", title: "Australia"),
    OptionItem(id: "2", title: "INDIA"),
    OptionItem(id: "2", title: "Sri Lanka"),
    OptionItem(id: "2", title: "New Zealand"),
    OptionItem(id: "2", title: "South Africa"),
    OptionItem(id: "2", title: "West Indies"),
    OptionItem(id: "2", title: "NetherLand"),
  ]);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(245, 245, 245, 1),
      appBar: AppBar(
        title: const Text("Add Match"),
        centerTitle: true,
        elevation: 2,
      ),
      body: SingleChildScrollView(
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
                const Text('     Match Name :-',
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 16,
                    )),
                Container(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: TextField(
                      controller: matchcontroller,
                      decoration: const InputDecoration(
                        labelText: "Enter Tournament",
                        labelStyle: TextStyle(color: Colors.white),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(
                              width: 1, color: Colors.black), //<-- SEE HERE
                        ),
                      )),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        flex: 1,
                        child: SelectDropList(
                          itemSelected: optionItemSelected1,
                          dropListModel: dropListModel1,
                          showIcon: true, // Show Icon in DropDown Title
                          showArrowIcon: true, // Show Arrow Icon in DropDown
                          showBorder: true,
                          paddingTop: 0,

                          onOptionSelected: (optionItem) {
                            optionItemSelected1 = optionItem;
                            setState(() {});
                          },
                        ),
                      ),
                      Flexible(
                        child: Container(
                          margin: const EdgeInsets.only(top: 18, bottom: 10),
                          width: 50,
                          height: 40,
                          padding: const EdgeInsets.only(),
                          decoration: const BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.rectangle,
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
                        child: SelectDropList(
                          itemSelected: optionItemSelected2,
                          dropListModel: dropListModel2,
                          showIcon: true, // Show Icon in DropDown Title
                          showArrowIcon: true, // Show Arrow Icon in DropDown
                          showBorder: true,
                          paddingTop: 0,

                          onOptionSelected: (optionItem) {
                            optionItemSelected2 = optionItem;
                            setState(() {});
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                const Text('     Date :-',
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 16,
                    )),
                Container(
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
                          labelStyle: TextStyle(color: Colors.white),
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
                      color: Colors.black87,
                      fontSize: 16,
                    )),
                Container(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    //height: 120,
                    child: Center(
                        child: TextField(
                      controller:
                          timeinput, //editing controller of this TextField
                      decoration: const InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                            borderSide: BorderSide(
                                width: 1, color: Colors.black), //<-- SEE HERE
                          ),
                          suffixIcon: Icon(Icons.timer), //icon of text field
                          labelText: "Enter Time" //label text of field
                          ),
                      readOnly:
                          true, //set it true, so that user will not able to edit text
                      onTap: () async {
                        TimeOfDay? pickedTime = await showTimePicker(
                          initialTime: TimeOfDay.now(),
                          context: context,
                        );

                        if (pickedTime != null) {
                          print(pickedTime.format(context)); //output 10:51 PM
                          DateTime parsedTime = DateFormat.jm()
                              .parse(pickedTime.format(context).toString());
                          //converting to DateTime so that we can further format on different pattern.
                          print(parsedTime); //output 1970-01-01 22:53:00.000
                          String formattedTime =
                              DateFormat('HH:mm:ss').format(parsedTime);
                          print(formattedTime); //output 14:59:00
                          //DateFormat() is from intl package, you can format the time on any pattern you need.

                          setState(() {
                            timeinput.text =
                                formattedTime; //set the value of text field.
                          });
                        } else {}
                      },
                    ))),
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
                        onPressed: () {
                          navigateToSecondPage();
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
}
