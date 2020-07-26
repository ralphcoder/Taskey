import 'package:flutter/material.dart';
import 'package:taskey/screens/taskScreen.dart';
import 'package:provider/provider.dart';
import 'package:taskey/widgets/data.dart';

void main() {
  runApp(that());
}

class that extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      lazy: false,
      create: (context) => Data(),
      child: MaterialApp(
        home: taskScreen(),
      ),
    );
  }
}
