
class CacheData {
  static String email = "";
  static String username = "";
  static String phone = "";
  static int productId = 0;
  static int categoryId = 0;
  static int subCategoryId = 0;
  static bool isRegistered = false;
  static String verificationId = '';
  static int reservationId = -1;
  static int subscriptionId = -1;

  static bool hasPayments = false;

  void setIsRegistered() {
    isRegistered = true;
  }

  bool getIsRegistered() {
    return isRegistered;
  }

  void setReservationId(int id) {
    reservationId = id;
  }

  int getReservationId() {
    return reservationId;
  }

  void setSubscriptionId(int id) {
    subscriptionId = id;
  }

  int getSubscriptionId() {
    return subscriptionId;
  }

  void setEmail(String value) {
    CacheData.email = value;
  }

  String getEmail() {
    return email;
  }

  void setVerificationId(String value) {
    CacheData.verificationId = value;
  }

  String getVerificationId() {
    return verificationId;
  }

  void setUsername(String value) {
    CacheData.username = value;
  }

  String getUsername() {
    return username;
  }

  void setPhone(String value) {
    CacheData.phone = value;
  }

  String getPhone() {
    return phone;
  }

  void setProductId(int? id) {
    productId = id!;
  }

  int getProductId() {
    return productId;
  }

  void setCategoryId(int? id) {
    categoryId = id!;
  }

  int getCategoryId() {
    return categoryId;
  }

  void setSubCategoryId(int? id) {
    categoryId = id!;
  }

  int getSubCategoryId() {
    return categoryId;
  }

  void setHasPaymentMethods() {
    CacheData.hasPayments = true;
  }

  void disposeHasPaymentMethods() {
    CacheData.hasPayments = false;
  }

  bool getHasPaymentMethods() {
    return hasPayments;
  }
}
