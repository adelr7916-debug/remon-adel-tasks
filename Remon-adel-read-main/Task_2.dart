import 'dart:io';

void main() {
  List<String> studentNames = [];
  List<List<double>> studentGrades = [];

  print("Enter number of students:");
  int numberOfStudents = int.parse(stdin.readLineSync()!);

  for (int i = 0; i < numberOfStudents; i++) {
    print("Enter student name:");
    String name = stdin.readLineSync()!;
    studentNames.add(name);

    print("Enter number of subjects:");
    int numberOfSubjects = int.parse(stdin.readLineSync()!);

    List<double> grades = [];

    for (int j = 0; j < numberOfSubjects; j++) {
      print("Enter grade:");
      double grade = double.parse(stdin.readLineSync()!);
      grades.add(grade);
    }

    studentGrades.add(grades);
  }

  while (true) {
    print("\n1- Show Results");
    print("2- Search Student");
    print("3- Exit");

    print("Choose:");
    int choice = int.parse(stdin.readLineSync()!);

    if (choice == 1) {
      for (int i = 0; i < studentNames.length; i++) {
        double sum = 0;

        for (double grade in studentGrades[i]) {
          sum += grade;
        }

        double average = sum / studentGrades[i].length;

        String finalGrade;

        if (average >= 90) {
          finalGrade = "A";
        } else if (average >= 75) {
          finalGrade = "B";
        } else if (average >= 60) {
          finalGrade = "C";
        } else {
          finalGrade = "F";
        }

        print(
            "${studentNames[i]} - Average: ${average.toStringAsFixed(2)} - Grade: $finalGrade");
      }
    } else if (choice == 2) {
      print("Enter student name:");
      String searchName = stdin.readLineSync()!;

      int index = studentNames.indexOf(searchName);

      if (index == -1) {
        print("Student not found");
      } else {
        double sum = 0;

        for (double grade in studentGrades[index]) {
          sum += grade;
        }

        double average = sum / studentGrades[index].length;

        print(
            "${studentNames[index]} Average: ${average.toStringAsFixed(2)}");
      }
    } else if (choice == 3) {
      print("Program closed");
      break;
    } else {
      print("Invalid choice");
    }
  }
}
