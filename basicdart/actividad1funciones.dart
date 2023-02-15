import 'dart:io';

void main(List<String> args) {
  int men = 0;
  int women = 0;
  int menSingle = 0;
  int womenSingle = 0;
  int single = 0;
  int married = 0;
  int widored = 0;
  List<int> ageAverage = [];
  int dayPatiens = 0;
  
  int i = 1;
  while (i <= 7) {
    int j = 1;
    String sex, marital, age;
    print("Dia $i");

    dayPatiens = getPatience();
    while (j <= dayPatiens) {
      print("Paciente $j:");
      sex = getSex();
      marital = getMaritalStatus();
      age = getAge();
      sex == "m" ? men += 1 : women += 1;
      marital == "s" ? single += 1 : marital == "c" ? married += 1 : widored += 1;
      sex == "m" && marital == "s" ? menSingle += 1 : null;
      sex == "m" && marital == "c" ? ageAverage.add(int.parse(age)) : null;
      sex == "f" && marital == "s" ? womenSingle += 1 : null;
      j++;
      print("---------- \n");
    }
    clearConsole();
    i++;
  }

  double percentMenSingle = (menSingle*100)/men;
  double ageAverageMenMarried = (ageAverage.reduce((a, b) => a + b) / ageAverage.length);
  double percentWomenSingle = (womenSingle*100)/single;
  print("Resultados:\n");
  print("% de hombres solteros entre hombres solteros= $percentMenSingle%");
  print("Promedio de edad de los hombres casados= $ageAverageMenMarried");
  print("% de mujeres solteras entre personas solteras= $percentWomenSingle%");
}

// Obtener el número de pacientes a registrar
int getPatience() {
  print("Ingrese el número de pacientes:");
  String n = stdin.readLineSync().toString();

  while (int.parse(n) <= 0 || int.tryParse(n) == null) {
    print("(!) Ingrese un número:");
    n = stdin.readLineSync().toString();
  }
  return int.parse(n);
}

// Obtener el sexo del paciente
String getSex() {
  print("-Ingrese el sexo (M,F):");
  String s = stdin.readLineSync().toString();

  while (s.toLowerCase() != "m" && s.toLowerCase() != "f") {
    print("(!) Ingrese un sexo válido (M,F):");
    s = stdin.readLineSync().toString();
  }
  return s.toLowerCase();
}

// Obtener el estado civil del paciente
String getMaritalStatus() {
  print("-Ingrese estado civil (S,C,V):");
  String e = stdin.readLineSync().toString();

  while (e.toLowerCase() != "s" &&
      e.toLowerCase() != "c" &&
      e.toLowerCase() != "v") {
    print("(!) Ingrese un estado civil válido (S,C,V):");
    e = stdin.readLineSync().toString();
  }
  return e.toLowerCase();
}

// Obtener la edad
String getAge() {
  print("-Ingrese la edad:");
  String a = stdin.readLineSync().toString();

  while (a == 0 || int.tryParse(a) == null) {
    print("(!) Ingrese una edad válida:");
    a = stdin.readLineSync().toString();
  }
  return a;
}

// Limpia toda la consola
clearConsole() {
  return Platform.isWindows ? print(Process.runSync("cls", [], runInShell: true).stdout) : print(Process.runSync("clear", [], runInShell: true).stdout);
}