import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:lottie/lottie.dart';
import '../../core/utils/view_state.dart';
import '../view_models/country_view_model.dart';


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
        if (viewModel.viewData.state.isIdle) {
          return const SizedBox.shrink();
        }

        if (viewModel.viewData.state.isLoading) {
          return Center(
            child: FractionallySizedBox(
              widthFactor: 0.3,
              child: Lottie.asset('assets/loading.json'),
            ),
          );
        }

        if (viewModel.viewData.state.isError &&
            viewModel.viewData.errorMessage != null) {
          return Center(child: Text(viewModel.viewData.errorMessage!));
        }

        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                decoration: const InputDecoration(
                  suffixIcon: Icon(Icons.search),
                ),
                onChanged: (value) {
                  viewModel.filterCountries(value);
                },
                onEditingComplete: () {
                  FocusScope.of(context).unfocus();
                },
              ),
            ),
            Expanded(
              child: RefreshIndicator(
                onRefresh: () async {
                  viewModel.fetchCountries();
                },
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: viewModel.viewData.filteredCountries.length,
                  itemBuilder: (context, index) {
                    final country = viewModel.viewData.filteredCountries[index];
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
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
