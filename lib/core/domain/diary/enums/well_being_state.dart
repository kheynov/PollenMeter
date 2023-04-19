enum WellBeingState {
  dead(emoji: '☠️'),
  bad(emoji: '😭'),
  sad(emoji: '🙁'),
  ok(emoji: '😐'),
  good(emoji: '🙂'),
  veryGood(emoji: '😀');

  final String emoji;

  const WellBeingState({required this.emoji});
}
