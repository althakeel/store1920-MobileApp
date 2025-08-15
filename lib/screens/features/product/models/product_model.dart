class ProductModel {
  String? brand;
  String? title;
  double? originalPrice;
  double? currentPrice;
  double? rating;
  List<String>? images;
  List<String>? sizes;
  String? description;
  Specifications? specifications;
  List<Reviews>? reviews;

  ProductModel({
    this.brand,
    this.title,
    this.originalPrice,
    this.currentPrice,
    this.rating,
    this.images,
    this.sizes,
    this.description,
    this.specifications,
    this.reviews,
  });

  ProductModel.fromJson(Map<String, dynamic> json) {
    brand = json['brand'];
    title = json['title'];
    originalPrice = json['originalPrice'];
    currentPrice = json['currentPrice'];
    rating = json['rating'];
    images = json['images'].cast<String>();
    sizes = json['sizes'].cast<String>();
    description = json['description'];
    specifications = json['specifications'] != null
        ? Specifications.fromJson(json['specifications'])
        : null;
    if (json['reviews'] != null) {
      reviews = <Reviews>[];
      json['reviews'].forEach((v) {
        reviews!.add(Reviews.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['brand'] = brand;
    data['title'] = title;
    data['originalPrice'] = originalPrice;
    data['currentPrice'] = currentPrice;
    data['rating'] = rating;
    data['images'] = images;
    data['sizes'] = sizes;
    data['description'] = description;
    if (specifications != null) {
      data['specifications'] = specifications!.toJson();
    }
    if (reviews != null) {
      data['reviews'] = reviews!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Specifications {
  String? soleMaterial;
  String? outerMaterial;
  String? closureType;
  String? waterResistanceLevel;

  Specifications({
    this.soleMaterial,
    this.outerMaterial,
    this.closureType,
    this.waterResistanceLevel,
  });

  Specifications.fromJson(Map<String, dynamic> json) {
    soleMaterial = json['Sole material'];
    outerMaterial = json['Outer material'];
    closureType = json['Closure type'];
    waterResistanceLevel = json['Water resistance level'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Sole material'] = soleMaterial;
    data['Outer material'] = outerMaterial;
    data['Closure type'] = closureType;
    data['Water resistance level'] = waterResistanceLevel;
    return data;
  }
}

class Reviews {
  String? name;
  String? date;
  int? rating;
  String? purchase;
  String? text;
  int? helpful;

  Reviews({
    this.name,
    this.date,
    this.rating,
    this.purchase,
    this.text,
    this.helpful,
  });

  Reviews.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    date = json['date'];
    rating = json['rating'];
    purchase = json['purchase'];
    text = json['text'];
    helpful = json['helpful'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['date'] = date;
    data['rating'] = rating;
    data['purchase'] = purchase;
    data['text'] = text;
    data['helpful'] = helpful;
    return data;
  }
}
