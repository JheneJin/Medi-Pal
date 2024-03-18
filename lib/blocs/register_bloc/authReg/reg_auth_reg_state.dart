// part of 'reg_auth_reg_bloc.dart';

// class RegAuthRegState extends Equatable {
//   const RegAuthRegState({
//     this.name = const Name.pure(),
//     this.email = const Email.pure(),
//     this.password = const PasswordInputElement.pure(),
//     this.status = FormzStatus.pure,
//   });

//   final Name name;
//   final Email email;
//   final PasswordInputElement password;
//   final FormzStatus status;

//   RegAuthRegState copyWith({
//     Name? name,
//     Email? email,
//     PasswordInputElement? password,
//     FormzStatus? status,
//   }) {
//     return RegAuthRegState(
//       name: name ?? this.name,
//       email: email ?? this.email,
//       password: password?? this.password,
//       status: status ?? this.status,
//     );
//   }

//   @override
//   List<Object> get props => [email, name, password, status];
// }