import 'package:book_doc/features/login/presentation/cubit/signup/sign_up_cubit.dart';
import 'package:book_doc/features/profile/domain/use_cases/profile_usecase.dart';
import 'package:book_doc/features/profile/presentation/cubit/complete_profile/complete_profile_cubit.dart';
import 'package:get_it/get_it.dart';

import '../../features/login/data/datasource/auth_firebase.dart';
import '../../features/login/data/repository/auth_repository_impl.dart';
import '../../features/login/domain/repository/auth_repository.dart';
import '../../features/login/domain/usecases/auth_usecase.dart';
import '../../features/login/presentation/cubit/login/login_cubit.dart';
import '../../features/profile/data/data_sources/profile_firebase.dart';
import '../../features/profile/data/repositories/profile_repository_impl.dart';
import '../../features/profile/domain/repositories/profile_repository.dart';

var sl = GetIt.instance;

void setUpServiceLocator() {
  //! Authentication
  sl.registerLazySingleton<AuthFirebase>(() => AuthFirebaseImpl());
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl());
  sl.registerFactory(() => AuthUseCase());
  sl.registerFactory(() => LoginCubit());
  sl.registerFactory(() => SignUpCubit());

  //! Profile
  sl.registerLazySingleton<ProfileFirebase>(() => ProfileFirebaseImpl());
  sl.registerLazySingleton<ProfileRepository>(() => ProfileRepositoryImpl());
  sl.registerFactory(() => ProfileUseCases());
  sl.registerFactory(() => CompleteProfileCubit());
}
