import 'package:store_app/features/home/data/mapper/home_data_response_mapper.dart';

import '../../domain/model/home_model.dart';
import '../response/home_response.dart';
import 'package:store_app/core/extensions/extensions.dart';

extension HomeResponseMapper on HomeResponse {
  HomeModel toDomain() {
    return HomeModel(
        status: status.onNull(),
        message: message.onNull(),
        data: data!.toDomain(),
    );
  }
}