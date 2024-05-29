import 'package:flutter_bloc/flutter_bloc.dart';

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit() : super(NavigationState());

  void changeIndex(int index) => emit(state.copyWith(index: index));

  void changeExtended() => emit(state.copyWith(isExtended: !state.isExtended));
}

class NavigationState {
  final int index;
  final bool isExtended;

  const NavigationState({this.index = 0, this.isExtended = false});

  NavigationState copyWith({int? index, bool? isExtended}) {
    return NavigationState(index: index ?? this.index, isExtended: isExtended ?? this.isExtended);
  }
}
