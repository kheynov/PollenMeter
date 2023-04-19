import 'dart:math';

String getRandomID() {
  return '5-7-${Random().nextInt(4294967296)}'; //2^32
}
