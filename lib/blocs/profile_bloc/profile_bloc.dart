
// import 'dart:async';

// import 'package:bloc/bloc.dart';
// import 'package:meta/meta.dart';
// import 'package:equatable/equatable.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:user_repository/user_repository.dart';

// part 'profile_event.dart';
// part 'profile_state.dart';

// class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {

//   final UserRepository userRepository = UserRepository();
//   late final StreamSubscription<User?> _userSubscription;

//   ProfileBloc({
//     required UserRepository myUserRepository,
//     //notifications
//   }) : userRepository = myUserRepository, 
//       super(const ProfileState.initial()){

//     on<ProfileUpdated>(_onProfileUpdated);

//   //   _userSubscription = userRepository.user
//   //     .handleError(addError)
//   //     .listen((user) => add(ProfileUpdated(user)));
//     _userSubscription = userRepository.user.listen((profUser) {
// 			    add(ProfileUpdated(profUser));   //trigger new event every time user getter changes
// 		}); 
// }


//   void _onProfileUpdated(
//     ProfileUpdated event,
//     Emitter<ProfileState> emit,
//   ){
//     emit(
//       state.copyWith(
//         user: event.user,
//         status: ProfileStatus.profileUpdated,
//       ),
//     );
//   }
//   @override
//   Future<void> close() {
//     _userSubscription.cancel();
//     return super.close();
//   }

// }
