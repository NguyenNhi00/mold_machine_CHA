import 'package:equatable/equatable.dart';

class Login extends Equatable {
  final String? token;
  Login({this.token});
  @override
  List<Object?> get props => [token];
}
