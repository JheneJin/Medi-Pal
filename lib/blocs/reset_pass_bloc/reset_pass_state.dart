part of 'reset_pass_bloc.dart';

sealed class ResetPassState extends Equatable {
  const ResetPassState();
  
  @override
  List<Object> get props => [];
}

final class ResetPassInitial extends ResetPassState {}
