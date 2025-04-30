class SearchModel {
  final bool status;
  final SearchDataModel? data;

  SearchModel({
    required this.status,
    required this.data,
  });
  factory SearchModel.fromJson(Map<String,dynamic>json){
    return SearchModel(
      status: json['status'],
      data: json['data'] != null ? SearchDataModel.fromJson(json['data']) : null,
    );
  }
}

class SearchDataModel {
  final int currentPage;
  final List<SearchDataDetailsModel> data;

  SearchDataModel({
    required this.currentPage,
    required this.data,
  });
  factory SearchDataModel.fromJson(Map<String,dynamic>json)
  {
    List<SearchDataDetailsModel> data = [];
    if(json['data'] != null){
      json['data'].forEach((element){
        data.add(SearchDataDetailsModel.fromJson(element));
      });
    }
    return SearchDataModel(
      currentPage: json['current_page'],
      data: data,
    );
  }
}

class SearchDataDetailsModel {
  final int id;
  final dynamic price;
  final String image;
  final String name;
  final String description;
  final List<String> images;
  final bool inFavorites;
  final bool inCart;

  SearchDataDetailsModel({
    required this.id,
    required this.price,
    required this.image,
    required this.name,
    required this.description,
    required this.images,
    required this.inFavorites,
    required this.inCart,
  });

  factory SearchDataDetailsModel.fromJson(Map<String, dynamic> json) {
    return SearchDataDetailsModel(
      id: json['id'],
      price: json['price'],
      image: json['image'],
      name: json['name'],
      description: json['description'],
      images: List<String>.from(json['images'].map((e)=>e)),
      inFavorites: json['in_favorites'],
      inCart: json['in_cart'],
    );
  }
}
