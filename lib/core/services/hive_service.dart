import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../models/country/continent_model_adapter.dart';
import '../../models/country/country_model_adapter.dart';

class HiveService {
  static Future<void> init() async {
    await initHiveForFlutter();
    await Hive.initFlutter();

    Hive.registerAdapter(CountryModelAdapter());
    Hive.registerAdapter(ContinentModelAdapter());
  }
}