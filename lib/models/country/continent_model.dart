import '../../graphql/queries/countries.graphql.dart';

class Continent {
  final String name;
  final String code;

  Continent({
    required this.name,
    required this.code,
  });

  factory Continent.fromGraphQL(
    Query$GetCountries$countries$continent graphQLContinent,
  ) {
    return Continent(
      name: graphQLContinent.name,
      code: graphQLContinent.code,
    );
  }
}
