
import 'package:dio/dio.dart';
import 'package:versa_app_tutorial_cleanarch/shared/data/local/storage_service.dart';

class AuthInterceptor  extends Interceptor{
   final StorageService storageService;
   AuthInterceptor({required this.storageService});

 @override

  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    try {
      final accessToken = await storageService.get('accessToken');
      
      if (accessToken != null) {
        // ignore: avoid_print
        print("---use Interceptor in Request -------");
        options.headers['Authorization'] = 'Bearer $accessToken';
      }
      super.onRequest(options, handler);
    } catch (e) {
      super.onRequest(options, handler);
    }
  }
}