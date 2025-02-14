import 'package:flutter/material.dart';
import '../../core/services/country_cache_service.dart';
import '../../domain/country_repository.dart';
import '../../core/utils/result.dart';
import '../../core/utils/view_state.dart';
import '../../models/country/country_failure.dart';
import '../../models/country/country.dart';
import '../../models/country/country_model_adapter.dart';
import '../../presentation/view_data/country_view_data.dart';

class CountryViewModel extends ChangeNotifier {
  final CountryRepository _repository;
  final CountryCacheService _cacheService;

  CountryViewModel(this._repository, this._cacheService);

  CountryViewData viewData = CountryViewData.empty();

  Future<void> fetchCountries() async {
    _setLoadingState();

    if (await _cacheService.hasCache()) {
      final cachedCountries = await _cacheService.getCachedCountries();
      final countries = cachedCountries.map((e) => e.toEntity()).toList();
      _handleSuccess(countries);
      return;
    }

    final result = await _repository.fetchCountries();

    switch (result) {
      case Success(value: final countryList):
        final countryModels = countryList.map((e) => CountryModel.fromEntity(e)).toList();
        await _cacheService.saveCountries(countryModels);
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
