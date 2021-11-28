void main(List<String> args) {
  StudentBO studentBusinessObject = StudentBO();

  //print all students
  for (var student in studentBusinessObject.getAllStudents()) {
    print("Student: [RollNo : ${student.rollNo}, Name : ${student.name}  ]");
  }

  //update student
  StudentVO student = studentBusinessObject.getAllStudents()[0];
  student.name = "Michael";
  studentBusinessObject.updateStudent(student);

  //get the student
  student = studentBusinessObject.getStudent(0);
  print("Student: [RollNo : ${student.rollNo}, Name : ${student.name}  ]");

// -------------- <Output>-----------
// Student: [RollNo : 0, Name : Robert ]
// Student: [RollNo : 1, Name : John ]
// Student: Roll No 0, updated in the database
// Student: [RollNo : 0, Name : Michael ]
}

class StudentVO {
  late String _name;
  late int _rollNo;
  StudentVO(this._name, this._rollNo);
  String get name => _name;

  set name(String name) {
    _name = name;
  }

  int get rollNo => _rollNo;

  set rollNo(int rollNo) {
    _rollNo = rollNo;
  }
}

class StudentBO {
  late List<StudentVO> students;
  StudentBO() {
    students = <StudentVO>[];
    StudentVO student1 = StudentVO("Robert", 0);
    StudentVO student2 = StudentVO("John", 1);
    students.add(student1);
    students.add(student2);
  }
  void deleteStudent(StudentVO student) {
    students.remove(student.rollNo);
    print("Student: Roll No ${student.rollNo} , deleted from database");
  }

  List<StudentVO> getAllStudents() {
    return students;
  }

  StudentVO getStudent(int rollNo) {
    return students[rollNo];
  }

  void updateStudent(StudentVO student) {
    students[student.rollNo].name = student.name;
    print("Student: Roll No ${student.rollNo}, updated in the database");
  }
}
