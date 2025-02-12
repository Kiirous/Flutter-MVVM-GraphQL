import 'package:flutter/material.dart';
import '../../domain/country_repository.dart';
import '../../core/helpers/result.dart';
import '../../core/helpers/view_state.dart';
import '../../models/country/country_failure.dart';
import '../../models/country/country_model.dart';
import '../../presentation/view_data/country_view_data.dart';

class CountryViewModel extends ChangeNotifier {
  final CountryRepository _repository;

  CountryViewModel(this._repository);

  CountryViewData viewData = CountryViewData.empty();

  Future<void> fetchCountries() async {
    _setLoadingState();

    final result = await _repository.fetchCountries();

    switch (result) {
      case Success(value: final countryList):
        _handleSuccess(countryList);
      case Failure(exception: final exception):
        _handleError(exception);
    }
  }

  void filterCountries(String value) {
    final query = value.toLowerCase().trim();

    final filteredList = viewData.countries.where((country) {
      return country.name.toLowerCase().contains(query) ||
          country.code.toLowerCase().contains(query) ||
          country.continent.name.toLowerCase().contains(query) ||
          country.continent.code.toLowerCase().contains(query) ||
          country.phone.toLowerCase().contains(query);
    }).toList();

    if (viewData.filteredCountries != filteredList) {
      viewData = viewData.copyWith(filteredCountries: filteredList);
      notifyListeners();
    }
  }

  void _setLoadingState() {
    viewData = viewData.copyWith(state: ViewState.loading, errorMessage: null);
    notifyListeners();
  }

  void _handleSuccess(List<Country> countryList) {
    viewData = viewData.copyWith(
      countries: countryList,
      filteredCountries: countryList,
      state: ViewState.success,
    );
    notifyListeners();
  }

  void _handleError(CountryFailure exception) {
    final errorMessage = switch (exception) {
      CountryFailure.connectionError =>
        'Service is not working now. Try again later.',
      CountryFailure.timeOut =>
        'Service is taking too long to respond. Try again.',
      _ => 'Oops, something went wrong. Try again later.',
    };

    viewData = viewData.copyWith(
      errorMessage: errorMessage,
      state: ViewState.error,
    );
    notifyListeners();
  }
}
