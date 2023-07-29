class CustomException implements Exception {
  final String description;

  CustomException({required this.description});

  String getErrorMsg() {
    return description;
  }
}
