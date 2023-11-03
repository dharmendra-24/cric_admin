import 'package:dropdown_model_list/dropdown_model_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DropDown extends StatefulWidget {
  const DropDown({super.key});

  @override
  State<DropDown> createState() => _DropDownState();
}

class _DropDownState extends State<DropDown>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    timeinput.text = "";
    _controller = AnimationController(vsync: this);
  }

  DropListModel dropListModel = DropListModel([
    OptionItem(id: "1", title: "Automatic"),
    OptionItem(id: "2", title: "Head"),
    OptionItem(id: "2", title: "Tail"),
  ]);
  OptionItem optionItemSelected = OptionItem(title: "Results");
  TextEditingController dateInput = TextEditingController();
  TextEditingController timeinput = TextEditingController();
  TextEditingController headingcontroller = TextEditingController();
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   automaticallyImplyLeading: false,
      //   backgroundColor: const Color.fromRGBO(245, 245, 245, 1),
      //   title: const Text(' Information'),
      //   centerTitle: true,
      // ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(color: Colors.white),
          padding: EdgeInsets.only(left: 15, right: 15, top: 15),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: TextField(
                  controller: headingcontroller,
                  decoration: const InputDecoration(
                    labelText: "Enter Tournament",
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(
                          width: 1, color: Colors.black), //<-- SEE HERE
                    ),
                  )),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
                padding: const EdgeInsets.only(left: 20, right: 20),
                // height: MediaQuery.of(context).size.width / 11,
                child: TextField(
                  controller: dateInput,
                  decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(
                            width: 1, color: Colors.black), //<-- SEE HERE
                      ),
                      suffixIcon: Icon(Icons.calendar_today),
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
            SizedBox(
              height: 10,
            ),
            Container(
                padding: const EdgeInsets.only(left: 20, right: 20),
                //height: 120,
                child: Center(
                    child: TextField(
                  controller: timeinput, //editing controller of this TextField
                  decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
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
            SelectDropList(
              itemSelected: optionItemSelected,
              dropListModel: dropListModel,
              showIcon: true, // Show Icon in DropDown Title
              showArrowIcon: true, // Show Arrow Icon in DropDown
              showBorder: true,
              paddingTop: 0,

              onOptionSelected: (optionItem) {
                optionItemSelected = optionItem;
                setState(() {});
              },
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                children: [
                  CupertinoButton(
                      color: Colors.red, child: Text('Save'), onPressed: () {}),
                  SizedBox(
                    width: 5,
                  ),
                  CupertinoButton(
                      color: Colors.blue,
                      child: Text('Cancel'),
                      onPressed: () {})
                ],
              ),
            )
          ]),
        ),
      )),
    );
  }
}
