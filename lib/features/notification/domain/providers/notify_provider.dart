import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:versa_app_tutorial_cleanarch/features/notification/data/data_source/notify_datasource.dart';
import 'package:versa_app_tutorial_cleanarch/features/notification/data/data_source/notify_remote_datasource.dart';
import 'package:versa_app_tutorial_cleanarch/features/notification/data/repositories_impl/notify_repository.dart';
import 'package:versa_app_tutorial_cleanarch/features/notification/domain/repository/notify_repository.dart';
import 'package:versa_app_tutorial_cleanarch/shared/data/remote/remote.dart';
import 'package:versa_app_tutorial_cleanarch/shared/data/remote/socket_service.dart';
import 'package:versa_app_tutorial_cleanarch/shared/domain/providers/socket_io_service_provider.dart';

final notifyDatasourceProvider =
    Provider.family<NotifyDatasource, SocketService>((ref, socketService) {
  return NotifyRemoteDatasource( socketService);
});

final notifyRepositoryProvider = Provider<NotifyRepository>((ref){
  final socketService = ref.watch(socketServiceProvider);
  final datasource = ref.watch(notifyDatasourceProvider(socketService));
  return NotifyRepositoryImpl(datasource);
});
