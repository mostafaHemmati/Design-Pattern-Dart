void main(List<String> args) {
  StudentDao studentDao = StudentDaoImpl();

  //print all students
  for (var student in studentDao.getAllStudent()!) {
    print("Student: [RollNo : ${student.rollNo}  Name : ${student.name} ]");
  }

  //update student
  Student student = studentDao.getAllStudent()![0];
  student.name = "Michael";
  studentDao.updateStudent(student);

  //get the student
  studentDao.getStudent(0);
  print("Student: [RollNo : ${student.rollNo}, Name : ${student.name} ]");

// -------------- <Output>-----------
// Student: [RollNo : 0  Name : Robert ]
// Student: [RollNo : 1  Name : John ]
// Student: Roll No 0 updated in the database
// Student: [RollNo : 0, Name : Michael ]
}

class Student {
  late String _name;
  late int _rollNo;
  Student(this._name, this._rollNo);

  String get name => _name;

  set name(String name) {
    _name = name;
  }

  int get rollNo => _rollNo;

  set rollNo(int rollNo) {
    _rollNo = rollNo;
  }
}

class StudentDao {
  List<Student>? getAllStudent() {}
  Student? getStudent(int rollNo) {}
  void updateStudent(Student student) {}
  void deleteStudent(Student student) {}
}

class StudentDaoImpl implements StudentDao {
  late List<Student> students;
  StudentDaoImpl() {
    students = <Student>[];
    Student student1 = Student("Robert", 0);
    Student student2 = Student("John", 1);
    students.add(student1);
    students.add(student2);
  }
  @override
  void deleteStudent(Student student) {
    students.remove(student);
    print("Student: Roll No  ${student.rollNo}  deleted from database");
  }

  @override
  List<Student> getAllStudent() {
    return students;
  }

  @override
  Student getStudent(int rollNo) {
    return students[rollNo];
  }

  @override
  void updateStudent(Student student) {
    students[student.rollNo].name = student.name;
    print("Student: Roll No ${student.rollNo} updated in the database");
  }
}
