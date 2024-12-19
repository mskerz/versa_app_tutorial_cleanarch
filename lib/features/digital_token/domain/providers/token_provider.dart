import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:versa_app_tutorial_cleanarch/features/digital_token/data/data_source/token_data_source.dart';
import 'package:versa_app_tutorial_cleanarch/features/digital_token/data/data_source/token_local_data_source.dart';
import 'package:versa_app_tutorial_cleanarch/features/digital_token/data/data_source/token_remote_data_source.dart';
import 'package:versa_app_tutorial_cleanarch/features/digital_token/data/repositories_impl/token_repository.dart';
import 'package:versa_app_tutorial_cleanarch/features/digital_token/domain/repositories/token_repository.dart';
import 'package:versa_app_tutorial_cleanarch/shared/data/local/storage_service.dart';
import 'package:versa_app_tutorial_cleanarch/shared/data/remote/remote.dart';
import 'package:versa_app_tutorial_cleanarch/shared/domain/providers/dio_network_service_provider.dart';
import 'package:versa_app_tutorial_cleanarch/shared/domain/providers/shared_preferences_storage_service_provider.dart';

// final tokenDatasourceProvider =
//     Provider.family<TokenDataSource, StorageService>(
//         (_, storage) => TokenLocalDataSource(storage)
// );

final tokenDatasourceProvider =
    Provider.family<TokenDataSource, NetworkService>(
        (_, networkService) => TokenRemoteDataSource(networkService)
);

final tokenRepositoryProvider = Provider<TokenRepository>((ref) {
  final networkservice = ref.watch(networkServiceProvider);
  final datasource = ref.watch(tokenDatasourceProvider(networkservice));
  final repository = TokenRepositoryImpl(datasource);

  return repository;
});
