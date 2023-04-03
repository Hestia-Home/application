import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_smarthome/feature/main/presentation/bloc/main_bloc_events.dart';
import 'package:flutter_smarthome/feature/main/presentation/bloc/main_bloc_states.dart';

class MainPageBloc extends Bloc<MainBlocEvent, MainBlocState> {
  MainPageBloc() : super(InitState());
}
