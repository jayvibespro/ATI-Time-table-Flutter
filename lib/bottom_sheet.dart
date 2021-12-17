import 'package:flutter/material.dart';

void bottomSheets(context) {
  showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25.0),
              topRight: Radius.circular(25.0),
            ),
          ),
          child: Wrap(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'System Administration in Linux',
                  style: TextStyle(fontSize: 18.0),
                ),
              ),
              Container(
                alignment: Alignment.center,
                child: Divider(
                  color: Colors.black54,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: Column(
                        children: [
                          Text(
                            'Start Time',
                            style: TextStyle(color: Colors.black54),
                          ),
                          Text(
                            '08:00',
                            style:
                                TextStyle(color: Colors.black, fontSize: 16.0),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        Text(
                          'Duration',
                          style: TextStyle(color: Colors.black54),
                        ),
                        Text(
                          '01h:00 min',
                          style: TextStyle(color: Colors.black, fontSize: 16.0),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 16.0),
                      child: Column(
                        children: [
                          Text(
                            'End Time',
                            style: TextStyle(color: Colors.black54),
                          ),
                          Text(
                            '10:00',
                            style:
                                TextStyle(color: Colors.black, fontSize: 16.0),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.center,
                child: Divider(
                  color: Colors.black54,
                ),
              ),
              Column(
                children: [
                  Container(
                    color: Colors.blue,
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text(
                        'Info',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0, top: 8.0),
                    child: Text(
                      'No info',
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 100.0,
              ),
            ],
          ),
        );
      });
}
