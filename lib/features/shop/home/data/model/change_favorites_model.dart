class ChangeFavoritesModel {
  final bool status;
  final String message;
  final ChangeFavoritesDataModel? data;

  ChangeFavoritesModel({
    required this.status,
    required this.message,
    required this.data,
  });
  factory ChangeFavoritesModel.fromJson(Map<String,dynamic>json){
    return ChangeFavoritesModel(
      status: json['status'],
      message: json['message'],
      data: json['data'] != null ? ChangeFavoritesDataModel.fromJson(json['data']) : null,
    );
  }
}

class ChangeFavoritesDataModel {
  final int id;
  final ChangeFavoritesProductDataModel product;

  ChangeFavoritesDataModel({
    required this.id,
    required this.product,
  });
  factory ChangeFavoritesDataModel.fromJson(Map<String,dynamic>json){
    return ChangeFavoritesDataModel(
      id: json['id'],
      product: ChangeFavoritesProductDataModel.fromJson(json['product']),
    );
  }
}

class ChangeFavoritesProductDataModel {
  final int id;
  final dynamic price;
  final dynamic oldPrice;
  final dynamic discount;
  final String image;

  ChangeFavoritesProductDataModel({
    required this.id,
    required this.price,
    required this.oldPrice,
    required this.discount,
    required this.image,
  });

  factory ChangeFavoritesProductDataModel.fromJson(Map<String, dynamic> json) {
    return ChangeFavoritesProductDataModel(
      id: json['id'],
      price: json['price'],
      oldPrice: json['old_price'],
      discount: json['discount'],
      image: json['image'],
    );
  }
}
