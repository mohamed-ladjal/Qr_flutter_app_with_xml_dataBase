import 'package:flutter/material.dart';

class showDataBase extends StatelessWidget {
  var data;
  showDataBase({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Center(
                    child: Text("My XML DataBase",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        )),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.close,
                    ),
                    iconSize: 24,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  )
                ],
              ),
            ),
            Text(data)
          ]),
        ),
      ),
    );
  }
}
