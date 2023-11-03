import 'package:flutter/material.dart';
import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:flutter_application_1/AddMatch.dart';
import 'package:flutter_application_1/Addteam.dart';
import 'package:flutter_application_1/matchinformation.dart';
import 'package:flutter_application_1/matchlist.dart';

class MySideBar extends StatefulWidget {
  const MySideBar({super.key});

  @override
  State<MySideBar> createState() => _MySideBarState();
}

class _MySideBarState extends State<MySideBar> {
  PageController page = PageController();
  SideMenuController sideMenu = SideMenuController();
  @override
  void initState() {
    sideMenu.addListener((p0) {
      page.jumpToPage(p0);
    });
    super.initState();
  }

  final ScrollController controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   leading: IconButton(
      //     icon: Icon(Icons.menu),
      //     onPressed: () {
      //       if (sideMenu.isOpened) {
      //         sideMenu.closeSideMenu();
      //       } else {
      //         sideMenu.openSideMenu();
      //       }
      //     },
      //   ),
      // ),
      body: ConstrainedBox(
        constraints: const BoxConstraints(minHeight: 550, minWidth: 700),
        child: Scrollbar(
          thumbVisibility: true,
          controller: controller,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            controller: controller,
            child: Container(
              color: const Color.fromARGB(255, 143, 102, 255),
              child: SizedBox(
                width: MediaQuery.of(context).size.width < 800
                    ? 500
                    : MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height < 560
                    ? 550
                    : MediaQuery.of(context).size.height,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SideMenu(
                      alwaysShowFooter: true,
                      collapseWidth: 10,
                      showToggle: true,
                      controller: sideMenu,
                      style: SideMenuStyle(
                          // showTooltip: false,
                          compactSideMenuWidth: 58,
                          displayMode: SideMenuDisplayMode.open,
                          hoverColor: const Color.fromARGB(255, 255, 210, 228),
                          selectedColor: Color.fromARGB(255, 71, 7, 246),
                          selectedTitleTextStyle:
                              const TextStyle(color: Colors.white),
                          unselectedTitleTextStyle:
                              const TextStyle(color: Colors.black),
                          selectedIconColor: Colors.white,
                          // decoration: BoxDecoration(
                          //   borderRadius: BorderRadius.all(Radius.circular(10)),
                          // ),
                          // backgroundColor: Colors.blueGrey[700]
                          itemBorderRadius: BorderRadius.circular(30)),
                      title: Column(
                        children: [
                          const Divider(
                            indent: 8.0,
                            endIndent: 8.0,
                          ),
                        ],
                      ),
                      items: [
                        SideMenuItem(
                          trailing: SizedBox(),
                          title: 'Match Information',
                          onTap: (page, _) {
                            sideMenu.changePage(page);
                          },
                          badgeContent: const Text(
                            '3',
                            style: TextStyle(color: Colors.white),
                          ),
                          tooltipContent:
                              "This is a tooltip for Dashboard item",
                        ),
                        SideMenuItem(
                          trailing: SizedBox(),
                          title: 'Add Team',
                          onTap: (page, _) {
                            sideMenu.changePage(page);
                          },
                        ),
                        SideMenuItem(
                          trailing: SizedBox(),
                          title: 'Matches List',
                          onTap: (page, _) {
                            sideMenu.changePage(page);
                          },
                        ),
                        SideMenuItem(
                          trailing: SizedBox(),
                          title: 'Add Match',
                          onTap: (page, _) {
                            sideMenu.changePage(page);
                          },
                        ),

                        /*
                        SideMenuItem(
                          priority: 8,
                          builder: (context, displayMode) {
                            return Divider(
                              indent: 8.0,
                              endIndent: 8.0,
                            );
                          },
                        ),*/
                      ],
                    ),
                    Expanded(
                      child: PageView(
                        physics: const NeverScrollableScrollPhysics(),
                        controller: page,
                        children: [
                          // Container(
                          //   color: Colors.white,
                          //   child: ChangeNotifierProvider(
                          //     create: (_) => CalModel(),
                          //     child: const MultiPurposeTable(),
                          //   ),
                          //   // child: const MultiPurposeTable()
                          // // ),
                          // Container(
                          //     color: Colors.white,
                          //     child: const DbasetestingPage()),
                          Container(
                            color: Colors.white,
                            child: DropDown(),
                          ),

                          Container(
                            color: Colors.white,
                            child: AddTeam(),
                          ),
                          Container(
                            color: Colors.white,
                            child: DataTableDemo(),
                          ),

                          Container(
                            color: Colors.white,
                            child: AddMatch(),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
