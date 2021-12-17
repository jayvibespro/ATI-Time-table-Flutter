import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'content_page.dart';
import 'log_in_page.dart';
import 'time_table_card.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          titleTextStyle: TextStyle(
            fontSize: 14,
          ),
        ),
        textTheme: TextTheme(
          bodyText2: TextStyle(
            fontSize: 14,
          ),
        ),
        primarySwatch: Colors.blue,
      ),
      home: MyLogInPage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String dropdownValue = 'Monday';

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              SliverAppBar(
                floating: true,
                pinned: true,
                snap: true,
                title: Text('Ati'),
                actions: [
                  DropdownButton<String>(
                    value: dropdownValue,
                    icon: const Icon(
                      Icons.arrow_drop_down,
                      color: Colors.white,
                    ),
                    elevation: 8,
                    style: const TextStyle(color: Colors.black),
                    underline: Container(
                      height: null,
                    ),
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownValue = newValue!;
                      });
                    },
                    items: <String>[
                      'Monday',
                      'Tuesday',
                      'Wednesdsy',
                      'Thursday',
                      'Friday',
                      'Weekend',
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                  PopupMenuButton(
                    itemBuilder: (context) => [
                      PopupMenuItem(
                        child: Text("Switch Programme"),
                        value: 1,
                      ),
                      PopupMenuItem(
                        child: Text("University Examination"),
                        value: 2,
                      ),
                      PopupMenuItem(
                        child: GestureDetector(
                            onTap: () {
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MyLogInPage()),
                                  (route) => false);
                            },
                            child: Text("LogOut")),
                        value: 3,
                      ),
                    ],
                  ),
                ],
                bottom: TabBar(
                  tabs: [
                    Tab(icon: Icon(Icons.groups)),
                    Tab(icon: Text('TIMETABLE')),
                    Tab(icon: Text('SUBJECTS')),
                  ],
                ),
              ),
            ];
          },
          body: TabBarView(
            children: [
              Container(
                child: Column(
//                  scrollDirection: Axis.vertical,
                  children: <Widget>[],
                ),
              ),
              Container(
                child: Column(
//                  scrollDirection: Axis.vertical,
                  children: <Widget>[
                    Column(
                      children: [
                        timeTableCard(
                          timeIn: '08:00',
                          timeOut: '10:00',
                          courseCode: 'CS335',
                          sessionType: 'Lecture',
                          venue: 'B306',
                        ),
                        timeTableCard(
                          timeIn: '13:00',
                          timeOut: '16:00',
                          courseCode: 'IS172',
                          sessionType: 'Practical',
                          venue: 'D01 Kijitonyama LUHANGA',
                        ),
                        timeTableCard(
                          timeIn: '08:00',
                          timeOut: '10:00',
                          courseCode: 'DS112',
                          sessionType: 'Seminar',
                          venue: 'Yombo 05',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                child: ListView(
//                  scrollDirection: Axis.vertical,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ContentPage()),
                        );
                      },
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    child: Text(
                                      'CS335',
                                      style: TextStyle(fontSize: 20.0),
                                    ),
                                  ),
                                  Container(
                                      child: Text(
                                    'Principles of Operating System',
                                    style: TextStyle(color: Colors.black54),
                                  )),
                                ],
                              ),
                              Container(
                                child: Icon(
                                  Icons.navigate_next,
                                  color: Colors.black54,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
