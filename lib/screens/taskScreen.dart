import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taskey/screens/bottomSheet.dart';
import 'package:taskey/widgets/tasklist.dart';
import 'package:taskey/widgets/animations.dart';
import 'package:taskey/constants.dart';
import 'package:taskey/widgets/data.dart';
import 'package:flutter_inner_drawer/inner_drawer.dart';

class taskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(PageRouteBuilder(
              opaque: false,
              pageBuilder: (BuildContext context, _, __) {
                return bottomSheet();
              }));
//          Navigator.push(
//              context,
//              animation(
//                  widget: bottomSheet(),
//                  curve: Curves.fastOutSlowIn,
//                  alignment: Alignment.bottomCenter));
        },
        child: Icon(
          Icons.add,
          size: 30,
          color: kfirstColor,
        ),
        backgroundColor: ksecondColor,
      ),
      backgroundColor: ksecondColor,
      appBar: AppBar(
        backgroundColor: kfirstColor,
        title: Text('Taskey'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: const <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [kfirstColor, ksecondColor]),
              ),
              child: Text(
                'Drawer Header',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.style, color: kfirstColor),
              title: Text('Presets'),
            ),
            ListTile(
              leading: Icon(Icons.assessment, color: kfirstColor),
              title: Text('Your progress'),
            ),
            ListTile(
              leading: Icon(Icons.brush, color: kfirstColor),
              title: Text('Change Theme'),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(60, 30, 30, 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
//                  CircleAvatar(
//                    radius: 30,
//                    backgroundColor: kfirstColor,
//                    child: Icon(
//                      Icons.menu,
//                      color: ksecondColor,
//                    ),
//                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Taskey',
                    style: TextStyle(
                        color: kfirstColor,
                        fontSize: 50,
                        fontWeight: FontWeight.w700),
                  ),
                  Text(
                    '${Provider.of<Data>(context).task.length} tasks',
                    style: TextStyle(color: kfirstColor),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(30),
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [ksecondColor, kfirstColor]),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    )),
                child: tasklist(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
