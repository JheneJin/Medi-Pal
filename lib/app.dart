import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medipal/pages/Home/home.dart';
import 'package:user_repository/user_repository.dart';
import 'blocs/authentication_bloc/authentication_bloc.dart';
import 'blocs/log_in_bloc/log_in_bloc.dart';
import 'blocs/my_user_bloc/bloc/my_user_bloc.dart';
import 'pages/Start/intro.dart';
import 'pages/Start/startApp.dart';

//root
class MyApp extends StatelessWidget{
  const MyApp(this.userRepository, {super.key});
  final UserRepository userRepository;
  
  @override
  Widget build(BuildContext context){
    return MultiRepositoryProvider(
      providers: [
				RepositoryProvider<AuthenticationBloc>(
					create: (_) => AuthenticationBloc(  //create provider 
						myUserRepository: userRepository
					)
				)
			], 
			child: const MyAppView()
    );
  }
}

class MyAppView extends StatelessWidget{
  const MyAppView({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: const Color(0x9EA0A1FA),
        brightness: Brightness.light,
      ),
      themeMode: ThemeMode.light,
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
				builder: (context, state) {  //returns a widget
					if(state.status == AuthenticationStatus.authenticated) {
						return MultiBlocProvider(
								providers: [
									BlocProvider(
										create: (context) => LogInBloc(
											userRepository: context.read<AuthenticationBloc>().userRepository
										),
									),
									// BlocProvider(
									// 	create: (context) => UpdateUserInfoBloc(
									// 		userRepository: context.read<AuthenticationBloc>().userRepository
									// 	),
									// ),
									BlocProvider(
										create: (context) => MyUserBloc(
											myUserRepository: context.read<AuthenticationBloc>().userRepository
										)..add(GetMyUser(
											myUserEmail: context.read<AuthenticationBloc>().state.user!.uid
										)),
									),
								],
							child: StartApp(),
						);
					} else {
						return const IntroScreen();
					}
				}
			),
    );
  }
}