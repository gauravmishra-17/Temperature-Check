import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:temperature_check/model/Temperature.dart';

class DatabaseService {
  DatabaseService();

  //collection reference
  final CollectionReference teamCollection =
      FirebaseFirestore.instance.collection('Temperature');

  Future updateTemperature(String temperatureValue, String time) async {
    Timestamp created = Timestamp.fromDate(DateTime.now());
    return await teamCollection.doc().set({
      'temperatureValue': temperatureValue,
      'time': time,
      'timestamp': created,
    });
  }

  List<Temperature> _temperatureListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Temperature(
        temperatureValue: doc.get('temperatureValue'),
        time: doc.get('time'),
      );
    }).toList();
  }

  Stream<List<Temperature>> get records {
    return teamCollection
        .orderBy('timestamp')
        .snapshots()
        .map(_temperatureListFromSnapshot);
  }
}
