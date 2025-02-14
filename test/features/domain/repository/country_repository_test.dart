import 'package:flutter_test/flutter_test.dart';
import 'package:graphql_request/core/utils/result.dart';
import 'package:graphql_request/domain/country_repository.dart';
import 'package:graphql_request/models/country/country_failure.dart';

import '../../../mocks/fake_country_repository.dart';

void main() {
  late CountryRepository repository;

  group('fetchCountries', () {
    test('should return a list of countries on success', () async {
      repository = FakeCountryRepositorySuccess();

      final result = await repository.fetchCountries();

      expect(result, isA<Success>());
      expect((result as Success).value.length, 2);
    });

    test('should return a failure when there is an error', () async {
      repository = FakeCountryRepositoryFailure();

      final result = await repository.fetchCountries();

      expect(result, isA<Failure>());
      expect((result as Failure).exception, CountryFailure.connectionError);
    });
  });
}