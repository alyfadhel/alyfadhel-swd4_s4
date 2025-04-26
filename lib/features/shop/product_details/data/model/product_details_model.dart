class ProductDetailsModel {
  final bool status;
  final ProductDetailsDataModel? data;

  ProductDetailsModel({
    required this.status,
    required this.data,
  });
  factory ProductDetailsModel.fromJsom(Map<String,dynamic>json){
    return ProductDetailsModel(
        status: json['status'],
        data: json['data'] != null ? ProductDetailsDataModel.fromJson(json['data']) : null,
    );
  }
}

class ProductDetailsDataModel {
  final int id;
  final dynamic price;
  final dynamic oldPrice;
  final dynamic discount;
  final String image;
  final String name;
  final String description;
  final List<String> images;
  final bool inFavorites;
  final bool inCart;

  ProductDetailsDataModel({
    required this.id,
    required this.price,
    required this.oldPrice,
    required this.discount,
    required this.image,
    required this.name,
    required this.description,
    required this.images,
    required this.inFavorites,
    required this.inCart,
  });

  factory ProductDetailsDataModel.fromJson(Map<String, dynamic> json) {
    return ProductDetailsDataModel(
      id: json['id'],
      price: json['price'],
      oldPrice: json['old_price'],
      discount: json['discount'],
      image: json['image'],
      name: json['name'],
      description: json['description'],
      images: List<String>.from(json['images'].map((e)=>e)),
      inFavorites: json['in_favorites'],
      inCart: json['in_cart'],
    );
  }
}
