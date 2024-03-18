import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'reset_pass_event.dart';
part 'reset_pass_state.dart';

class ResetPassBloc extends Bloc<ResetPassEvent, ResetPassState> {
  ResetPassBloc() : super(ResetPassInitial()) {
    on<ResetPassEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
