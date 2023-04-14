enum Allergens {
  //TODO: переделать
  hazel(enName: 'Hazel', ruName: 'Орех', type: AllergenType.tree),
  elm(enName: 'Elm', ruName: 'Вяз', type: AllergenType.tree),
  alder(enName: 'Alder', ruName: 'Ольха', type: AllergenType.tree),
  cottonWood(
      enName: 'Poplar / Cottonwood', ruName: 'Тополь', type: AllergenType.tree),
  oak(enName: 'Oak', ruName: 'Дуб', type: AllergenType.tree),
  plane(enName: 'Plane', ruName: 'Платан', type: AllergenType.tree),
  birch(enName: 'Birch', ruName: 'Береза', type: AllergenType.tree),
  cypress(enName: 'Cypress', ruName: 'Кипарис', type: AllergenType.tree),
  mulberry(enName: 'Mulberry', ruName: 'Шелковица', type: AllergenType.tree),
  ash(enName: 'Ash', ruName: 'Ясень', type: AllergenType.tree),
  maple(enName: 'Maple', ruName: 'Клен', type: AllergenType.tree),
  casuarina(enName: 'Casuarina', ruName: 'Касуарина', type: AllergenType.tree),
  acacia(enName: 'Acacia', ruName: 'Акация', type: AllergenType.tree),
  myrtaceae(enName: 'Myrtaceae', ruName: 'Миртовые', type: AllergenType.tree),
  willow(enName: 'Willow', ruName: 'Ива', type: AllergenType.tree),
  olive(enName: 'Olive', ruName: 'Оливка', type: AllergenType.tree),
  pine(enName: 'Pine', ruName: 'Сосна', type: AllergenType.tree),
  //weeds
  mugwort(enName: 'Mugwort', ruName: 'Полынь', type: AllergenType.weed),
  chenopod(enName: 'Chenopod', ruName: 'Маревые', type: AllergenType.weed),
  ragweed(enName: 'Ragweed', ruName: 'Амброзия', type: AllergenType.weed),
  nettle(enName: 'Nettle', ruName: 'Крапива', type: AllergenType.weed),
  sedges(enName: 'Sedges', ruName: 'Осока', type: AllergenType.weed),
  aster(enName: 'Aster', ruName: 'Астровые', type: AllergenType.weed),
  plantago(enName: 'Plantago', ruName: 'Подорожник', type: AllergenType.weed),
  rumex(enName: 'Rumex', ruName: 'Щавель', type: AllergenType.weed);

  final String enName, ruName;

  final AllergenType type;

  const Allergens({
    required this.enName,
    required this.ruName,
    required this.type,
  });
}

enum AllergenType {
  weed,
  tree,
}
