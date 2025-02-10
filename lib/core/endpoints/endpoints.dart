enum GraphQLEndpoint {
  countries,
  anotherEndpoint,
}

class Endpoints {
  static const String countriesEndpoint = 'https://countries.trevorblades.com/';
  static const String anotherEndpoint = 'https://api.anothergraphql.com/';

  static String getEndpoint(GraphQLEndpoint endpoint) {
    switch (endpoint) {
      case GraphQLEndpoint.countries:
        return countriesEndpoint;
      case GraphQLEndpoint.anotherEndpoint:
        return anotherEndpoint;
    }
  }
}