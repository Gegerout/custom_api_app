class EmployeeModel {
  final String name;
  final String salary;
  final String age;

  EmployeeModel(this.name, this.salary, this.age);

  factory EmployeeModel.fromJson(Map<String, dynamic> json) {
    return EmployeeModel(json["employee_name"].toString(), json["employee_salary"].toString(), json["employee_age"].toString());
  }
}