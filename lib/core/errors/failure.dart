

abstract class Failure  implements Exception{
  final String message;
  Failure({
    required this.message,
  });
}

class ServerMessage extends Failure {
  ServerMessage({required super.message});
}

class ClientMessage extends Failure {
  ClientMessage({required super.message});
}

class SqliteMessage extends Failure {
  SqliteMessage({required super.message});
}


class UnknownMesssage extends Failure {
  UnknownMesssage({required super.message});
}

