import 'package:hive/hive.dart';
import '../../models/country/country_model_adapter.dart';

class CountryCacheService {
  static const String _boxName = "countriesBox";

  Future<void> saveCountries(List<CountryModel> countries) async {
    final box = await Hive.openBox<CountryModel>(_boxName);
    await box.clear();
    await box.addAll(countries);
  }

  Future<List<CountryModel>> getCachedCountries() async {
    final box = await Hive.openBox<CountryModel>(_boxName);
    return box.values.toList();
  }

  Future<bool> hasCache() async {
    final box = await Hive.openBox<CountryModel>(_boxName);
    return box.isNotEmpty;
  }
}