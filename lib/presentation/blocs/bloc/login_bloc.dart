import 'package:bloc/bloc.dart';
import 'package:injection_molding_machine_application/domain/usecases/login_usecase.dart';
import 'package:injection_molding_machine_application/presentation/blocs/event/login_event.dart';
import 'package:injection_molding_machine_application/presentation/blocs/state/login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUseCase _loginUseCase;
  LoginBloc(this._loginUseCase) : super(LoginInitState(false, false, false));
}
