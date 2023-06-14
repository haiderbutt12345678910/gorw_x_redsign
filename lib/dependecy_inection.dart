import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_application_growx_new_design/Features/Data/DataSources/Externel/firebase_repo_impl.dart.dart';
import 'package:flutter_application_growx_new_design/Features/Domain/UseCases/AuthUseCases/emailverified_usecase.dart';
import 'package:flutter_application_growx_new_design/Features/Domain/UseCases/AuthUseCases/isloggedin_usecase.dart';
import 'package:flutter_application_growx_new_design/Features/Domain/UseCases/AuthUseCases/login_usecase.dart';
import 'package:flutter_application_growx_new_design/Features/Domain/UseCases/AuthUseCases/logout_usecase.dart';
import 'package:flutter_application_growx_new_design/Features/Domain/UseCases/AuthUseCases/resetpassword_usecase.dart';
import 'package:flutter_application_growx_new_design/Features/Domain/UseCases/AuthUseCases/signup_usecase.dart';
import 'package:flutter_application_growx_new_design/Features/Domain/UseCases/AuthUseCases/verifyemail_usecase.dart';
import 'package:flutter_application_growx_new_design/Features/Domain/UseCases/UserUseCases/DailyPlant/readweeklyplantdata_usecase.dart';
import 'package:flutter_application_growx_new_design/Features/Domain/UseCases/UserUseCases/DailyPlant/updatedailyplantdata_usecase.dart';
import 'package:flutter_application_growx_new_design/Features/Domain/UseCases/UserUseCases/readuser_usecase.dart';
import 'package:flutter_application_growx_new_design/Features/Domain/UseCases/UserUseCases/updateuser_usecase.dart';
import 'package:flutter_application_growx_new_design/Features/Domain/UseCases/email_usecase.dart';
import 'package:flutter_application_growx_new_design/Features/Presentation/StateMangement/AuthCubits/emailverified_cubit.dart';
import 'package:flutter_application_growx_new_design/Features/Presentation/StateMangement/AuthCubits/isloggedin_cubit.dart';
import 'package:flutter_application_growx_new_design/Features/Presentation/StateMangement/AuthCubits/login_cubit.dart';
import 'package:flutter_application_growx_new_design/Features/Presentation/StateMangement/AuthCubits/logout_cubit.dart';
import 'package:flutter_application_growx_new_design/Features/Presentation/StateMangement/AuthCubits/reserpassword_cubit.dart';
import 'package:flutter_application_growx_new_design/Features/Presentation/StateMangement/AuthCubits/signup_cubit.dart';
import 'package:flutter_application_growx_new_design/Features/Presentation/StateMangement/AuthCubits/verifyemail_cubit.dart';
import 'package:flutter_application_growx_new_design/Features/Presentation/StateMangement/UserCubits/DailyPlant/readweeklyplantdata_cubit.dart';
import 'package:flutter_application_growx_new_design/Features/Presentation/StateMangement/UserCubits/DailyPlant/updateweeklyplantdata_cubit.dart';
import 'package:flutter_application_growx_new_design/Features/Presentation/StateMangement/UserCubits/emails_cubit.dart';
import 'package:flutter_application_growx_new_design/Features/Presentation/StateMangement/UserCubits/readuser_cubit.dart';
import 'package:flutter_application_growx_new_design/Features/Presentation/StateMangement/UserCubits/updateuser_cubit.dart';
import 'package:get_it/get_it.dart';

import 'Features/Domain/Reppsitory/repository.dart';

GetIt sl = GetIt.instance;

Future<void> init() async {
//bloc
//AuthBlocs
  sl.registerFactory<LogOutCubit>(() => LogOutCubit(logOutUseCase: sl.call()));
  sl.registerFactory<LogInCubit>(() => LogInCubit(logInUseCase: sl.call()));
  sl.registerFactory<SignUpCubit>(() => SignUpCubit(signUpUseCase: sl.call()));
  sl.registerFactory<IsLoggedInCubit>(
      () => IsLoggedInCubit(isLoggedInUseCase: sl.call()));
  sl.registerFactory<EmailVerifiiedCubit>(
      () => EmailVerifiiedCubit(isEmailVerifiedUseCase: sl.call()));
  sl.registerFactory<ResetPasswordCubit>(
      () => ResetPasswordCubit(resetPasswordUseCase: sl.call()));

  sl.registerFactory<VerifyEmailCubit>(
      () => VerifyEmailCubit(emailVerifiedUseCaset: sl.call()));

  //UserDataBlocs
  sl.registerFactory<ReadUserCubit>(
      () => ReadUserCubit(readUserUseCase: sl.call()));
  sl.registerFactory<UpdateUserCubit>(
      () => UpdateUserCubit(updateUserUseCase: sl.call()));
  sl.registerFactory<UpdateDailyPlantDataCubit>(
      () => UpdateDailyPlantDataCubit(updateDailyPlantDataUseCase: sl.call()));

  sl.registerFactory<ReadWeeklyPlantDataCubit>(
      () => ReadWeeklyPlantDataCubit(readWeeklyPlantDataUseCase: sl.call()));

  sl.registerFactory<EmailsCubit>(() => EmailsCubit(emailUseCase: sl.call()));

//UseCases
//AuthUseCases

  sl.registerLazySingleton<ResetPasswordUseCase>(
      () => ResetPasswordUseCase(repository: sl.call()));
  sl.registerLazySingleton<IsEmailVerifiedUseCase>(
      () => IsEmailVerifiedUseCase(repository: sl.call()));

  sl.registerLazySingleton<EmailVerfiedUseCase>(
      () => EmailVerfiedUseCase(repository: sl.call()));

  sl.registerLazySingleton<LogOutUseCase>(
      () => LogOutUseCase(repository: sl.call()));

  sl.registerLazySingleton<LogInUseCase>(
      () => LogInUseCase(repository: sl.call()));
  sl.registerLazySingleton<SignUpUseCase>(
      () => SignUpUseCase(repository: sl.call()));
  sl.registerLazySingleton<IsLoggedInUseCase>(
      () => IsLoggedInUseCase(repository: sl.call()));

//UserUseCases

  sl.registerLazySingleton<EmailUseCase>(
      () => EmailUseCase(repository: sl.call()));

  sl.registerLazySingleton<ReadUserUseCase>(
      () => ReadUserUseCase(repository: sl.call()));

  sl.registerLazySingleton<UpdateUserUseCase>(
      () => UpdateUserUseCase(repository: sl.call()));
  sl.registerLazySingleton<UpdateDailyPlantDataUseCase>(
      () => UpdateDailyPlantDataUseCase(repository: sl.call()));

  sl.registerLazySingleton<ReadWeeklyPlantDataUseCase>(
      () => ReadWeeklyPlantDataUseCase(repository: sl.call()));

//Repo

  sl.registerLazySingleton<Repository>(() => FirbaseRepoImpl(
      firebaseAuth: sl.call(),
      firebaseFirestore: sl.call(),
      firebaseStorage: sl.call()));

//ExterelSources

  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  FirebaseStorage firebaseStorage = FirebaseStorage.instance;

  sl.registerLazySingleton(() => firebaseFirestore);
  sl.registerLazySingleton(() => firebaseAuth);
  sl.registerLazySingleton(() => firebaseStorage);
}
