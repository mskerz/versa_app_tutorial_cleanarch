import 'package:versa_app_tutorial_cleanarch/features/notification/data/data_source/notify_datasource.dart';
import 'package:versa_app_tutorial_cleanarch/shared/data/remote/socket_service.dart';
import 'package:versa_app_tutorial_cleanarch/shared/domain/models/either.dart';
import 'package:versa_app_tutorial_cleanarch/shared/domain/models/notify/notify_model.dart';
import 'package:versa_app_tutorial_cleanarch/shared/domain/models/notify/notify_response.dart';
import 'package:versa_app_tutorial_cleanarch/shared/exceptions/http_exception.dart';

class NotifyRemoteDatasource extends NotifyDatasource {
  final SocketService socketService;
  // Constructor with NetworkService injected

  NotifyRemoteDatasource(this.socketService);

  @override
  Future<Either<VersaException, void>> markAsRead() {
    // TODO: implement markAsRead
    throw UnimplementedError();
  }

  //Plan :  Prepare for the socket service integration to app in tomorrow.

  @override
  Stream<Either<VersaException, NotifyResponse>> getNotify() async* {
    await for (var result in socketService.on("notifications")) {
      yield* result.fold((error) async* {
        // กรณีที่เป็น Left (ข้อผิดพลาด)
        print(error.message);
        yield Left(VersaException(
          statusCode: 400,
          message: "Socket error: ${error.toString()}",
          identifier: 'socket_error',
        ));
      }, (data) async* {
        try {
          // ตรวจสอบว่า data เป็น Map<String, dynamic> หรือไม่
          if (data is Map<String, dynamic>) {
            // แปลงข้อมูลจาก JSON
            final notify = Notify.fromJson(data);

            // สร้าง response object
            final notifyResponse = NotifyResponse();
            notifyResponse.addNotification(notify);

            // ส่งข้อมูลผ่าน stream
            yield Right(notifyResponse);
          } else {
            // ถ้าไม่ใช่ Map<String, dynamic>
            yield Left(VersaException(
              statusCode: 400,
              message: "Invalid data format: expected Map<String, dynamic>",
              identifier: 'invalid_data_format',
            ));
          }
        } catch (e) {
          // หากแปลงข้อมูลผิดพลาด
          yield Left(VersaException(
            statusCode: 400,
            message: "Error parsing notifications data: ${e.toString()}",
            identifier: 'parsing_error',
          ));
        }
      });
    }
  }
}
