import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'reg_med_reg_event.dart';
part 'reg_med_reg_state.dart';

class RegMedRegBloc extends Bloc<RegMedRegEvent, RegMedRegState> {
  RegMedRegBloc() : super(RegMedRegInitial()) {
    on<RegMedRegEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
