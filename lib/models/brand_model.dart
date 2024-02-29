class BrandModel {
  List brands = [];
  BrandModel.fromJson(Map<String, dynamic> json) {
    json["items"].forEach((element) {
      brands.add(element["brand"]);
    });
  }
}
