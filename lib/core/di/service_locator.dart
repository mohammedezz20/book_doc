import 'package:get_it/get_it.dart';

import '../../features/login/data/datasource/auth_firebase.dart';
import '../../features/login/data/repository/auth_repository_impl.dart';
import '../../features/login/domain/repository/auth_repository.dart';
import '../../features/login/domain/usecases/auth_usecase.dart';
import '../../features/login/presentation/cubit/login/login_cubit.dart';

var sl = GetIt.instance;

void setUpServiceLocator() {
  //! Authentication
  sl.registerLazySingleton<AuthFirebase>(() => AuthFirebaseImpl());
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl());
  sl.registerFactory(() => AuthUseCase());
  sl.registerFactory(() => LoginCubit());
}
