import 'package:pollen_meter/core/domain/profile/enums/allergens.dart';

import '../../../data/ambee_api/dto/pollen_dto.dart';

class PollenModel {
  final PollenCount count;
  final PollenRisk risk;
  final List<TreePollenLevel> treePollenLevels;
  final List<GrassPollenLevel> grassPollenLevels;
  final List<WeedPollenLevel> weedPollenLevels;

  PollenModel(
    this.count,
    this.risk,
    this.treePollenLevels,
    this.grassPollenLevels,
    this.weedPollenLevels,
  );

  @override
  String toString() {
    return 'PollenModel{count: $count, risk: $risk, treePollenLevels: $treePollenLevels, grassPollenLevels: $grassPollenLevels, weedPollenLevels: $weedPollenLevels}';
  }
}

class PollenLevel {
  final Allergens allergens;
  final int level;

  PollenLevel(this.allergens, this.level);

  @override
  String toString() {
    return 'PollenLevel($runtimeType){name: $allergens, level: $level}';
  }
}

class TreePollenLevel extends PollenLevel {
  TreePollenLevel(super.allergens, super.level);
}

class GrassPollenLevel extends PollenLevel {
  GrassPollenLevel(super.allergens, super.level);
}

class WeedPollenLevel extends PollenLevel {
  WeedPollenLevel(super.allergens, super.level);
}
