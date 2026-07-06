
import 'package:dio/dio.dart';




import '../utils/secure_storage_service.dart';

class DioService {
  final SecureStorageService secureStorageService;

  late final Dio dio;

  DioService({required this.secureStorageService}) {
    dio = Dio(
      BaseOptions(
        baseUrl: 'http://192.168.1.3:3000',
        headers: {
          'Content-Type': 'application/json',
        },
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
        sendTimeout: const Duration(seconds: 10),
      ),
    );

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final token = await secureStorageService.getToken();

          if (token != null) {
            options.headers['Authorization'] = 'Bearer $token';
          }

          handler.next(options);
        },
      ),
    );
  }
}