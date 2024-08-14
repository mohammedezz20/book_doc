import 'package:book_doc/login/data/datasource/auth_firebase.dart';
import 'package:book_doc/login/domain/usecases/auth_usecase.dart';
import 'package:get_it/get_it.dart';

import '../../login/data/repository/auth_repository_impl.dart';
import '../../login/domain/repository/auth_repository.dart';
import '../../login/presentation/cubit/login_cubit.dart';

var sl = GetIt.instance;

void setUpServiceLocator() {
  //! Authentication
  sl.registerLazySingleton<AuthFirebase>(() => AuthFirebaseImpl());
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl());
  sl.registerFactory(() => AuthUseCase());
  sl.registerFactory(() => LoginCubit());
}
