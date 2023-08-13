extension IntNotNull on int {
  int onNull() {
    return this ?? 0;
  }
}

extension StringNotNull on String {
  String onNull() {
    return this ?? '';
  }
}