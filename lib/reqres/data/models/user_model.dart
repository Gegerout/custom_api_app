class UserModel {
  final String email;
  final String firstName;
  final String lastName;
  final String avatar;

  UserModel(this.email, this.firstName, this.lastName, this.avatar);

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(json["email"], json["first_name"], json["last_name"], json["avatar"]);
  }
}