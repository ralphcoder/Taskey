import 'Task.dart';
import 'package:flutter/material.dart';
import 'package:taskey/constants.dart';
import 'package:provider/provider.dart';
import 'package:taskey/widgets/data.dart';

class tasklist extends StatefulWidget {
  @override
  _tasklistState createState() => _tasklistState();
}

class _tasklistState extends State<tasklist> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return Dismissible(
          child: listtile(
            name: Provider.of<Data>(context).task[index].name,
            isdone: Provider.of<Data>(context).task[index].isDone,
            checkcallback: (checkBoxState) {
              setState(() {
                print(index);
                Provider.of<Data>(context, listen: false).update(index);
              });
            },
          ),
          background: ClipRect(
              child: Container(
            child: Center(
                child: Icon(
              Icons.delete,
              color: kfirstColor,
            )),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(19)),
              gradient: LinearGradient(colors: [kfirstColor, ksecondColor]),
            ),
          )),
          key: ValueKey(Provider.of<Data>(context).task[index].name),
          onDismissed: (horizontal) {
            setState(() {
              Provider.of<Data>(context, listen: false).deletetask(index);
            });
          },
        );
      },
      itemCount: Provider.of<Data>(context).task.length,
    );
  }
}

class listtile extends StatelessWidget {
  final String name;
  final bool isdone;
  final Function checkcallback;
  listtile({this.name, this.isdone, this.checkcallback});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(
        name,
        style: TextStyle(
            color: kfirstColor,
            fontSize: 16,
            fontWeight: FontWeight.w500,
            decoration: isdone ? TextDecoration.lineThrough : null),
      ),
      trailing: Checkbox(
        onChanged: checkcallback,
        checkColor: ksecondColor,
        activeColor: kfirstColor,
        value: isdone,
      ),
    );
  }
}
