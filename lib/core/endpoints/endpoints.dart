import 'package:flutter_dotenv/flutter_dotenv.dart';

enum GraphQLEndpoint {
  countries,
  anotherEndpoint,
}

class Endpoints {
  static String get countriesEndpoint => dotenv.env['COUNTRIES_API'] ?? '';
  static String get anotherEndpoint => dotenv.env['XPTO_API'] ?? '';

  static String getEndpoint(GraphQLEndpoint endpoint) {
    switch (endpoint) {
      case GraphQLEndpoint.countries:
        return countriesEndpoint;
      case GraphQLEndpoint.anotherEndpoint:
        return anotherEndpoint;
    }
  }
}