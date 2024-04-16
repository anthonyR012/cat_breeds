import 'package:catbreeds/core/errors/failure.dart';

void throwIfError(bool condition, String message) {
  if (condition) {
    throw ClientMessage(message: message);
  }
}