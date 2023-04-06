import 'package:equatable/equatable.dart';

abstract class MainBlocEvent extends Equatable {
  const MainBlocEvent();

  @override
  List<Object?> get props => [];
}

class PageLoadingEvent extends MainBlocEvent {
  const PageLoadingEvent();

  @override
  List<Object?> get props => [];
}
