import 'package:flutter/material.dart';

// names instructor and images will be provided form the admin login section
// still need to make that part

class Basic extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: ListView.builder(
            itemCount: 20,
            itemBuilder: (context, index) {
              return Column(children: [
                Row(children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      child: Image.network(
                          "https://pngimg.com/uploads/book/book_PNG2105.png"),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Row(
                            children: [Text("Course name : \n")],
                          ),
                          Row(
                            children: [Text("Year : \n")],
                          ),
                          Row(
                            children: [Text("Instructor name : \n")],
                          ),
                        ],
                      ),
                    ),
                  )
                ]),
                Row(
                  children: [
                    Container(
                      child: RaisedButton.icon(
                        onPressed: () {},
                        icon: Icon(Icons.meeting_room),
                        label: Text("Enroll"),
                      ),
                    ),
                  ],
                )
              ]);
            }));
  }
}
