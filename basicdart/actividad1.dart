import 'dart:io';

void main(List<String> args) {
  int day = 1;
  int men = 0;
  int women = 0;
  int menSingle = 0;
  int womenSingle = 0;
  int single = 0;
  int married = 0;
  int widored = 0;

  List<int> ageAverage = [];

  while (day <= 7) {
    print("\n--- Día $day");
    print("- Ingrese número de entradas en el día $day:");
    String n = stdin.readLineSync().toString();

    while (int.parse(n) <= 0 || int.tryParse(n) == null) {
      print("(!) Ingrese un número:");
      n = stdin.readLineSync().toString();
    }

    print("\n");
    int i = 1;
    /* INGRESO DE DATOS */
    while (i <= int.parse(n)){
      Platform.isWindows ? print(Process.runSync("cls", [], runInShell: true).stdout) : print(Process.runSync("clear", [], runInShell: true).stdout);
      print("# Día $n");
      print("--- Entrada $i");
      // sexo
      print("-Ingrese el sexo (M,F):");
      String s = stdin.readLineSync().toString();

      while (s.toLowerCase() != "m" && s.toLowerCase() != "f") {
        print("(!) Ingrese un sexo válido (M,F):");
        s = stdin.readLineSync().toString();
      }
      s.toLowerCase() == "m" ? men += 1 : women += 1;

      // estado civil
      print("-Ingrese estado civil (S,C,V):");
      String e = stdin.readLineSync().toString();

      while (e.toLowerCase() != "s" && e.toLowerCase() != "c" && e.toLowerCase() != "v") {
        print("(!) Ingrese un estado civil válido (S,C,V):");
        e = stdin.readLineSync().toString();
      }
      e.toLowerCase() == "s" ? single += 1 : e.toLowerCase() == "c" ? married += 1 : widored += 1;

      // edad
      print("-Ingrese la edad:");
      String a = stdin.readLineSync().toString();

      while (a == 0 || int.tryParse(a) == null) {
        print("(!) Ingrese una edad válida:");
        a = stdin.readLineSync().toString();
      }
      
      // sumar hombres solteros
      s.toLowerCase() == "m" && e.toLowerCase() == "s" ? menSingle += 1 : null;
      // sumar hombres casados + edad
      s.toLowerCase() == "m" && e.toLowerCase() == "c" ? ageAverage.add(int.parse(a)) : null;
      // sumar mujeres solteras
      s.toLowerCase() == "f" && e.toLowerCase() == "s" ? womenSingle += 1 : null;

      i += 1;
    }
    day += 1;
    Platform.isWindows ? print(Process.runSync("cls", [], runInShell: true).stdout) : print(Process.runSync("clear", [], runInShell: true).stdout);
  }

  double percentMenSingle = (menSingle*100)/men;
  double ageAverageMenMarried = (ageAverage.reduce((a, b) => a + b) / ageAverage.length);
  double percentWomenSingle = (womenSingle*100)/single;

  print("Resultados:\n");
  print("% de hombres solteros entre hombres solteros= $percentMenSingle%");
  print("Promedio de edad de los hombres casados= $ageAverageMenMarried");
  print("% de mujeres solteras entre personas solteras= $percentWomenSingle%");
}