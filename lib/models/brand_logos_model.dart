class BrandLogosModel {
  List images = [];
  BrandLogosModel.fromJson(Map<String, dynamic> json) {
    json["data"].forEach((element) {
      images.add(element["logo"]["jpg"]);
    });
  }
}
