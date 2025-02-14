import 'package:hive/hive.dart';
import 'continent_model_adapter.dart';
import 'country.dart';

part 'country_model_adapter.g.dart';

@HiveType(typeId: 0)
class CountryModel extends HiveObject {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final String code;

  @HiveField(2)
  final String phone;

  @HiveField(3)
  final ContinentModel continent;

  CountryModel({
    required this.name,
    required this.code,
    required this.phone,
    required this.continent,
  });

  factory CountryModel.fromGraphQL(Map<String, dynamic> json) {
    return CountryModel(
      name: json['name'] as String,
      code: json['code'] as String,
      phone: json['phone'] as String,
      continent: ContinentModel.fromGraphQL(json['continent']),
    );
  }

  Country toEntity() {
    return Country(
      name: name,
      code: code,
      phone: phone,
      continent: continent.toEntity(),
    );
  }

  static CountryModel fromEntity(Country entity) {
    return CountryModel(
      name: entity.name,
      code: entity.code,
      phone: entity.phone,
      continent: ContinentModel.fromEntity(entity.continent),
    );
  }
}
