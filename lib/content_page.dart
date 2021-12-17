import 'package:flutter/material.dart';

import 'main.dart';

class ContentPage extends StatelessWidget {
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
      home: MyContentPage(),
    );
  }
}

class MyContentPage extends StatefulWidget {
  @override
  _MyContentPageState createState() => _MyContentPageState();
}

class _MyContentPageState extends State<MyContentPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              SliverAppBar(
                floating: true,
                pinned: true,
                snap: true,
                title: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MyHomePage()),
                            (route) => false);
                      },
                      child: Icon(Icons.arrow_back),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Text('CS372'),
                  ],
                ),
                bottom: TabBar(
                  tabs: [
                    Tab(icon: Text('OFFLINE')),
                    Tab(icon: Text('ONLINE')),
                    Tab(icon: Text('TURTORIAL')),
                    Tab(icon: Text('TEACHER')),
                  ],
                ),
              ),
            ];
          },
          body: TabBarView(
            children: [
              Container(
                child: Center(
                  child: Text('No notes found!'),
                ),
              ),
              Container(
                child: Center(
                  child: Text('No uploaded notes found!'),
                ),
              ),
              Container(),
              Container(
                child: Center(
                  child: Text('No teacher details'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
