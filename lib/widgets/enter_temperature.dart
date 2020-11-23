import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:temperature_check/services/database_service.dart';

class EnterTemperature extends StatefulWidget {
  @override
  _EnterTemperatureState createState() => _EnterTemperatureState();
}

class _EnterTemperatureState extends State<EnterTemperature> {
  DatabaseService _databaseService = DatabaseService();
  TextEditingController temperatureInput = TextEditingController();
  String temperatureValue;

  void clear() {
    temperatureInput.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        SizedBox(height: 20),
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
              padding: EdgeInsets.all(20),
              color: Colors.grey,
              child: Text(
                'Enter Your Temperature',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              )),
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Container(
                width: 50,
                color: Colors.grey[300],
                child: TextFormField(
                  controller: temperatureInput,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    setState(() {
                      temperatureValue = value;
                    });
                  },
                ),
              ),
            ),
            Text(
              '°C',
              style: TextStyle(fontSize: 50),
            )
          ],
        ),
        RaisedButton(
            color: Colors.black,
            onPressed: () async {
              DateTime now = DateTime.now();
              String formattedDate =
                  DateFormat('kk:mm:ss \n EEE d MMM').format(now);
              await _databaseService.updateTemperature(
                  temperatureValue, formattedDate);
              clear();
            },
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Text(
              'Submit',
              style: TextStyle(color: Colors.grey),
            ))
      ],
    ));
  }
}
