import 'package:injection_molding_machine_application/data/datasources/login_service.dart';
import 'package:injection_molding_machine_application/data/models/login_model.dart';
import 'package:injection_molding_machine_application/domain/repositories/login_repository.dart';

class LoginRepositoryImpl implements LoginRepoistory {
  final LoginService _loginService;
  LoginRepositoryImpl(this._loginService);
  @override
  Future<LoginModel> getToken(String username, String password) {
    // TODO: implement getToken
    throw UnimplementedError();
  }
}
