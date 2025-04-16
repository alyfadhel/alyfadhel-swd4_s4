class CategoriesHomeModel
{
  final bool status;
  final CategoriesHomeDataModel data;

  CategoriesHomeModel({
    required this.status,
    required this.data,
  });
  factory CategoriesHomeModel.fromJson(Map<String,dynamic>json){
    return CategoriesHomeModel(
      status: json['status'],
      data: CategoriesHomeDataModel.fromJson(json['data']),
    );
  }
}

class CategoriesHomeDataModel
{
  final int currentPage;
  final List<CategoriesHomeDetailsDataModel>data;

  CategoriesHomeDataModel({
    required this.currentPage,
    required this.data,
  });
  factory CategoriesHomeDataModel.fromJson(Map<String,dynamic>json)
  {
    List<CategoriesHomeDetailsDataModel>data = [];
    if(json['data'] != null){
      json['data'].forEach((element){
        data.add(CategoriesHomeDetailsDataModel.fromJson(element));
      });
    }
    return CategoriesHomeDataModel(
      currentPage: json['current_page'],
      data: data,
    );
  }

}

class CategoriesHomeDetailsDataModel
{
  final int id;
  final String name;
  final String image;

  CategoriesHomeDetailsDataModel({
    required this.id,
    required this.name,
    required this.image,
  });
  factory CategoriesHomeDetailsDataModel.fromJson(Map<String,dynamic>json)
  {
    return CategoriesHomeDetailsDataModel(
      id: json['id'],
      name: json['name'],
      image: json['image'],
    );
  }

}