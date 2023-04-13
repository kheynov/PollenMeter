import 'package:json_annotation/json_annotation.dart';

part 'pollen_dto.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class PollenDTO {
  @JsonKey(name: 'Count')
  final PollenCount count;

  @JsonKey(name: 'Risk')
  final PollenRisk risk;

  @JsonKey(name: 'Species')
  final PollenSpecies species;

  @JsonKey(name: 'updatedAt')
  final String updatedAt;

  PollenDTO(this.count, this.risk, this.species, this.updatedAt);

  factory PollenDTO.fromJson(Map<String, dynamic> json) {
    return _$PollenDTOFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PollenDTOToJson(this);
}

@JsonSerializable(ignoreUnannotated: true)
class PollenCount {
  @JsonKey(name: 'grass_pollen')
  final int grassPollen;

  @JsonKey(name: 'tree_pollen')
  final int treePollen;

  @JsonKey(name: 'weed_pollen')
  final int weedPollen;

  PollenCount(this.grassPollen, this.treePollen, this.weedPollen);

  factory PollenCount.fromJson(Map<String, dynamic> json) =>
      _$PollenCountFromJson(json);

  Map<String, dynamic> toJson() => _$PollenCountToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class PollenRisk {
  @JsonKey(name: 'grass_pollen')
  final String grassPollen;

  @JsonKey(name: 'tree_pollen')
  final String treePollen;

  @JsonKey(name: 'weed_pollen')
  final String weedPollen;

  PollenRisk(this.grassPollen, this.treePollen, this.weedPollen);

  factory PollenRisk.fromJson(Map<String, dynamic> json) {
    return _$PollenRiskFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PollenRiskToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class PollenSpecies {
  @JsonKey(name: 'Grass')
  final Map<String, int> grass;

  @JsonKey(name: 'Tree')
  final Map<String, int> tree;

  @JsonKey(name: 'Weed')
  final Map<String, int> weed;

  @JsonKey(name: 'Others')
  final int other;

  PollenSpecies(this.grass, this.tree, this.weed, this.other);

  factory PollenSpecies.fromJson(Map<String, dynamic> json) {
    return _$PollenSpeciesFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PollenSpeciesToJson(this);
}
