import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:graphql_request/core/utils/result.dart';
import 'package:graphql_request/data/country_remote_datasource.dart';
import 'package:graphql_request/models/country/continent_model.dart';
import 'package:graphql_request/models/country/country_failure.dart';
import 'package:graphql_request/models/country/country_model.dart';

class FakeRemoteDatasourceSuccess implements CountryRemoteDatasource {
  @override
  Future<Result<CountryFailure, List<Country>>> fetchCountries() async {
    return Success([
      Country(name: 'Brazil', code: 'BR', continent: Continent(name: 'South America', code: 'SA'), phone: '+55'),
      Country(name: 'Germany', code: 'DE', continent: Continent(name: 'Europe', code: 'EU'), phone: '+49'),
    ]);
  }

  @override
  GraphQLClient get client => throw UnimplementedError();
}

class FakeRemoteDatasourceFailure implements CountryRemoteDatasource {
  @override
  Future<Result<CountryFailure, List<Country>>> fetchCountries() async {
    return const Failure(CountryFailure.connectionError);
  }

  @override
  GraphQLClient get client => throw UnimplementedError();
}