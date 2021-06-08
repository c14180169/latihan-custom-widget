import 'package:flutter/material.dart';
import 'main.dart';

class HalamanResult extends StatefulWidget {
  @override
  _HalamanResultState createState() => _HalamanResultState();
}

class _HalamanResultState extends State<HalamanResult> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Result',
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
              child: Icon(
                Icons.account_box,
                color: Color(0xFFF4D312),
                size: 24,
              ),
            )
          ],
        ),
        actions: [],
        centerTitle: true,
        elevation: 4,
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text("LATITUDE : " + temp.latitude.toString()),
              Text("LONGITUDE : " + temp.longitude.toString()),
              Text("TEMPERATURE : " + temp1.temperature.toString()),
              Text("PRESSURE : " + temp1.pressure.toString()),
              Text("HUMIDITY : " + temp1.humidity.toString()),
            ],
          ),
        ),
      ),
    );
  }
}
