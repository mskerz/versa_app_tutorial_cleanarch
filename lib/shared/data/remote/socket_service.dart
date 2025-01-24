import 'package:versa_app_tutorial_cleanarch/shared/domain/models/either.dart';
import 'package:versa_app_tutorial_cleanarch/shared/exceptions/http_exception.dart';

abstract class SocketService {
 
  // connect method
  Future<Either<VersaException, void>> connect();

  // emit method
  // Future<Either<VersaException, Response>> emit(String event, dynamic data);

  // on method
  Stream<Either<VersaException, dynamic>> on(String event);

  // disconnect method
  Future<Either<VersaException, void>> disconnect();

  void dispose();

  void off(String notification_events);
 
}