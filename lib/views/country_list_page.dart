import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../core/helpers/view_state.dart';
import '../view_models/country/country_view_model.dart';

class CountryListPage extends StatefulWidget {
  const CountryListPage({super.key});

  @override
  State<CountryListPage> createState() => _CountryListPageState();
}

class _CountryListPageState extends State<CountryListPage> {

  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      if (mounted) {
        final viewModel = Provider.of<CountryViewModel>(context, listen: false);
        viewModel.fetchCountries();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<CountryViewModel>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Countries')),
      body: Builder(builder: (context) {
        if (viewModel.state.isIdle) {
          return const SizedBox.shrink();
        }

        if (viewModel.state.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (viewModel.state.isError && viewModel.errorMessage != null) {
          return Center(child: Text(viewModel.errorMessage!));
        }

        return ListView.builder(
          itemCount: viewModel.countries.length,
          itemBuilder: (context, index) {
            final country = viewModel.countries[index];
            return ListTile(
              title: Text(country.name),
              subtitle:
              Text('Code: ${country.code} - Phone: ${country.phone}'),
              trailing: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(country.continent.name),
                  Text('Code: ${country.continent.code}'),
                ],
              ),
            );
          },
        );
      }),
    );
  }
}
