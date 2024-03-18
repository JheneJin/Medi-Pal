// import 'dart:html';

// import 'package:bloc/bloc.dart';
// import 'package:equatable/equatable.dart';
// import 'package:formz/formz.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:user_repository/user_repository.dart';


// part 'reg_auth_reg_event.dart';
// part 'reg_auth_reg_state.dart';

// class RegAuthRegBloc extends Bloc<RegAuthRegEvent, RegAuthRegState> {
//   final UserRepository userRepository;

//   RegAuthRegBloc({required this.userRepository})
//       : super(const RegAuthRegState()) {
//     on<NameChanged>(_onNameChanged);
//     on<EmailChanged>(_onEmailChanged);
//     on<PhoneNumberChanged>(_onPhoneNumberChanged);
//     on<FormSubmitted>(_onFormSubmitted);
//   }

//   void _onEmailChanged(
//     EmailChanged event,
//     Emitter<RegAuthRegState> emit,
//   ) {
//     final email = Email.dirty(event.email);
//     emit(state.copyWith(
//       email: email,
//       status: Formz.validate([email, state.name, state.password]),
//     ));
//   }

//   void _onNameChanged(
//     NameChanged event,
//     Emitter<RegAuthRegState> emit,
//   ) {
//     final name = Name.dirty(event.name);
//     emit(state.copyWith(
//       name: name,
//       status: Formz.validate([state.email, name, state.password]),
//     ));
//   }

//   void _onPhoneNumberChanged(
//     PhoneNumberChanged event,
//     Emitter<RegAuthRegState> emit,
//   ) {
//     final phoneNumber = Password.dirty(event.phoneNumber);
//     emit(state.copyWith(
//       password: password,
//       status: Formz.validate([state.email, state.name, password]),
//     ));
//   }

//   void _onFormSubmitted(
//     FormSubmitted event,
//     Emitter<RegAuthRegState> emit,
//   ) async {
//     if (state.status.isValidated) {
//       emit(state.copyWith(status: FormzStatus.submissionInProgress));
//       try {
//         await userRepository.updateRegAuthReg(
//           name: state.name.value,
//           email: state.email.value,
//           password: state.password.value,
//         );
//         emit(state.copyWith(status: FormzStatus.submissionSuccess));
//       } catch (_) {
//         emit(state.copyWith(status: FormzStatus.submissionFailure));
//       }
//     }
//   }
// }
