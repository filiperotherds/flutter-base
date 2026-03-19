import 'package:flutter_tcc/features/auth/domain/repositories/auth_repository.dart';
import 'package:flutter_tcc/features/auth/data/models/login_response.dart';

class LoginUseCase {
  final AuthRepository repository;

  LoginUseCase({required this.repository});

  Future<LoginResponse> execute(String email, String password) async {
    return await repository.login(email, password);
  }
}
