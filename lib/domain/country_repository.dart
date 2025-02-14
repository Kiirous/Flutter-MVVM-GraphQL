import '../core/utils/result.dart';
import '../data/country_remote_datasource.dart';
import '../models/country/country_failure.dart';
import '../models/country/country.dart';

class CountryRepository {
  final CountryRemoteDatasource _remoteDatasource;

  CountryRepository(this._remoteDatasource);

  Future<Result<CountryFailure, List<Country>>> fetchCountries() async {
    return await _remoteDatasource.fetchCountries();
  }
}
