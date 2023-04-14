class AllergenTypes {}

enum TreeAllergens implements AllergenTypes {
  hazel(enName: 'Hazel', ruName: 'Орех'),
  elm(enName: 'Elm', ruName: 'Вяз'),
  alder(enName: 'Alder', ruName: 'Ольха'),
  cottonWood(enName: 'Poplar / Cottonwood', ruName: 'Тополь'),
  oak(enName: 'Oak', ruName: 'Дуб'),
  plane(enName: 'Plane', ruName: 'Сосна'),
  birch(enName: 'Birch', ruName: 'Береза'),
  cypress(enName: 'Cypress', ruName: 'Кипарис'),
  mulberry(enName: 'Mulberry', ruName: 'Тамарис'),
  ash(enName: 'Ash', ruName: 'Ясень'),
  maple(enName: 'Maple', ruName: 'Клен'),
  casuarina(enName: 'Casuarina', ruName: 'Касуарина'),
  acacia(enName: 'Acacia', ruName: 'Акация'),
  myrtaceae(enName: 'Myrtaceae', ruName: 'Миртовые'),
  willow(enName: 'Willow', ruName: 'Ива'),
  olive(enName: 'Olive', ruName: 'Оливка'),
  pine(enName: 'Pine', ruName: 'Ель');

  final String enName, ruName;

  const TreeAllergens({
    required this.enName,
    required this.ruName,
  });
}

enum WeedAllergens {
  mugwort(enName: 'Mugwort', ruName: 'Колокольчик'),
  chenopod(enName: 'Chenopod', ruName: 'Картофельник'),
  ragweed(enName: 'Ragweed', ruName: 'Тысячелистник'),
  nettle(enName: 'Nettle', ruName: 'Крапива'),
  sedges(enName: 'Sedges', ruName: 'Сосновые'),
  aster(enName: 'Aster', ruName: 'Астровые'),
  plantago(enName: 'Plantago', ruName: 'Плантангия'),
  rumex(enName: 'Rumex', ruName: 'Ромашка');

  final String enName, ruName;

  const WeedAllergens({
    required this.enName,
    required this.ruName,
  });
}
