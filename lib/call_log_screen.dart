import 'package:flutter/material.dart';

class CallLogScreen extends StatefulWidget {
  const CallLogScreen({Key? key}) : super(key: key);

  @override
  _CallLogScreenState createState() => _CallLogScreenState();
}

class _CallLogScreenState extends State<CallLogScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Call log'),
      ),
    );
  }
}
