

import 'package:versa_app_tutorial_cleanarch/features/notification/data/data_source/notify_datasource.dart';
import 'package:versa_app_tutorial_cleanarch/features/notification/domain/repository/notify_repository.dart';
import 'package:versa_app_tutorial_cleanarch/shared/domain/models/either.dart';
import 'package:versa_app_tutorial_cleanarch/shared/domain/models/notify/notify_response.dart';
import 'package:versa_app_tutorial_cleanarch/shared/exceptions/http_exception.dart';

class NotifyRepositoryImpl implements NotifyRepository{
  final NotifyDatasource notifyDatasource;

  NotifyRepositoryImpl( this.notifyDatasource);
 

 //Plan :  Prepare for the socket service integration to app in tomorrow.

  @override
  Stream<Either<VersaException, NotifyResponse>> getNotify() {
    // TODO: implement getNotifys
    return notifyDatasource.getNotify();
  }

}