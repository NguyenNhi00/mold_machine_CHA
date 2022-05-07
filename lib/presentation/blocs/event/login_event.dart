import 'package:equatable/equatable.dart';

class LoginEvent extends Equatable{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
class LoginEventChecking extends LoginEvent {
  String userName;
  String passWord;
  LoginEventChecking(this.userName, this.passWord);
  @override
  List<Object> get props => [userName, passWord];
}
class LoginToggleEvent extends LoginEvent{

}class LoginEventToggleShow extends LoginEvent { //IconButton hình con mắt
  bool isShow;
  LoginEventToggleShow(this.isShow);

  @override
  // TODO: implement props
  List<Object> get props => [isShow];
}

// ignore: must_be_immutable
class LoginEventLoginClicked extends LoginEvent {
  String username, password;
  DateTime timestamp;
  LoginEventLoginClicked(this.username, this.password, this.timestamp);

  @override
  // TODO: implement props
  List<Object> get props => [username, password, timestamp];
}

