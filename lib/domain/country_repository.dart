import '../core/helpers/result.dart';
import '../data/remote_datasource.dart';
import '../models/country/country_failure.dart';
import '../models/country/country_model.dart';

class CountryRepository {
  final RemoteDatasource _remoteDatasource;

  CountryRepository(this._remoteDatasource);

  Future<Result<CountryFailure, List<Country>>> fetchCountries() async {
    return await _remoteDatasource.fetchCountries();
  }
}
