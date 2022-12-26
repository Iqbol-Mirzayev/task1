part of 'qr_cubit.dart';

abstract class QrState {}

class QrInitial extends QrState {
  QrInitial();
}

class QrError extends QrState {
  QrError();
}

class QrOpen extends QrState {}

class QrSuccess extends QrState {
}

class QrLoading extends QrState {
  QrLoading();
}
