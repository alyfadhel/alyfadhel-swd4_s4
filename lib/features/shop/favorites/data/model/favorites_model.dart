class FavoritesModel {
  final bool status;
  final FavoritesDataModel? data;

  FavoritesModel({
    required this.status,
    required this.data,
  });
  factory FavoritesModel.fromJson(Map<String,dynamic>json){
    return FavoritesModel(
      status: json['status'],
      data: json['data'] != null ? FavoritesDataModel.fromJson(json['data']) : null,
    );
  }
}

class FavoritesDataModel {
  final int currentPage;
  final List<FavoritesDataDetailsModel> data;

  FavoritesDataModel({
    required this.currentPage,
    required this.data,
  });
  factory FavoritesDataModel.fromJson(Map<String,dynamic>json){
    List<FavoritesDataDetailsModel> data = [];
    if(json['data'] != null){
      json['data'].forEach((element){
        data.add(FavoritesDataDetailsModel.fromJson(element));
      });
    }
    return FavoritesDataModel(
      currentPage: json['current_page'],
      data: data,
    );
  }
}

class FavoritesDataDetailsModel {
  final int id;
  final FavoritesProductModel product;

  FavoritesDataDetailsModel({
    required this.id,
    required this.product,
  });
  factory FavoritesDataDetailsModel.fromJson(Map<String,dynamic>json)
  {
    return FavoritesDataDetailsModel(
      id: json['id'],
      product: FavoritesProductModel.fromJson(json['product']),
    );
  }
}

class FavoritesProductModel {
  final int id;
  final dynamic price;
  final dynamic oldPrice;
  final dynamic discount;
  final String image;
  final String name;
  final String description;

  FavoritesProductModel({
    required this.id,
    required this.price,
    required this.oldPrice,
    required this.discount,
    required this.image,
    required this.name,
    required this.description,
  });

  factory FavoritesProductModel.fromJson(Map<String, dynamic> json) {
    return FavoritesProductModel(
      id: json['id'],
      price: json['price'],
      oldPrice: json['old_price'],
      discount: json['discount'],
      image: json['image'],
      name: json['name'],
      description: json['description'],
    );
  }
}
