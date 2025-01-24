
import 'package:versa_app_tutorial_cleanarch/shared/domain/models/either.dart';
import 'package:versa_app_tutorial_cleanarch/shared/domain/models/notify/notify_response.dart';
import 'package:versa_app_tutorial_cleanarch/shared/exceptions/http_exception.dart';

abstract class NotifyRepository {

     //Plan :  Prepare for the socket service integration to app in tomorrow.
    Stream<Either<VersaException, NotifyResponse>> getNotify();

}