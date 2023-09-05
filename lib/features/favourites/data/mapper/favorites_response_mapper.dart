import 'package:store_app/core/extensions/extensions.dart';
import 'package:store_app/features/favourites/data/mapper/favorites_data_response_mapper.dart';

import '../../domain/model/favorites_model.dart';
import '../response/favorites_response.dart';

extension FavoritesResponseMapper on FavoritesResponse {
  FavoritesModel toDomain() {
    return FavoritesModel(
      success: success.onNull(),
      message: message.onNull(),
      data: data!.map((e) => e.toDomain()).toList(),
    );
  }
}