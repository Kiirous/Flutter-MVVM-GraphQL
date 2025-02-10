import 'package:flutter/material.dart';

import '../../core/helpers/result.dart';
import '../../core/helpers/view_state.dart';
import '../../domain/country_repository.dart';
import '../../models/country/country_failure.dart';
import '../../models/country/country_model.dart';

class CountryViewModel extends ChangeNotifier {
  final CountryRepository _repository;

  CountryViewModel(this._repository);

  final List<Country> _countries = [];
  List<Country> get countries => _countries;

  ViewState _state = ViewState.idle;
  ViewState get state => _state;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  Future<void> fetchCountries() async {
    _state = ViewState.loading;
    _errorMessage = null;
    notifyListeners();

    final result = await _repository.fetchCountries();

    if (result case Failure(exception: final exception)) {
      switch (exception) {
        case CountryFailure.connectionError:
          _errorMessage = 'Service is not working now. Try again later.';
          break;
        case CountryFailure.timeOut:
          _errorMessage = 'Service is taking too long to respond. Try again.';
          break;
        default:
          _errorMessage = 'Oops, something went wrong. Try again later.';
      }
      _state = ViewState.error;
      notifyListeners();
      return;
    }

    if (result case Success(value: final countryList)) {
      _countries.clear();
      _countries.addAll(countryList);
      _state = ViewState.success;
    }

    notifyListeners();
  }
}
