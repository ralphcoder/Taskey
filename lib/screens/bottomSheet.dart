import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taskey/constants.dart';
import 'package:provider/provider.dart';
import 'package:taskey/widgets/data.dart';
import 'package:taskey/widgets/Task.dart';

class bottomSheet extends StatefulWidget {
  @override
  _bottomSheetState createState() => _bottomSheetState();
}

class _bottomSheetState extends State<bottomSheet> {
  String inputext;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      body: Column(
        children: [
          SizedBox(height: 110),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [ksecondColor, kfirstColor]),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  )),
              padding: EdgeInsets.all(30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Flexible(
                    child: Text(
                      'Add Task',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: kfirstColor,
                          fontWeight: FontWeight.w400,
                          fontSize: 40),
                    ),
                  ),
                  TextField(
                    cursorColor: kfirstColor,
                    autofocus: true,
                    textAlign: TextAlign.center,
                    onChanged: (text) {
                      inputext = text;
                    },
                  ),
                  SizedBox(height: 10),
                  MaterialButton(
                    onPressed: () {
                      setState(() {
                        Provider.of<Data>(context, listen: false)
                            .addtask(inputext);
                        Navigator.pop(context);
                      });
                    },
                    child: Container(
                      child: Center(
                          child: Text(
                        'Add',
                        style: TextStyle(
                            fontSize: 17,
                            color: kfirstColor,
                            fontWeight: FontWeight.w600),
                      )),
                      height: 60,
                      decoration: BoxDecoration(
                          color: ksecondColor,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(50),
                            topRight: Radius.circular(50),
                            bottomRight: Radius.circular(10),
                            bottomLeft: Radius.circular(10),
                          )),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
