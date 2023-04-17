import 'package:pollen_meter/core/domain/profile/enums/allergens.dart';

class PollenModel {
  final PollenCount count;
  final List<PollenLevel> treePollenLevels;
  final List<PollenLevel> grassPollenLevels;
  final List<PollenLevel> weedPollenLevels;

  PollenModel(
    this.count,
    this.treePollenLevels,
    this.grassPollenLevels,
    this.weedPollenLevels,
  );

  @override
  String toString() {
    return 'PollenModel{count: $count, treePollenLevels: $treePollenLevels, grassPollenLevels: $grassPollenLevels, weedPollenLevels: $weedPollenLevels}';
  }
}

class PollenCount {
  final int grassPollen;
  final int treePollen;
  final int weedPollen;

  PollenCount(this.grassPollen, this.treePollen, this.weedPollen);
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
