import 'package:flutter_tcc/features/auth/data/models/login_response.dart';
import 'package:flutter_tcc/features/auth/domain/repositories/auth_repository.dart';

class SignupUseCase {
  final AuthRepository repository;

  SignupUseCase({required this.repository});

  Future<LoginResponse> execute(
    String? name,
    String email,
    String password,
  ) async {
    return await repository.signup(name, email, password);
  }
}
