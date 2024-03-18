import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:medipal/main_bloc_observer.dart';
import 'package:user_repository/user_repository.dart';
import 'firebase_options.dart';
import 'app.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  //initialize Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  
  Bloc.observer = MainBlocObserver();
  // HydratedBloc.storage = await HydratedStorage.build(
  //   storageDirectory: kIsWeb
  //     ? HydratedStorage.webStorageDirectory 
  //     : await getTemporaryDirectory(),
  // );
  runApp(MyApp(FirebaseUserRepository(),));  
}