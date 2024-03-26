import 'package:quds_db/quds_db.dart';

class Geo extends DbModel {
  var startTime = DateTimeField(columnName: "startTime");
  var initialLatitude = StringField(columnName: "initialLatitude");
  var initialLongitude = StringField(columnName: "initialLongitude");
  var region = StringField(columnName: "region");
  var district = StringField(columnName: "district");
  var locationType = StringField(columnName: "locationType");
  var speedLimit = StringField(columnName: "speedLimit");
  var finalLatitude = StringField(columnName: "finalLatitude");
  var finalLongitude = StringField(columnName: "finalLongitude");
  var stopTime = DateTimeField(columnName: "finalTime");

  @override
  List<FieldWithValue>? getFields() => [
        startTime,
        initialLatitude,
        initialLongitude,
        region,
        district,
        locationType,
        stopTime,
        finalLatitude,
        finalLongitude,
      ];
}
