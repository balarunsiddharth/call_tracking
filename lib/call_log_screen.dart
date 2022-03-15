import 'package:flutter/material.dart';
import 'package:call_log/call_log.dart';
import 'package:intl/intl.dart';

class CallLogScreen extends StatefulWidget {
  const CallLogScreen({Key? key}) : super(key: key);

  @override
  _CallLogScreenState createState() => _CallLogScreenState();
}

class _CallLogScreenState extends State<CallLogScreen> {
// GET WHOLE CALL LOG
//   Iterable<CallLogEntry> entries = await CallLog.get();
  Iterable<CallLogEntry> entries = <CallLogEntry>[];
  bool _init = true;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if(_init){
      _callLogs();
      _init = false;
    }
  }
  void _callLogs()async{
    // entries = await CallLog.get();
    // QUERY CALL LOG (ALL PARAMS ARE OPTIONAL)
    var now = DateTime.now();
    int from = now.subtract(const Duration(days: 60)).millisecondsSinceEpoch;
    int to = now./*subtract(const Duration(days: 30)).*/millisecondsSinceEpoch;
    Iterable<CallLogEntry> data = await CallLog.query();
    setState(() {
      entries = data;
    });
    print('entry data ----> $entries');
  }

  /*int? _timestamp(int? data)  {
    return data;
  }*/
  @override
  Widget build(BuildContext context) {
    print('entries ---> $entries');
    return Scaffold(
      body:
      ListView.builder(
        itemCount:
        entries.length,
        padding: const EdgeInsets.fromLTRB(26, 36, 26, 36),
        itemBuilder: (_, index) => ListTile(
          title: Text(entries.elementAt(index).number.toString()),
          subtitle: Text(DateFormat('dd MM yyyy - hh:mm:ss')
              .format(DateTime.fromMillisecondsSinceEpoch(entries.elementAt(index).timestamp ?? 00))),
          trailing: Container(
            padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
              decoration: BoxDecoration(
                color: Colors.greenAccent,
                borderRadius: BorderRadius.circular(3)
              ),
              child: Text('${entries.elementAt(index).duration.toString()} s', style: const TextStyle(
                color:  Colors.white
              ),)),
        ),
      ),
    );
  }
}
