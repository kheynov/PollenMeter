//TODO: Поправить под глобальную модельку профиля в будущем
import '../../../core/domain/profile/enums/allergen.dart';

class PollenTileModel {
  bool selected;
  final String? pathImage;
  final Allergen allergen;

  PollenTileModel({
    required this.selected,
    required this.pathImage,
    required this.allergen,
  });

  @override
  String toString() {
    return 'PollenModel{name: ${allergen.name}, selected: $selected, iconData: $pathImage}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PollenTileModel &&
          runtimeType == other.runtimeType &&
          allergen.name == other.allergen.name &&
          pathImage == other.pathImage;

  @override
  int get hashCode => allergen.name.hashCode ^ pathImage.hashCode;
}
