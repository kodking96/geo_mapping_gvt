import 'package:geo_mapping_app/models/location_point.dart';
import 'package:quds_db/quds_db.dart';

class MainDatabaseController {
  GeoProvider geoProvider = GeoProvider();

  void insertGeo(Geo geo) async {
    await geoProvider.insertEntry(geo);
  }
}

class GeoProvider extends DbTableProvider<Geo> {
  GeoProvider() : super(() => Geo());

  String get tableName => 'Geo';
}
