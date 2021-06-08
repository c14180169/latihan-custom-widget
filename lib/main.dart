import 'package:flutter/material.dart';
import 'classAPI.dart';
import 'classTemp.dart';
import 'result.dart';

DataAPI temp = DataAPI(latitude: 0, longitude: 0);
DataTemp temp1 = DataTemp(temperature: 0, pressure: 0, humidity: 0);

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/': (context) => HalamanSatu(),
        '/result': (context) => HalamanResult(),
      },
      theme: ThemeData(primarySwatch: Colors.orange),
    );
  }
}

class HalamanSatu extends StatefulWidget {
  const HalamanSatu({Key? key}) : super(key: key);

  @override
  _HalamanSatuState createState() => _HalamanSatuState();
}

class _HalamanSatuState extends State<HalamanSatu> {
  TextEditingController textController = TextEditingController();

  DataAPI? weather;
  DataTemp? temperature;
  void getAPI(String param) {
    DataAPI.connectToAPI(param).then((value) {
      weather = value;
      setState(() {
        temp.setLat(weather!.latitude);
        temp.setLon(weather!.longitude);
      });
    });
    DataTemp.connectToAPI(param).then((value) {
      temperature = value;
      setState(() {
        temp1.temperature = temperature!.temperature;
        temp1.pressure = temperature!.pressure;
        temp1.humidity = temperature!.humidity;
      });
    });
  }

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
              'WeatherApp',
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
              child: Icon(
                Icons.wb_sunny_rounded,
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
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(30, 0, 30, 10),
              child: TextFormField(
                onChanged: (_) => setState(() {}),
                controller: textController,
                obscureText: false,
                decoration: InputDecoration(
                  hintText: 'Masukkan nama kota',
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0x00000000),
                      width: 1,
                    ),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(4.0),
                      topRight: Radius.circular(4.0),
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0x00000000),
                      width: 1,
                    ),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(4.0),
                      topRight: Radius.circular(4.0),
                    ),
                  ),
                  suffixIcon: textController.text.isNotEmpty
                      ? InkWell(
                          onTap: () => setState(
                            () => textController.clear(),
                          ),
                          child: Icon(
                            Icons.clear,
                            color: Color(0xFF757575),
                            size: 22,
                          ),
                        )
                      : null,
                ),
              ),
            ),
            Align(
              alignment: Alignment(0, 1),
              child: Padding(
                padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                child: SizedBox(
                  width: double.maxFinite,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        getAPI(textController.text);
                        final snackBar = SnackBar(content: Text('Kota error'));
                        if (temp1.temperature == 0 && temp1.pressure == 0) {
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        } else {
                          Navigator.pushNamed(context, '/result');
                        }
                      });
                    },
                    child: Text('Search'),
                    // icon: Icon(
                    //   Icons.search,
                    //   size: 15,
                    // ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
