import 'package:graphql_flutter/graphql_flutter.dart';
import '../endpoints/endpoints.dart';

class GraphQLService {
  static GraphQLClient createClient(GraphQLEndpoint endpoint) {
    final HttpLink httpLink = HttpLink(Endpoints.getEndpoint(endpoint));

    return GraphQLClient(
      link: httpLink,
      cache: GraphQLCache(),
    );
  }
}