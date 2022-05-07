import 'package:bloc/bloc.dart';
import 'package:injection_molding_machine_application/presentation/blocs/event/mold_parameter_event.dart';

class MoldParameterBloc extends Bloc<MoldParameterEvent, MoldParameterEvent> {
  MoldParameterBloc(MoldParameterEvent initialState) : super(initialState);
}
