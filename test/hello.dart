import 'dart:io';

void main(List<String> args) {
  // script to get input from user and print it
  print("Enter your name: ");
  String name = stdin.readLineSync().toString();

  print("Hello $name");
  
}