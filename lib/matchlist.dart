import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DataTableDemo extends StatelessWidget {
  final List<Map<String, String>> data = [
    {
      'S.No': '1',
      'Team One': 'Team A',
      "Vs": "Vs",
      'Team Two': 'Team B',
      'Date': '2023-10-30',
      'Time': '14:00',
      'Live': 'Yes',
      'Upcoming': 'No',
      'Action': 'Watch',
    },
    {
      'S.No': '1',
      'Team One': 'Team A',
      "Vs": "Vs",
      'Team Two': 'Team B',
      'Date': '2023-10-30',
      'Time': '14:00',
      'Live': 'Yes',
      'Upcoming': 'No',
      'Action': 'Watch',
    },
    {
      'S.No': '1',
      'Team One': 'Team A',
      "Vs": "Vs",
      'Team Two': 'Team B',
      'Date': '2023-10-30',
      'Time': '14:00',
      'Live': 'Yes',
      'Upcoming': 'No',
      'Action': 'Watch',
    },
    {
      'S.No': '1',
      'Team One': 'Team A',
      "Vs": "Vs",
      'Team Two': 'Team B',
      'Date': '2023-10-30',
      'Time': '14:00',
      'Live': 'Yes',
      'Upcoming': 'No',
      'Action': 'Watch',
    },
    {
      'S.No': '1',
      'Team One': 'Team A',
      "Vs": "Vs",
      'Team Two': 'Team B',
      'Date': '2023-10-30',
      'Time': '14:00',
      'Live': 'Yes',
      'Upcoming': 'No',
      'Action': 'Watch',
    },
    {
      'S.No': '1',
      'Team One': 'Team A',
      "Vs": "Vs",
      'Team Two': 'Team B',
      'Date': '2023-10-30',
      'Time': '14:00',
      'Live': 'Yes',
      'Upcoming': 'No',
      'Action': 'Watch',
    },
    {
      'S.No': '1',
      'Team One': 'Team A',
      "Vs": "Vs",
      'Team Two': 'Team B',
      'Date': '2023-10-30',
      'Time': '14:00',
      'Live': 'Yes',
      'Upcoming': 'No',
      'Action': 'Watch',
    },
    {
      'S.No': '1',
      'Team One': 'Team A',
      "Vs": "Vs",
      'Team Two': 'Team B',
      'Date': '2023-10-30',
      'Time': '14:00',
      'Live': 'Yes',
      'Upcoming': 'No',
      'Action': 'Watch',
    },
    {
      'S.No': '1',
      'Team One': 'Team A',
      "Vs": "Vs",
      'Team Two': 'Team B',
      'Date': '2023-10-30',
      'Time': '14:00',
      'Live': 'Yes',
      'Upcoming': 'No',
      'Action': 'Watch',
    },
    {
      'S.No': '1',
      'Team One': 'Team A',
      "Vs": "Vs",
      'Team Two': 'Team B',
      'Date': '2023-10-30',
      'Time': '14:00',
      'Live': 'Yes',
      'Upcoming': 'No',
      'Action': 'Watch',
    },
    // Add more data entries here
  ];
  String? team1;
  String? team2;
  String? date;
  String? time;
  DataTableDemo({super.key, this.team1, this.team2, this.date, this.time});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(245, 245, 245, 1),
        title: const Text('Match List'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: DataTable(
            columns: const [
              DataColumn(
                  label: Text(
                'S.No',
                style: TextStyle(
                    color: Colors.black87, fontWeight: FontWeight.bold),
              )),
              DataColumn(
                  label: Text('Team One',
                      style: TextStyle(
                          color: Colors.black87, fontWeight: FontWeight.bold))),
              DataColumn(
                  label: Text('Vs',
                      style: TextStyle(
                          color: Colors.black87, fontWeight: FontWeight.bold))),
              DataColumn(
                  label: Text('Team Two',
                      style: TextStyle(
                          color: Colors.black87, fontWeight: FontWeight.bold))),
              DataColumn(
                  label: Text('Date',
                      style: TextStyle(
                          color: Colors.black87, fontWeight: FontWeight.bold))),
              DataColumn(
                  label: Text('Time',
                      style: TextStyle(
                          color: Colors.black87, fontWeight: FontWeight.bold))),
              DataColumn(
                  label: Text('Live',
                      style: TextStyle(
                          color: Colors.black87, fontWeight: FontWeight.bold))),
              DataColumn(
                  label: Text('Upcoming',
                      style: TextStyle(
                          color: Colors.black87, fontWeight: FontWeight.bold))),
              DataColumn(
                  label: Text('Action',
                      style: TextStyle(
                          color: Colors.black87, fontWeight: FontWeight.bold))),
            ],
            rows: data.map((entry) {
              return DataRow(
                cells: [
                  DataCell(Text(entry['S.No']!)),
                  DataCell(Text(entry['Team One']!)),
                  DataCell(Text(entry['Vs']!)),
                  DataCell(Text(entry['Team Two']!)),
                  DataCell(Text(entry['Date']!)),
                  DataCell(Text(entry['Time']!)),
                  DataCell(Text(entry['Live']!)),
                  DataCell(Text(entry['Upcoming']!)),
                  DataCell(Text(entry['Action']!)),
                ],
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
