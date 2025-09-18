import 'package:quiz/model/questions.dart';

const data = [
  Questions('What is Dart?', [
    "Programming Language",
    "Symbol Language",
    "Hyper Texting Language",
    "Bangla Language",
  ]),
  Questions('What is Flutter?', [
    "A UI toolkit",
    "A Database",
    "An Operating System",
    "A Web Browser",
  ]),

  Questions('Which company developed Flutter?', [
    "Google",
    "Microsoft",
    "Apple",
    "Facebook",
  ]),

  Questions('Which keyword is used to create a constant variable in Dart?', [
    "const",
    "let",
    "static",
    "finalize",
  ]),

  Questions('Which function is the entry point of every Dart program?', [
    "main()",
    "start()",
    "init()",
    "run()",
  ]),

  Questions('Which widget is used for layouts in Flutter?', [
    "Column",
    "int",
    "while",
    "List",
  ]),

  Questions('Which widget is immutable in Flutter?', [
    "StatelessWidget",
    "StatefulWidget",
    "InheritedWidget",
    "Container with state",
  ]),

  Questions('Which command is used to create a new Flutter project?', [
    "flutter create project_name",
    "dart new project_name",
    "flutter run project_name",
    "flutter build project_name",
  ]),

  Questions('Which widget allows user interaction in Flutter?', [
    "ElevatedButton",
    "Text",
    "Padding",
    "Column",
  ]),

  Questions('Which file holds the app dependencies in Flutter?', [
    "pubspec.yaml",
    "main.dart",
    "config.json",
    "index.html",
  ]),

  Questions(
    'Which function is called when a StatefulWidget is first created?',
    ["initState()", "build()", "setState()", "dispose()"],
  ),
];
