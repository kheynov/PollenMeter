//TODO: Поправить под глобальную модельку профиля в будущем
class PollenModel {
  final String name;
  bool selected;
  final String? pathImage;

  PollenModel({
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
      other is PollenModel &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          pathImage == other.pathImage;

  @override
  int get hashCode => name.hashCode ^ pathImage.hashCode;
}
