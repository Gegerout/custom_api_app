class EmployeeModel {
  final String name;
  final String salary;
  final String age;
  final String id;

  EmployeeModel(this.name, this.salary, this.age, this.id);

  factory EmployeeModel.fromJson(Map<String, dynamic> json) {
    return EmployeeModel(json["employee_name"].toString(), json["employee_salary"].toString(), json["employee_age"].toString(), json["id"].toString());
  }
}