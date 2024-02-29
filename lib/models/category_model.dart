class CategoryModel {
  List categories = [];
  CategoryModel.fromJson(Map<String, dynamic> json) {
    json["items"].forEach((element) {
      categories.add(element["name"]);
    });
  }
}
