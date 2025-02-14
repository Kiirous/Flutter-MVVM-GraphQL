import 'package:flutter_test/flutter_test.dart';
import 'package:graphql_request/core/utils/result.dart';
import 'package:graphql_request/data/country_remote_datasource.dart';
import 'package:graphql_request/models/country/country_failure.dart';
import '../../../mocks/fake_remote_datasource.dart';

void main() {
  late CountryRemoteDatasource remoteDatasource;

  group('fetchCountries', () {
    test('should return a list of countries on success', () async {
      remoteDatasource = FakeRemoteDatasourceSuccess();

      final result = await remoteDatasource.fetchCountries();

      expect(result, isA<Success>());
      expect((result as Success).value.length, 2);
    });

    test('should return a failure when there is an error', () async {
      remoteDatasource = FakeRemoteDatasourceFailure();

      final result = await remoteDatasource.fetchCountries();

      expect(result, isA<Failure>());
      expect((result as Failure).exception, CountryFailure.connectionError);
    });
  });
}