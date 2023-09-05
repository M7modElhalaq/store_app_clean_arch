import '../../domain/model/sliders_model.dart';
import '../response/sliders_response.dart';
import 'package:store_app/core/extensions/extensions.dart';

extension SlidersResponseMapper on SlidersResponse {
  SlidersModel toDomain() {
    return SlidersModel(
      id: id.onNull(),
      titleAr: titleAr.onNull(),
      titleEn: titleEn.onNull(),
      textAr: textAr.onNull(),
      textEn: textEn.onNull(),
      image: image.onNull(),
      createdAt: createdAt.onNull(),
      updatedAt: updatedAt.onNull(),
      deletedAt: deletedAt.onNull(),
    );
  }
}