


import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:versa_app_tutorial_cleanarch/configs/app_configs.dart';
import 'package:versa_app_tutorial_cleanarch/shared/data/remote/socket_io_client_service.dart';
import 'package:socket_io_client/socket_io_client.dart'as IO;
import 'package:versa_app_tutorial_cleanarch/shared/data/remote/socket_service.dart';

final socketServiceProvider = Provider<SocketService>((ref) {
  final socket = IO.io(
    '${AppConfigs.SocketURL}',
    IO.OptionBuilder()
        .setTransports(['websocket'])
        .enableAutoConnect()
        .build(),
  );
  return NetworkSocketIOService(socket);
} );