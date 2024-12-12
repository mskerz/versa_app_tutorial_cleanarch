import 'package:dio/dio.dart';
import 'package:versa_app_tutorial_cleanarch/shared/data/remote/dio_network_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:versa_app_tutorial_cleanarch/shared/domain/providers/shared_preferences_storage_service_provider.dart';

final networkServiceProvider = Provider<DioNetworkService>(
  (ref) {
    final Dio dio = Dio();
    final storageService = ref.read(storageServiceProvider);

    return DioNetworkService(dio,storageService);
  },
);
