import 'favorites_data_model.dart';

class FavoritesModel {
  bool success;
  String message;
  List<FavoritesDataModel> data;

  FavoritesModel({required this.success, required this.message, required this.data});
}