import 'package:flutter_test/flutter_test.dart';
import 'package:graphql_request/core/helpers/view_state.dart';
import 'package:graphql_request/presentation/view_models/country_view_model.dart';

import '../../../mocks/fake_country_repository.dart';

void main() {
  late CountryViewModel viewModel;

  group('fetchCountries', () {
    test('should update viewData with success state when repository returns data', () async {
      viewModel = CountryViewModel(FakeCountryRepositorySuccess());

      await viewModel.fetchCountries();

      expect(viewModel.viewData.state, ViewState.success);
      expect(viewModel.viewData.countries.length, 2);
    });

    test('should update viewData with error state when repository returns failure', () async {
      viewModel = CountryViewModel(FakeCountryRepositoryFailure());

      await viewModel.fetchCountries();

      expect(viewModel.viewData.state, ViewState.error);
      expect(viewModel.viewData.errorMessage, isNotNull);
    });
  });
}