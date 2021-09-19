import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'bottom_navigation_event.dart';
part 'bottom_navigation_state.dart';

class BottomNavigationBloc
    extends Bloc<BottomNavigationEvent, BottomNavigationState> {
  BottomNavigationBloc() : super(BottomNavigationInitial());

  int currentIndex = 0;
  @override
  Stream<BottomNavigationState> mapEventToState(
    BottomNavigationEvent event,
  ) async* {
    if (event is AppStarted) {
      this.add(PageTapped(index: this.currentIndex));
    }
    if (event is PageTapped) {
      this.currentIndex = event.index;
      yield CurrentIndexChanged(currentIndex: this.currentIndex);
      yield PageLoading();
      if (this.currentIndex == 0) {
        // ! We can add there local data fetch or something
        // ! String data = await _getFirstPageData(); like that
        // ! and add a fetch functin to bottom of this class.
        yield SpendPageLoaded(text: "SpendPage");
      } else if (this.currentIndex == 1) {
        yield AnalysisPageLoaded(text: 'AnalysisPage');
      }
    }
  }
}
