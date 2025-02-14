import 'package:graphql_flutter/graphql_flutter.dart';
import '../core/utils/result.dart';
import '../core/services/graphql_service.dart';
import '../core/endpoints/endpoints.dart';
import '../graphql/queries/countries.graphql.dart';
import '../models/country/country_failure.dart';
import '../models/country/country_model.dart';

class CountryRemoteDatasource {
  final GraphQLClient client;

  CountryRemoteDatasource({required GraphQLEndpoint endpoint})
      : client = GraphQLService.createClient(endpoint);

  Future<Result<CountryFailure, List<Country>>> fetchCountries() async {
    final result = await client.query(
      QueryOptions(
        document: documentNodeQueryGetCountries,
        fetchPolicy: FetchPolicy.cacheFirst,
      ),
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
