import 'package:graphql_request/core/utils/result.dart';
import 'package:graphql_request/domain/country_repository.dart';
import 'package:graphql_request/models/country/continent.dart';
import 'package:graphql_request/models/country/country_failure.dart';
import 'package:graphql_request/models/country/country.dart';

class FakeCountryRepositorySuccess implements CountryRepository {
  @override
  Future<Result<CountryFailure, List<Country>>> fetchCountries() async {
    return Success([
      Country(name: 'Brazil', code: 'BR', continent: Continent(name: 'South America', code: 'SA'), phone: '+55'),
      Country(name: 'Germany', code: 'DE', continent: Continent(name: 'Europe', code: 'EU'), phone: '+49'),
    ]);
  }
}

class FakeCountryRepositoryFailure implements CountryRepository {
  @override
  Future<Result<CountryFailure, List<Country>>> fetchCountries() async {
    return const Failure(CountryFailure.connectionError);
  }
}