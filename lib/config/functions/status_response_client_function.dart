import 'package:catbreeds/config/constant/http_response_constant.dart';
import 'package:catbreeds/core/errors/failure.dart';
import 'package:catbreeds/core/errors/failure_messages.dart';

void readStatusResponseServer(int? statusCode, String? error) {
  int currentStatus = statusCode ?? HTTP_500_INTERNAL_SERVER_ERROR;
  String currentError = error ?? failureServerUndetected;
  switch (currentStatus) {
    case HTTP_100_CONTINUE:
      throw ServerMessage(message: currentError);
    case HTTP_101_SWITCHING_PROTOCOLS:
      throw ServerMessage(message: currentError);
    case HTTP_102_PROCESSING:
      throw ServerMessage(message: currentError);
    case HTTP_103_EARLY_HINTS:
      throw ServerMessage(message: currentError);
    case HTTP_203_NON_AUTHORITATIVE_INFORMATION:
      throw ServerMessage(message: currentError);
    case HTTP_204_NO_CONTENT:
      throw ServerMessage(message: currentError);
    case HTTP_205_RESET_CONTENT:
      throw ServerMessage(message: currentError);
    case HTTP_206_PARTIAL_CONTENT:
      throw ServerMessage(message: currentError);
    case HTTP_207_MULTI_STATUS:
      throw ServerMessage(message: currentError);
    case HTTP_208_ALREADY_REPORTED:
      throw ServerMessage(message: currentError);
    case HTTP_226_IM_USED:
      throw ServerMessage(message: currentError);
    case HTTP_300_MULTIPLE_CHOICES:
      throw ServerMessage(message: currentError);
    case HTTP_301_MOVED_PERMANENTLY:
      throw ServerMessage(message: currentError);
    case HTTP_302_FOUND:
      throw ServerMessage(message: currentError);
    case HTTP_303_SEE_OTHER:
      throw ServerMessage(message: currentError);
    case HTTP_304_NOT_MODIFIED:
      throw ServerMessage(message: currentError);
    case HTTP_305_USE_PROXY:
      throw ServerMessage(message: currentError);
    case HTTP_306_RESERVED:
      throw ServerMessage(message: currentError);
    case HTTP_307_TEMPORARY_REDIRECT:
      throw ServerMessage(message: currentError);
    case HTTP_308_PERMANENT_REDIRECT:
      throw ServerMessage(message: currentError);
    case HTTP_400_BAD_REQUEST:
      throw ServerMessage(message: currentError);
    case HTTP_401_UNAUTHORIZED:
      throw ServerMessage(message: currentError);
    case HTTP_402_PAYMENT_REQUIRED:
      throw ServerMessage(message: currentError);
    case HTTP_403_FORBIDDEN:
      throw ServerMessage(message: currentError);
    case HTTP_404_NOT_FOUND:
      throw ServerMessage(message: currentError);
    case HTTP_405_METHOD_NOT_ALLOWED:
      throw ServerMessage(message: currentError);
    case HTTP_406_NOT_ACCEPTABLE:
      throw ServerMessage(message: currentError);
    case HTTP_407_PROXY_AUTHENTICATION_REQUIRED:
      throw ServerMessage(message: currentError);
    case HTTP_408_REQUEST_TIMEOUT:
      throw ServerMessage(message: currentError);
    case HTTP_409_CONFLICT:
      throw ServerMessage(message: currentError);
    case HTTP_410_GONE:
      throw ServerMessage(message: currentError);
    case HTTP_411_LENGTH_REQUIRED:
      throw ServerMessage(message: currentError);
    case HTTP_412_PRECONDITION_FAILED:
      throw ServerMessage(message: currentError);
    case HTTP_413_REQUEST_ENTITY_TOO_LARGE:
      throw ServerMessage(message: currentError);
    case HTTP_414_REQUEST_URI_TOO_LONG:
      throw ServerMessage(message: currentError);
    case HTTP_415_UNSUPPORTED_MEDIA_TYPE:
      throw ServerMessage(message: currentError);
    case HTTP_416_REQUESTED_RANGE_NOT_SATISFIABLE:
      throw ServerMessage(message: currentError);
    case HTTP_417_EXPECTATION_FAILED:
      throw ServerMessage(message: currentError);
    case HTTP_418_IM_A_TEAPOT:
      throw ServerMessage(message: currentError);
    case HTTP_421_MISDIRECTED_REQUEST:
      throw ServerMessage(message: currentError);
    case HTTP_422_UNPROCESSABLE_ENTITY:
      throw ServerMessage(message: currentError);
    case HTTP_423_LOCKED:
      throw ServerMessage(message: currentError);
    case HTTP_424_FAILED_DEPENDENCY:
      throw ServerMessage(message: currentError);
    case HTTP_425_TOO_EARLY:
      throw ServerMessage(message: currentError);
    case HTTP_426_UPGRADE_REQUIRED:
      throw ServerMessage(message: currentError);
    case HTTP_428_PRECONDITION_REQUIRED:
      throw ServerMessage(message: currentError);
    case HTTP_429_TOO_MANY_REQUESTS:
      throw ServerMessage(message: currentError);
    case HTTP_431_REQUEST_HEADER_FIELDS_TOO_LARGE:
      throw ServerMessage(message: currentError);
    case HTTP_451_UNAVAILABLE_FOR_LEGAL_REASONS:
      throw ServerMessage(message: currentError);
    case HTTP_500_INTERNAL_SERVER_ERROR:
      throw ServerMessage(message: currentError);
    case HTTP_501_NOT_IMPLEMENTED:
      throw ServerMessage(message: currentError);
    case HTTP_502_BAD_GATEWAY:
      throw ServerMessage(message: currentError);
    case HTTP_503_SERVICE_UNAVAILABLE:
      throw ServerMessage(message: currentError);
    case HTTP_504_GATEWAY_TIMEOUT:
      throw ServerMessage(message: currentError);
    case HTTP_505_HTTP_VERSION_NOT_SUPPORTED:
      throw ServerMessage(message: currentError);
    case HTTP_506_VARIANT_ALSO_NEGOTIATES:
      throw ServerMessage(message: currentError);
    case HTTP_507_INSUFFICIENT_STORAGE:
      throw ServerMessage(message: currentError);
    case HTTP_508_LOOP_DETECTED:
      throw ServerMessage(message: currentError);
    case HTTP_509_BANDWIDTH_LIMIT_EXCEEDED:
      throw ServerMessage(message: currentError);
    case HTTP_510_NOT_EXTENDED:
      throw ServerMessage(message: currentError);
    case HTTP_511_NETWORK_AUTHENTICATION_REQUIRED:
      throw ServerMessage(message: currentError);
  }
}
