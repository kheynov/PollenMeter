import 'package:flutter/material.dart';

Color getColorForLevel(double level) {
  if (level < 100) {
    //Тут на глазок - для маленьких кругляшков по видам, так как там не дается risk в явном виде
    return Colors.green;
  } else if (level < 200) {
    return Colors.yellow;
  } else if (level < 300) {
    return Colors.orange;
  } else if (level < 400) {
    return Colors.red;
  } else {
    return Colors.purple;
  }
}
