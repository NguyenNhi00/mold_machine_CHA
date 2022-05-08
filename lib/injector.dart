import 'package:get_it/get_it.dart';
import 'package:injection_molding_machine_application/data/datasources/login_service.dart';
import 'package:injection_molding_machine_application/data/datasources/machine_service.dart';
import 'package:injection_molding_machine_application/data/datasources/modify_status_machine_service.dart';
import 'package:injection_molding_machine_application/domain/usecases/login_usecase.dart';
import 'package:injection_molding_machine_application/domain/usecases/machine_usecase.dart';
import 'package:injection_molding_machine_application/presentation/blocs/bloc/login_bloc.dart';
import 'package:injection_molding_machine_application/presentation/blocs/bloc/machine_details_bloc.dart';
import 'package:injection_molding_machine_application/presentation/blocs/bloc/machine_management_bloc.dart';
import 'package:injection_molding_machine_application/presentation/blocs/bloc/mold_parameter_bloc.dart';
import 'data/repositories/login_repository_impl.dart';
import 'data/repositories/machine_repository_impl.dart';
import 'data/repositories/modify_machine_status_repo_impl.dart';
import 'domain/repositories/login_repository.dart';
import 'domain/repositories/machine_repoisitory.dart';
import 'domain/repositories/modify_machine_status_repository.dart';

final injector = GetIt.instance;

//registerRepo
Future<void> initialDependencies() async {
  // regis hubconnection
  //register httpservice
  injector.registerSingleton<MachineService>(MachineService());
  injector.registerSingleton<LoginService>(LoginService());
  injector.registerSingleton<ModifyStatusMachineService>(ModifyStatusMachineService());
  //register repo
  injector.registerSingleton<LoginRepoistory>(LoginRepositoryImpl(injector()));
  injector
      .registerSingleton<MachineRepository>(MachineRepositoryImpl(injector()));
  injector.registerSingleton<ModifyStatusMachineRepository>(
      ModifyStatusMachineRepositoryImpl(injector()));

  //regis usecase
  injector.registerSingleton<LoginUseCase>(LoginUseCase(injector()));
  injector.registerSingleton<GetMachineUseCase>(
      GetMachineUseCase(injector(), injector()));

  //regis bloC
  injector.registerFactory<LoginBloc>(() => LoginBloc(injector()));
  injector.registerFactory<MachineDetailsBloc>(
      () => MachineDetailsBloc());
  injector
      .registerFactory<MoldParameterBloc>(() => MoldParameterBloc(injector()));
  injector.registerFactory<MachinesManagementBloc>(
      () => MachinesManagementBloc(injector()));
  
}
