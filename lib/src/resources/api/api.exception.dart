class ApiException implements Exception {
  final statusCode;

  ApiException([this.statusCode]);

  String toString() {
    return '$statusCode';
  }
}

class FetchDataException extends ApiException {
  FetchDataException([String message]) : super(message);
}

class BadRequestException extends ApiException {
  BadRequestException([message]) : super(400);
}

class UnauthorizedExceptionknown extends ApiException {
  UnauthorizedExceptionknown([message]) : super(403);
}

class UnauthorizedException extends ApiException {
  UnauthorizedException([message]) : super(401);
}

class InternalServerError extends ApiException {
  InternalServerError([message]) : super(500);
}

class InvalidInputException extends ApiException {
  InvalidInputException([String message]) : super(403);
}
