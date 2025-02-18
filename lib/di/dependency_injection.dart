import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../core/endpoints/endpoints.dart';
import '../core/services/country_cache_service.dart';
import '../data/country_remote_datasource.dart';
import '../domain/country_repository.dart';
import '../presentation/view_models/country_view_model.dart';

MultiProvider setupDependencyInjection({required Widget child}) {
  return MultiProvider(
    providers: [
      Provider<CountryRemoteDatasource>(
        create: (_) => CountryRemoteDatasource(endpoint: GraphQLEndpoint.countries),
      ),
      Provider<CountryCacheService>(
        create: (_) => CountryCacheService(),
      ),
      Provider<CountryRepository>(
        create: (context) => CountryRepository(
          context.read<CountryRemoteDatasource>(),
        ),
      ),
      ChangeNotifierProvider<CountryViewModel>(
        lazy: false,
        create: (context) => CountryViewModel(
          context.read<CountryRepository>(),
          context.read<CountryCacheService>(),
        ),
      ),
    ],
    child: child,
  );
}
