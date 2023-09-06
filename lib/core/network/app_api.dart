import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:store_app/features/favourites/data/response/favorites_response.dart';
import 'package:store_app/features/home/data/response/home_response.dart';
import 'package:store_app/core/constance.dart';
import 'package:store_app/features/shopping_bag/data/response/shopping_bag_response.dart';
import 'package:store_app/features/sub_category_products/data/response/sub_category_products_response.dart';

import '../../features/auth/data/response/login_response.dart';
import '../../features/cart/data/response/cart_response.dart';
import '../../features/product_details/data/response/product_details_response.dart';

part 'app_api.g.dart';

@RestApi(baseUrl: Constance.baseUrl)
abstract class AppService {
  factory AppService(Dio dio, {String baseUrl}) = _AppService;

  @POST(ApiRequest.apiAuthLogin)
  Future<LoginResponse> login(@Field(ApiConstants.phoneNumber) String phoneNumber);

  @GET(ApiRequest.apiGetHome)
  Future<HomeResponse> homeData();

  @GET(ApiRequest.apiProductsDetails)
  Future<ProductDetailsResponse> productDetails(@Path("id") int id);

  @GET(ApiRequest.apiSubCategoryProducts)
  Future<SubCategoryResponse> getSubCategoryProducts(@Path("id") int id);

  @GET(ApiRequest.apiFavorite)
  Future<FavoritesResponse> getFavoritesData();

  @GET(ApiRequest.apiCart)
  Future<CartResponse> getCartData();

  @GET(ApiRequest.getShoppingBagData)
  Future<ShoppingBagResponse> getShoppingBagData();
}
