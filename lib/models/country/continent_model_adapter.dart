import 'package:hive/hive.dart';
import 'continent.dart';

part 'continent_model_adapter.g.dart';

@HiveType(typeId: 1)
class ContinentModel extends HiveObject {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final String code;

  ContinentModel({required this.name, required this.code});

  factory ContinentModel.fromGraphQL(Map<String, dynamic> json) {
    return ContinentModel(
      name: json['name'] as String,
      code: json['code'] as String,
    );
  }

  Continent toEntity() => Continent(name: name, code: code);

  static ContinentModel fromEntity(Continent entity) =>
      ContinentModel(name: entity.name, code: entity.code);
}
