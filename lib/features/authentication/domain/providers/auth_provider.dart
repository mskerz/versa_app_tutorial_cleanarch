

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:versa_app_tutorial_cleanarch/features/authentication/data/data_source/auth_data_source.dart';
import 'package:versa_app_tutorial_cleanarch/features/authentication/data/data_source/auth_remote_data_source.dart';
import 'package:versa_app_tutorial_cleanarch/features/authentication/data/repositories_impl/auth_repository.dart';
import 'package:versa_app_tutorial_cleanarch/features/authentication/domain/repositories/auth_repository.dart';
import 'package:versa_app_tutorial_cleanarch/shared/data/remote/network_service.dart';
import 'package:versa_app_tutorial_cleanarch/shared/domain/providers/dio_network_service_provider.dart';
import 'package:versa_app_tutorial_cleanarch/shared/domain/providers/shared_preferences_storage_service_provider.dart';

final authDatasourceProvider = Provider.family<AuthRemoteDataSource,NetworkService>(
  (ref,networkService){ 
    final storage = ref.watch(storageServiceProvider);
    return AuthRemoteDataSource(networkService, storage);}
);



final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final NetworkService networkService =  ref.watch(networkServiceProvider);
  final AuthDataSource dataSource = ref.watch(authDatasourceProvider(networkService));
  return AuthRepositoryImpl(dataSource);
},);