import 'dart:async';

import 'package:versa_app_tutorial_cleanarch/shared/data/remote/socket_service.dart';
import 'package:versa_app_tutorial_cleanarch/shared/domain/models/either.dart';
import 'package:versa_app_tutorial_cleanarch/shared/exceptions/http_exception.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class NetworkSocketIOService extends SocketService {
  final IO.Socket socket;
  final StreamController<Either<VersaException, dynamic>> _controller =
      StreamController<Either<VersaException, dynamic>>.broadcast();

  // Constructor expects a pre-configured socket instance.
  NetworkSocketIOService(this.socket) {
    connect();
  }

  // เชื่อมต่อกับ server
  @override
  Future<Either<VersaException, void>> connect() async {
    try {
      socket.connect();
      socket.onConnect((_) {
        print('Connected to the server');
      });
      socket.onConnectError((error) {
        print("Connection error: $error");
      });
      socket.onDisconnect((_) {
        print('Disconnected from the server');
      });

      return Right(null);
    } catch (e) {
      return Left(VersaException(
        statusCode: 500,
        message: "Connect Error",
        identifier: 'Error ${e.toString()}',
      ));
    }
  }

  // Listen Event with Stream
  @override
  Stream<Either<VersaException, dynamic>> on(String event) async* {
    try {
      socket.on(event, (data) {
        _controller.add(Right(data));
      });

      // Return from stream
      yield* _controller.stream.map((data) {
        return data; // Either Response
      });
    } catch (e) {
      _controller.addError(Left(VersaException(
        statusCode: 400,
        message: "Error get data from event ",
        identifier: 'error: ${e.toString()}',
      )));
    }
  }

  @override
  Future<Either<VersaException, void>> disconnect() async {
    try {
      socket.disconnect();
      return Right(null);
    } catch (e) {
      return Left(VersaException(
        statusCode: 500,
        message: "Disconnect Error",
        identifier: 'Error ${e.toString()}',
      ));
    }
  }

  @override
  void dispose() {
    socket.dispose();
    _controller.close(); // ปิด stream เมื่อไม่ใช้งาน
  }

  @override
  void off(String event) {
    socket.off(event);
  }
}
