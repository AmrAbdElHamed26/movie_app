import 'package:movie_app/shared/network/error_network_message_model.dart';

class ServerException implements Exception{

  // take error model and throw it
  final ErrorNetworkMessageError errorNetworkMessageError ;

  const ServerException({required this.errorNetworkMessageError});

}

class LocalDataBaseException implements Exception{
  final String message ;

  const LocalDataBaseException({required this.message});

}