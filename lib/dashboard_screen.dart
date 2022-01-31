import 'package:call_tracking/call_log_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {

  final TextEditingController _numberCtrl = TextEditingController();


  @override
  void initState() {
    super.initState();
    _numberCtrl.text = "085921191121";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _numberCtrl,
              decoration: const InputDecoration(labelText: "Phone Number"),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 12,),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    child: const Text("Test Call"),
                    onPressed: () async {
                      FlutterPhoneDirectCaller.callNumber(_numberCtrl.text);
                    },
                  ),
                ),
                const SizedBox(width: 16,),
                Expanded(
                  child: ElevatedButton(
                    child: const Text("Call log"),
                    onPressed: () {
                      // Navigator.push(context, MaterialPageRoute(builder: (context)=> const CallLogScreen()));
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const CallLogScreen()),
                      );
                    },
                  ),
                ),

              ],
            )
          ],
        ),
      ),
    );
  }
}
