void main(List<String> args) async {
  String value = await getStudents();
  print(value);
}

Future getStudents(){
  return Future.delayed(Duration(seconds: 5), () => 
  "Students"
  );
}