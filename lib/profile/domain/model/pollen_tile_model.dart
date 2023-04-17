//TODO: Поправить под глобальную модельку профиля в будущем
class PollenTileModel {
  final String name;
  bool selected;
  final String? pathImage;

  PollenTileModel({
    required this.name,
    required this.selected,
    required this.pathImage,
  });

  @override
  String toString() {
    return 'PollenModel{name: $name, selected: $selected, iconData: $pathImage}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PollenTileModel &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          pathImage == other.pathImage;

  @override
  int get hashCode => name.hashCode ^ pathImage.hashCode;
}
