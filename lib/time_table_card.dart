import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'bottom_sheet.dart';

class timeTableCard extends StatelessWidget {
  const timeTableCard(
      {required this.timeIn,
      required this.timeOut,
      required this.courseCode,
      required this.sessionType,
      required this.venue});

  final String timeIn;
  final String timeOut;
  final String courseCode;
  final String sessionType;
  final String venue;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        bottomSheets(context);
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(timeIn),
                  SizedBox(
                    height: 5.0,
                  ),
                  Text(timeOut),
                ],
              ),
              SizedBox(
                width: 10.0,
              ),
              SizedBox(
                child: Container(
                  color: Colors.black87,
                ),
                width: 1.5,
                height: 60.0,
              ),
              SizedBox(
                width: 10.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: Text(courseCode),
                    padding: EdgeInsets.symmetric(
                      vertical: 6.0,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      vertical: 6.0,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        sessionType,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    color: Colors.blue,
                  ),
                  Container(
                    child: Text(venue),
                    padding: EdgeInsets.symmetric(
                      vertical: 6.0,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
