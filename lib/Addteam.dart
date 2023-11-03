// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_application_1/matchlist.dart';

// class AddTeam extends StatefulWidget {
//   const AddTeam({super.key});

//   @override
//   State<AddTeam> createState() => _AddTeamState();
// }

// class _AddTeamState extends State<AddTeam> {
//   TextEditingController teamcontroller = TextEditingController();
//   TextEditingController playercontroller = TextEditingController();
//   String teamtext = "";

//   List<String> players = [];
//   void addPlayer(String playerName) {
//     if (players.length < 15) {
//       setState(() {
//         players.add(playerName);
//       });
//     }
//   }

//   void addteam(String teamname) {
//     setState(() {
//       teamtext = teamname;
//     });
//   }

//   void navigateToSecondPage() {
//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => DataTableDemo(),
//       ),
//     );
//   }

//   List playingplayers = [];
//   List extraplayer = [];
//   // void addteam() {
//   //   for (var i = 0; i < 16; i++) {}
//   //   playingplayers.add(value);
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // appBar: AppBar(
//       //   automaticallyImplyLeading: false,
//       //   title: Text('ADD Team'),
//       //   centerTitle: true,
//       //   backgroundColor: const Color.fromRGBO(245, 245, 245, 1),
//       // ),
//       body: SingleChildScrollView(
//         scrollDirection: Axis.vertical,
//         child: Container(
//           height: MediaQuery.of(context).size.height,
//           width: MediaQuery.of(context).size.width,
//           padding: const EdgeInsets.only(left: 20, right: 20),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const Text('Team Name :- ',
//                   style: TextStyle(
//                     color: Colors.black,
//                     fontSize: 16,
//                   )),
//               const SizedBox(
//                 height: 8,
//               ),
//               Container(
//                 width: MediaQuery.of(context).size.width * .3,
//                 height: 40,
//                 child: TextField(
//                     controller: teamcontroller,
//                     decoration: const InputDecoration(
//                       hintText: "Enter Team Name",
//                       labelStyle: TextStyle(color: Colors.black),
//                       enabledBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.all(Radius.circular(10.0)),
//                         borderSide: BorderSide(
//                             width: 1, color: Colors.black), //<-- SEE HERE
//                       ),
//                     )),
//               ),
//               const SizedBox(
//                 height: 5,
//               ),
//               Container(
//                 width: MediaQuery.of(context).size.width * .3,
//                 height: 40,
//                 child: TextField(
//                     controller: playercontroller,
//                     decoration: const InputDecoration(
//                       hintText: "Add Player",
//                       //labelStyle: TextStyle(color: Colors.white),
//                       enabledBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.all(Radius.circular(10.0)),
//                         borderSide: BorderSide(
//                             width: 1, color: Colors.black), //<-- SEE HERE
//                       ),
//                     )),
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               Row(
//                 children: [
//                   ElevatedButton(
//                     onPressed: () {
//                       addteam(teamcontroller.text);
//                       teamcontroller.clear();
//                     },
//                     child: const Text('Add Team'),
//                   ),
//                   SizedBox(
//                     width: 10,
//                   ),
//                   ElevatedButton(
//                     onPressed: () {
//                       addPlayer(playercontroller.text);
//                       playercontroller.clear();
//                     },
//                     child: const Text('Add Player'),
//                   ),
//                 ],
//               ),
//               const SizedBox(
//                 height: 10,
//               ),
//               Text(
//                 teamtext,
//                 style: TextStyle(
//                     color: Colors.black,
//                     fontSize: 20,
//                     fontWeight: FontWeight.bold),
//               ),
//               Expanded(
//                 child: Container(
//                   width: MediaQuery.of(context).size.width * .2,
//                   decoration: BoxDecoration(
//                       color: Color.fromARGB(255, 211, 246, 213),
//                       border: Border.all(width: 2, color: Colors.black)),
//                   child: ListView.builder(
//                     itemCount: players.length,
//                     itemBuilder: (context, index) {
//                       return Text(
//                         players[index],
//                         style: TextStyle(color: Colors.white, fontSize: 16),
//                       );
//                     },
//                   ),
//                 ),
//               ),
//               const SizedBox(
//                 height: 5,
//               ),
//               Row(children: [
//                 CupertinoButton(
//                   color: Colors.blue,
//                   child: const Text('Save'),
//                   onPressed: () {},
//                 ),
//                 const SizedBox(
//                   width: 5,
//                 ),
//                 CupertinoButton(
//                   color: Colors.red,
//                   child: const Text('Cancel'),
//                   onPressed: () {},
//                 ),
//               ])
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     playercontroller.dispose();
//     super.dispose();
//   }
// }
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// class Team {
//   String name;
//   List<String> players;

//   Team(this.name, this.players);
// }

// class AddTeam extends StatefulWidget {
//   const AddTeam({Key? key}) : super(key: key);

//   @override
//   _AddTeamState createState() => _AddTeamState();
// }

// class _AddTeamState extends State<AddTeam> {
//   TextEditingController teamController = TextEditingController();
//   TextEditingController playerController = TextEditingController();

//   List<Team> teams = [];

//   void addTeam(String teamName) {
//     Team team = Team(teamName, []);
//     setState(() {
//       teams.add(team);
//     });
//   }

//   void addPlayer(String playerName, int teamIndex) {
//     if (teamIndex >= 0 && teamIndex < teams.length) {
//       setState(() {
//         teams[teamIndex].players.add(playerName);
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         scrollDirection: Axis.vertical,
//         child: Container(
//           height: MediaQuery.of(context).size.height,
//           width: MediaQuery.of(context).size.width,
//           padding: const EdgeInsets.only(left: 20, right: 20),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const Text('Team Name :- ',
//                   style: TextStyle(
//                     color: Colors.black,
//                     fontSize: 16,
//                   )),
//               const SizedBox(
//                 height: 8,
//               ),
//               Container(
//                 width: MediaQuery.of(context).size.width * .3,
//                 height: 40,
//                 child: TextField(
//                   controller: teamController,
//                   decoration: const InputDecoration(
//                     hintText: "Enter Team Name",
//                   ),
//                 ),
//               ),
//               const SizedBox(
//                 height: 5,
//               ),
//               Container(
//                 width: MediaQuery.of(context).size.width * .3,
//                 height: 40,
//                 child: TextField(
//                   controller: playerController,
//                   decoration: const InputDecoration(
//                     hintText: "Add Player",
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               Row(
//                 children: [
//                   ElevatedButton(
//                     onPressed: () {
//                       addTeam(teamController.text);
//                       teamController.clear();
//                     },
//                     child: const Text('Add Team'),
//                   ),
//                   SizedBox(
//                     width: 10,
//                   ),
//                   ElevatedButton(
//                     onPressed: () {
//                       String playerName = playerController.text;
//                       playerController.clear();
//                       int selectedTeamIndex =
//                           0; // You can change this as needed
//                       addPlayer(playerName, selectedTeamIndex);
//                     },
//                     child: const Text('Add Player'),
//                   ),
//                 ],
//               ),
//               const SizedBox(
//                 height: 10,
//               ),
//               for (int i = 0; i < teams.length; i++)
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       'Team Name: ${teams[i].name}',
//                       style: TextStyle(
//                           color: Colors.black,
//                           fontSize: 20,
//                           fontWeight: FontWeight.bold),
//                     ),
//                     Container(
//                       width: MediaQuery.of(context).size.width * .2,
//                       decoration: BoxDecoration(
//                           color: Color.fromARGB(255, 211, 246, 213),
//                           border: Border.all(width: 2, color: Colors.black)),
//                       child: ListView.builder(
//                         itemCount: teams[i].players.length,
//                         itemBuilder: (context, playerIndex) {
//                           return Text(
//                             teams[i].players[playerIndex],
//                             style: TextStyle(color: Colors.white, fontSize: 16),
//                           );
//                         },
//                       ),
//                     ),
//                   ],
//                 ),
//               const SizedBox(
//                 height: 5,
//               ),
//               Row(
//                 children: [
//                   CupertinoButton(
//                     color: Colors.blue,
//                     child: const Text('Save'),
//                     onPressed: () {},
//                   ),
//                   const SizedBox(
//                     width: 5,
//                   ),
//                   CupertinoButton(
//                     color: Colors.red,
//                     child: const Text('Cancel'),
//                     onPressed: () {},
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     teamController.dispose();
//     playerController.dispose();
//     super.dispose();
//   }
// }
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Team {
  String name;
  List<String> players;

  Team(this.name, this.players);
}

class AddTeam extends StatefulWidget {
  @override
  _AddTeamState createState() => _AddTeamState();
}

class _AddTeamState extends State<AddTeam> {
  TextEditingController teamController = TextEditingController();
  TextEditingController playerController = TextEditingController();
  List<Team> teams = [];
  int activeTeamIndex = -1;
  void addTeam() {
    if (teamController.text.isNotEmpty) {
      Team team = Team(teamController.text, []);
      setState(() {
        teams.add(team);
        teamController.clear();
      });
    }
  }

  void setActiveTeam(int index) {
    setState(() {
      activeTeamIndex = index;
    });
  }

  void addPlayer(Team team, String playerName) {
    if ((team != null && playerName.isNotEmpty) && team.players.length < 15) {
      setState(() {
        team.players.add(playerName);
        playerController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Team Name:',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.3,
                    height: 40,
                    child: TextField(
                      controller: teamController,
                      decoration: const InputDecoration(
                        hintText: "Enter Team Name",
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                    onPressed: addTeam,
                    child: const Text('Add Team'),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              for (int i = 0; i < teams.length; i++)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Team Name: ${teams[i].name}',
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setActiveTeam(i);
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.15,
                            height: 40,
                            child: TextField(
                              // readOnly: activeTeamIndex != i,
                              controller: playerController,
                              decoration: const InputDecoration(
                                hintText: "Add Player",
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            addPlayer(teams[i], playerController.text);
                          },
                          child: const Text('Add Player'),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.3,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 142, 215, 145),
                        border: Border.all(width: 2, color: Colors.black),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          for (String player in teams[i].players)
                            Text(
                              player,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                              ),
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              const SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  CupertinoButton(
                    color: Colors.blue,
                    child: const Text('Save'),
                    onPressed: () {},
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  CupertinoButton(
                    color: Colors.red,
                    child: const Text('Cancel'),
                    onPressed: () {},
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    teamController.dispose();
    playerController.dispose();
    super.dispose();
  }
}
