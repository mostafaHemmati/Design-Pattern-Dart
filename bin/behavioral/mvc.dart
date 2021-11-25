void main(List<String> args) {
  Student model = retriveStudentFromDatabase();

  StudentView view = StudentView();

  StudentController controller = StudentController(model, view);

  controller.updateView();

  controller.name = "John";

  controller.updateView();

// -------------- <Output>-----------
// Student:
// Name: Robert
// Roll No: 10
// Student:
// Name: John
// Roll No: 10
}

Student retriveStudentFromDatabase() {
  Student student = Student();
  student._name = "Robert";
  student._rollNo = "10";
  return student;
}

class Student {
  late String _rollNo;
  late String _name;

  String get name => _name;

  set name(String name) {
    _name = name;
  }

  String get rollNo => _rollNo;

  set rollNo(String rollNo) {
    _rollNo = rollNo;
  }
}

class StudentView {
  void printStudentDetails(String studentName, String studentRollNo) {
    print("Student: ");
    print("Name: " + studentName);
    print("Roll No: " + studentRollNo);
  }
}

class StudentController {
  late final Student _model;
  late final StudentView _view;
  StudentController(this._model, this._view);

  set name(String name) {
    _model._name = name;
  }

  set rollNo(String rollNo) {
    _model._rollNo = rollNo;
  }

  String get name => _model._name;
  String get rollNo => _model._rollNo;
  void updateView() {
    _view.printStudentDetails(_model._name, _model._rollNo);
  }
}
