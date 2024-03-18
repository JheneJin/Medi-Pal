
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:get_it/get_it.dart';
// import 'package:user_repository/src/firebase_user_repo.dart';

// import 'blocs/authentication_bloc/authentication_bloc.dart';
// import 'components/app_router.dart';

// final locator = GetIt.instance;

// Future<void> init() async {
//   //! Singletons
//   locator.registerLazySingleton(AppRouter.new);
//   locator.registerLazySingleton(() => FirebaseAuth.instance);
//   locator.registerLazySingleton(() => FirebaseFirestore.instance);

//   //! Blocs
//   locator.registerFactory(() => AuthenticationBloc(firebaseAuth: locator()));
//   locator.registerFactory(ScoreCubit.new);

//   //! Dependencies
//   locator.registerLazySingleton(Dio.new);
// }