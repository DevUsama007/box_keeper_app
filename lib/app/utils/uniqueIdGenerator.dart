import 'dart:math';

String generateBoxId() {
  const chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
  final random = Random();

  final id = List.generate(
    12,
    (_) => chars[random.nextInt(chars.length)],
  ).join();

  return "BOX-$id";
}
