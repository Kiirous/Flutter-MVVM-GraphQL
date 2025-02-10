import 'package:graphql_flutter/graphql_flutter.dart';
import '../core/helpers/result.dart';
import '../core/services/graphql_service.dart';
import '../core/endpoints/endpoints.dart';
import '../graphql/queries/countries.graphql.dart';
import '../models/country/country_failure.dart';
import '../models/country/country_model.dart';

class RemoteDatasource {
  final GraphQLClient client;

  RemoteDatasource({required GraphQLEndpoint endpoint})
      : client = GraphQLService.createClient(endpoint);

  Future<Result<CountryFailure, List<Country>>> fetchCountries() async {
    final result = await client.query(
      QueryOptions(document: documentNodeQueryGetCountries),
    );

    if (result.hasException) {
      return const Failure(CountryFailure.connectionError);
    }

    final queryResult = Query$GetCountries.fromJson(result.data!);
    return Success(
      queryResult.countries.map((item) => Country.fromGraphQL(item)).toList(),
    );
  }
}
