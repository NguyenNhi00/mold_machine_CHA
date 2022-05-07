import 'package:injection_molding_machine_application/data/models/login_model.dart';

abstract class LoginRepoistory {
  Future<LoginModel> getToken(String username, String password);
}
