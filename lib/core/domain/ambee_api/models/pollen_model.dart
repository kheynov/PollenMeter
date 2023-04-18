import 'package:pollen_meter/core/domain/profile/enums/allergen.dart';

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

  Map<String, dynamic> toJson() {
    return {
      'count': count.toJson(),
      'treePollenLevels': treePollenLevels.map((e) => e.toJson()).toList(),
      'grassPollenLevels': grassPollenLevels.map((e) => e.toJson()).toList(),
      'weedPollenLevels': weedPollenLevels.map((e) => e.toJson()).toList(),
    };
  }

  factory PollenModel.fromJson(Map<String, dynamic> json) {
    return PollenModel(
      PollenCount.fromJson(json['count']),
      (json['treePollenLevels'] as List)
          .map((e) => PollenLevel.fromJson(e))
          .toList(),
      (json['grassPollenLevels'] as List)
          .map((e) => PollenLevel.fromJson(e))
          .toList(),
      (json['weedPollenLevels'] as List)
          .map((e) => PollenLevel.fromJson(e))
          .toList(),
    );
  }
}

class PollenCount {
  final int grassPollen;
  final int treePollen;
  final int weedPollen;

  PollenCount(this.grassPollen, this.treePollen, this.weedPollen);

  Map<String, dynamic> toJson() {
    return {
      'grassPollen': grassPollen,
      'treePollen': treePollen,
      'weedPollen': weedPollen,
    };
  }

  factory PollenCount.fromJson(Map<String, dynamic> json) {
    return PollenCount(
      json['grassPollen'],
      json['treePollen'],
      json['weedPollen'],
    );
  }
}

class PollenLevel {
  final Allergen allergen;
  final int level;

  PollenLevel(this.allergen, this.level);

  @override
  String toString() {
    return 'PollenLevel($runtimeType){name: $allergen, level: $level}';
  }

  Map<String, dynamic> toJson() {
    return {
      'allergen': allergen.toString(),
      'level': level,
    };
  }

  factory PollenLevel.fromJson(Map<String, dynamic> json) {
    return PollenLevel(
      Allergen.values.firstWhere((e) => e.toString() == json['allergen']),
      json['level'],
    );
  }
}
