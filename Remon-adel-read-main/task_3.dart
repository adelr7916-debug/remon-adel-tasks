void main() {
  Set<String> students = {};

  // Function to add student
  void addStudent(String name) {
    students.add(name);
  }

  // Recursive function to print students
  void printStudentsRecursive(List<String> list, [int index = 0]) {
    if (index >= list.length) return;

    print(list[index]);
    printStudentsRecursive(list, index + 1);
  }

  addStudent("Ali");
  addStudent("Sara");
  addStudent("Mona");

  print("Students using recursion:");
  printStudentsRecursive(students.toList());

  print("\nStudents using lambda:");
  students.forEach((student) => print(student));

  Set<String> newStudents = {"Omar", "Nada"};

  students = {...students, ...newStudents};

  print("\nAfter merging sets:");
  students.forEach((student) => print(student));

  Map<String, List<double>> studentGrades = {};

  void addCourse(String student, String course, [double grade = 0]) {
    studentGrades.putIfAbsent(student, () => []);
    studentGrades[student]!.add(grade);
  }

  // Function to calculate average grade
  double averageGrade(String student) {
    var grades = studentGrades[student];

    if (grades == null || grades.isEmpty) {
      return 0;
    }

    double sum = grades.reduce((a, b) => a + b);

    return sum / grades.length;
  }

  // Add courses
  addCourse("Ali", "Math", 90);
  addCourse("Ali", "Programming", 95);
  addCourse("Sara", "Math", 80);

  print("\nAverage grade of Ali:");
  print(averageGrade("Ali"));
}
