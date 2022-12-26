import 'package:flutter_bloc/flutter_bloc.dart';

part 'qr_state.dart';

class QrCubit extends Cubit<QrState> {
  QrCubit() : super(QrInitial());

  void changeState(QrState newState) {
    emit(newState);
  }
}
