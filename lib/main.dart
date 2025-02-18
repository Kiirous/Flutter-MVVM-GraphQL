import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'core/services/hive_service.dart';
import 'di/dependency_injection.dart';
import 'presentation/view_models/country_view_model.dart';
import 'presentation/views/country_list_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveService.init();
  await dotenv.load(fileName: ".env");

  runApp(
    setupDependencyInjection(child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Consumer<CountryViewModel>(
        builder: (context, viewModel, child) => const CountryListPage(),
      ),
    );
  }
}
