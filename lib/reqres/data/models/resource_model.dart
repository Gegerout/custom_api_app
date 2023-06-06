class ResourceModel {
  final String name;
  final String year;
  final String color;
  final String pantoneValue;

  ResourceModel(this.name, this.year, this.color, this.pantoneValue);
  
  factory ResourceModel.fromJson(Map<String, dynamic> json) {
    return ResourceModel(json["name"], json["year"].toString(), json["color"], json["pantone_value"]);
  }
}