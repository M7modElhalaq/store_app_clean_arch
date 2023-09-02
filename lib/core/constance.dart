class Constance {
  static const String baseUrl = "https://rmd81.site";
  static const double appBarElevation = 0;
  static const int sessionFinishedDuration = 2;
  static const int splashTime = 3;
  static const int shimmerItemCounts = 4;
  static const int welcomeMessageTime = 3;
  static const int sendTimeOutDuration = 60;
  static const int receiveTimeOutDuration = 120;
  static const double deviceWidth = 375;
  static const double deviceHeight = 985;
  static const String CACHED_CUSTOMER = "CACHED_CUSTOMER";
  static const String CACHED_PRODUCT = "CACHED_PRODUCT";

  static const String offerProducts = "offer";
  static const String topSellingProducts = "most_selling";
  static const String newProducts = "new_product";
  static const String loginInitialCountry = 'PS';
  static const String customerData = 'customer';
  static const String bearer = 'Bearer';
  static const String prefKeyIsLoggedIn = 'is_logged_in_key';
  static const String prefKeyEmail = 'email_key';
  static const String message = 'message';
  static const String errors = 'errors';
  static const String error = 'error';
}

class KeyConstants {
  static const String outBoardingViewedKey = 'out_boarding_viewed';
  static const String localeKey = 'locale_key';
  static const String arabic = 'ar';
  static const String english = 'en';
  static const String arabicName = 'العربية';
  static const String englishName = 'English';
  static const String token = 'token';
  static const String phoneNumber = 'phoneNumber';
  static const String loggedIn = 'logged_in';
  static const String cart = 'cart';
  static const String user = 'user_';
  static const String userId = '${user}id';
  static const String userType = '${user}type';
  static const String userName = '${user}name';
  static const String userEmail = '${user}email';
  static const String userImage = '${user}image';
  static const String userPhoneNumber = '${user}phone_number';
  static const String userIdNumber = '${user}id_number';
  static const String userDateOfBirth = '${user}date_of_birth';
  static const String userGender = '${user}gender';
  static const String userAddress = '${user}address';
}

class ApiRequest {
  static const String api = '${Constance.baseUrl}/api';

  static const String apiAuth = '$api/customers';
  static const String apiAuthLogin = '$apiAuth/login';

  static const String apiAuthGetData = '$apiAuth/getData';

  static const String apiHome = '$api/home';
  static const String apiGetHome = '$apiHome/get_home';

  static const String apiProducts = '$api/products';
  static const String apiGetProducts = '$apiProducts/get_products/';

  static const String apiFavorite = '$api/favorites';
  static const String addOrDeleteFavorite = '$apiFavorite/addOrDeleteFavorite';
  static const String getFavorite = '$apiFavorite/';

  static const String apiCart = '$api/cart';
  static const String addOrDeleteCart = '$apiCart/addOrDeleteCart';
  static const String getCart = '$apiCart/';
}

class ApiConstants {
  static const String message = "message";
  static const String email = 'email';
  static const String password = 'password';
  static const String confirmPassword = 'password_confirmation';
  static const String authName = 'name';
  static const String phoneNumber = 'phone_number';
  static const String registerBy = 'register_by';
  static const String acceptLanguage = 'Accept-Language';
  static const String acceptHeader = 'Accept';
  static const String errorMessage = 'message';
  static const String token = 'token';
  static const String authorizationHeader = 'Authorization';
  static const String contentTypeHeader = 'Content-Type';
  static const String contentType = 'application/json';
  static const String accept = 'application/json';
}