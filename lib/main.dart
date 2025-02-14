import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:graphql_request/domain/country_repository.dart';
import 'package:provider/provider.dart';
import 'core/endpoints/endpoints.dart';
import 'core/services/country_cache_service.dart';
import 'core/services/hive_service.dart';
import 'data/country_remote_datasource.dart';
import 'presentation/view_models/country_view_model.dart';
import 'presentation/views/country_list_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveService.init();
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CountryViewModel(
        CountryRepository(
          CountryRemoteDatasource(endpoint: GraphQLEndpoint.countries),
        ),
        CountryCacheService(),
      ),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: CountryListPage(),
      ),
    );
  }
}
