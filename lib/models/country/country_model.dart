import '../../graphql/queries/countries.graphql.dart';
import 'continent_model.dart';

class Country {
  final String name;
  final String code;
  final String phone;
  final Continent continent;

  Country({
    required this.name,
    required this.code,
    required this.phone,
    required this.continent,
  });

  factory Country.fromGraphQL(Query$GetCountries$countries graphQLCountry) {
    return Country(
      name: graphQLCountry.name,
      code: graphQLCountry.code,
      phone: graphQLCountry.phone,
      continent: Continent.fromGraphQL(graphQLCountry.continent),
    );
  }
}