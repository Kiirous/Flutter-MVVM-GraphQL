import '../../core/utils/view_state.dart';
import '../../models/country/country.dart';

class CountryViewData {
  const CountryViewData({
    required this.countries,
    required this.filteredCountries,
    required this.errorMessage,
    required this.state,
  });

  final List<Country> countries;
  final List<Country> filteredCountries;
  final String? errorMessage;
  final ViewState state;

  CountryViewData.empty()
      : countries = [],
        filteredCountries = [],
        errorMessage = null,
        state = ViewState.idle;

  CountryViewData copyWith({
    List<Country>? countries,
    List<Country>? filteredCountries,
    String? errorMessage,
    ViewState? state,
  }) {
    return CountryViewData(
      countries: countries ?? this.countries,
      filteredCountries: filteredCountries ?? this.filteredCountries,
      errorMessage: errorMessage ?? this.errorMessage,
      state: state ?? this.state,
    );
  }
}
