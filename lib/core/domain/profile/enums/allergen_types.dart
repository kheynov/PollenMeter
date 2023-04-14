class AllergenTypes {}

enum TreeAllergens implements AllergenTypes {
  hazel(enName: 'Hazel', ruName: 'Орех'),
  elm(enName: 'Elm', ruName: 'Вяз'),
  alder(enName: 'Alder', ruName: 'Ольха'),
  cottonWood(enName: 'Poplar / Cottonwood', ruName: 'Тополь'),
  oak(enName: 'Oak', ruName: 'Дуб'),
  plane(enName: 'Plane', ruName: 'Платан'),
  birch(enName: 'Birch', ruName: 'Береза'),
  cypress(enName: 'Cypress', ruName: 'Кипарис'),
  mulberry(enName: 'Mulberry', ruName: 'Шелковица'),
  ash(enName: 'Ash', ruName: 'Ясень'),
  maple(enName: 'Maple', ruName: 'Клен'),
  casuarina(enName: 'Casuarina', ruName: 'Касуарина'),
  acacia(enName: 'Acacia', ruName: 'Акация'),
  myrtaceae(enName: 'Myrtaceae', ruName: 'Миртовые'),
  willow(enName: 'Willow', ruName: 'Ива'),
  olive(enName: 'Olive', ruName: 'Оливка'),
  pine(enName: 'Pine', ruName: 'Сосна');

  final String enName, ruName;

  const TreeAllergens({
    required this.enName,
    required this.ruName,
  });
}

enum WeedAllergens {
  mugwort(enName: 'Mugwort', ruName: 'Полынь'),
  chenopod(enName: 'Chenopod', ruName: 'Маревые'),
  ragweed(enName: 'Ragweed', ruName: 'Амброзия'),
  nettle(enName: 'Nettle', ruName: 'Крапива'),
  sedges(enName: 'Sedges', ruName: 'Осока'),
  aster(enName: 'Aster', ruName: 'Астровые'),
  plantago(enName: 'Plantago', ruName: 'Подорожник'),
  rumex(enName: 'Rumex', ruName: 'Щавель');

  final String enName, ruName;

  const WeedAllergens({
    required this.enName,
    required this.ruName,
  });
}
