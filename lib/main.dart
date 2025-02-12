import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:graphql_request/domain/country_repository.dart';
import 'package:provider/provider.dart';
import 'core/endpoints/endpoints.dart';
import 'data/remote_datasource.dart';
import 'presentation/view_models/country_view_model.dart';
import 'presentation/views/country_list_page.dart';

void main() async {
  await initHiveForFlutter();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CountryViewModel(
        CountryRepository(RemoteDatasource(endpoint: GraphQLEndpoint.countries)),
      ),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: CountryListPage(),
      ),
    );
  }
}
