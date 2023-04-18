import 'package:json_annotation/json_annotation.dart';

part 'pollen_dto.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class PollenDTO {
  @JsonKey(name: 'Count')
  final PollenCountDTO count;

  @JsonKey(name: 'Risk')
  final PollenRiskDTO risk;

  @JsonKey(name: 'Species')
  final PollenSpeciesDTO species;

  @JsonKey(name: 'updatedAt')
  final String updatedAt;

  PollenDTO(this.count, this.risk, this.species, this.updatedAt);

  factory PollenDTO.fromJson(Map<String, dynamic> json) {
    return _$PollenDTOFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PollenDTOToJson(this);
}

@JsonSerializable(ignoreUnannotated: true)
class PollenCountDTO {
  @JsonKey(name: 'grass_pollen')
  final int grassPollen;

  @JsonKey(name: 'tree_pollen')
  final int treePollen;

  @JsonKey(name: 'weed_pollen')
  final int weedPollen;

  PollenCountDTO(this.grassPollen, this.treePollen, this.weedPollen);

  factory PollenCountDTO.fromJson(Map<String, dynamic> json) =>
      _$PollenCountFromJson(json);

  Map<String, dynamic> toJson() => _$PollenCountToJson(this);

  @override
  String toString() {
    return 'PollenCount{grassPollen: $grassPollen, treePollen: $treePollen, weedPollen: $weedPollen}';
  }
}

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class PollenRiskDTO {
  @JsonKey(name: 'grass_pollen')
  final String grassPollen;

  @JsonKey(name: 'tree_pollen')
  final String treePollen;

  @JsonKey(name: 'weed_pollen')
  final String weedPollen;

  PollenRiskDTO(this.grassPollen, this.treePollen, this.weedPollen);

  factory PollenRiskDTO.fromJson(Map<String, dynamic> json) {
    return _$PollenRiskFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PollenRiskToJson(this);

  @override
  String toString() {
    return 'PollenRisk{grassPollen: $grassPollen, treePollen: $treePollen, weedPollen: $weedPollen}';
  }
}

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class PollenSpeciesDTO {
  @JsonKey(name: 'Grass')
  final Map<String, int> grass;

  @JsonKey(name: 'Tree')
  final Map<String, int> tree;

  @JsonKey(name: 'Weed')
  final Map<String, int> weed;

  @JsonKey(name: 'Others')
  final int other;

  PollenSpeciesDTO(this.grass, this.tree, this.weed, this.other);

  factory PollenSpeciesDTO.fromJson(Map<String, dynamic> json) {
    return _$PollenSpeciesFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PollenSpeciesToJson(this);

  @override
  String toString() {
    return 'PollenSpecies{grass: $grass, tree: $tree, weed: $weed, other: $other}';
  }
}
