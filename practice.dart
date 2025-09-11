import 'dart:io';

import 'mama.dart';

void main() {
  Arthi arthi = Arthi();
  String A = "matha vorti";
  print(A + " " + arthi.brain);
  String? N = stdin.readLineSync();
  if (N == "kar?") {
    print("arthir");
  }
}
