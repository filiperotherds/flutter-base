import 'package:dio/dio.dart';
import 'package:flutter_tcc/features/auth/data/models/login_request.dart';
import 'package:flutter_tcc/features/auth/data/models/signup_request.dart';
import 'package:flutter_tcc/features/auth/data/models/login_response.dart';
import 'package:flutter_tcc/core/network/dio_client.dart';

abstract class AuthRemoteDataSource {
  Future<LoginResponse> login(LoginRequest request);
  Future<LoginResponse> signup(SignupRequest request);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final DioClient dioClient;

  AuthRemoteDataSourceImpl({required this.dioClient});

  @override
  Future<LoginResponse> login(LoginRequest request) async {
    try {
      final response = await dioClient.dio.post(
        '/auth/signin',
        data: request.toJson(),
      );

      return LoginResponse.fromJson(response.data);
    } on DioException catch (e) {
      if (e.response != null && e.response?.data != null) {
        final message = e.response?.data['message'];
        if (message != null) {
          throw Exception(message);
        }
      }
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<LoginResponse> signup(SignupRequest request) async {
    try {
      final response = await dioClient.dio.post(
        '/auth/signup',
        data: request.toJson(),
      );

      return LoginResponse.fromJson(response.data);
    } on DioException catch (e) {
      if (e.response != null && e.response?.data != null) {
        final message = e.response?.data['message'];
        if (message != null) {
          throw Exception(message);
        }
      }
      rethrow;
    } catch (e) {
      rethrow;
    }
  }
}
