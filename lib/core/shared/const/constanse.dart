const loginEndPoint = 'login';
const registerEndPoint = 'register';
const homeEndPoint = 'home';
const categoriesEndPoint = 'categories';
const changeFavoritesEndPoint = 'favorites';
const favoritesEndPoint = 'favorites';
const profileEndPoint = 'profile';
const updateProfileEndPoint = 'update-profile';
String productDetailsEndPoint (int id)=> 'products/$id';
const searchEndPoint = 'products/search';

String? token = '';
late String language;

String? uId = '';