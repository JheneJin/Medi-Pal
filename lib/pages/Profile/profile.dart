// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:user_repository/user_repository.dart';

// import '../../blocs/profile_bloc/profile_bloc.dart';

// class Profile extends StatelessWidget {
//   const Profile({super.key});

//   static MaterialPageRoute<void> route(){
//     return MaterialPageRoute(builder: (_) => const Profile());
//   }
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (_) => ProfileBloc(
//         myUserRepository: context.read<UserRepository>(),
//       ),
//       child: const ProfileView(),
//     );
//   }
// }

// class ProfileView extends StatefulWidget {
//   const ProfileView({super.key});

//   @override
//   State<ProfileView> createState() => _ProfileViewState();
// }

// class _ProfileViewState extends State<ProfileView> {
//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(
//       body: Center(
//         child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[Text('Profile')]),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';

import '../HealthAssessment/inputScreen.dart';
import '../LogIn/login.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Profile'),
              TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => InputScreen(),
                      ));
                },
                child: Text(
                    "Health Assessment",
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: Theme.of(context).colorScheme.onPrimaryContainer,
                    )
                ),
              ),
            ])),
      );
  }
}