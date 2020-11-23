import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:temperature_check/model/Temperature.dart';
import 'package:temperature_check/services/database_service.dart';
import 'package:temperature_check/widgets/temperature_card.dart';

class Recordings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Temperature>>.value(
      value: DatabaseService().records,
      child: TemperatureList(),
    );
  }
}

class TemperatureList extends StatefulWidget {
  @override
  _TemperatureListState createState() => _TemperatureListState();
}

class _TemperatureListState extends State<TemperatureList> {
  @override
  Widget build(BuildContext context) {
    final temperatures = Provider.of<List<Temperature>>(context);

    return ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: temperatures.length,
        itemBuilder: (context, index) {
          return TemperatureCard(temperature: temperatures[index]);
        });
  }
}
