import 'package:graphql_request/core/services/country_cache_service.dart';
import 'package:graphql_request/models/country/country_model_adapter.dart';

class FakeCountryCacheService implements CountryCacheService {
  @override
  Future<List<CountryModel>> getCachedCountries() async {
    return <CountryModel>[];
  }

  @override
  Future<bool> hasCache() async {
    return false;
  }

  @override
  Future<void> saveCountries(List<CountryModel> countries) async {}
}
