import 'package:injection_molding_machine_application/data/models/login_model.dart';
import 'package:injection_molding_machine_application/domain/repositories/login_repository.dart';

class LoginUseCase {
  final LoginRepoistory _loginRepoistory;
  LoginUseCase(this._loginRepoistory);
  Future<LoginModel> getToken(
      String username, String password) async {
    final machines = await _loginRepoistory.getToken(username, password);
    return machines;
  }
}
