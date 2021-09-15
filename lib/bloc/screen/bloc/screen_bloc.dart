import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloctest/widget/analysis_screen.dart';
import 'package:bloctest/widget/income_screen.dart';
import 'package:bloctest/widget/spend_screen.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'screen_event.dart';
part 'screen_state.dart';

class ScreenBloc extends Bloc<ScreenEvent, ScreenState> {
  ScreenBloc()
      : super(ScreenState(counter: 0, index: 0, screen: SpendScreen()));

  @override
  Stream<ScreenState> mapEventToState(
    ScreenEvent event,
  ) async* {
    if (event is ChangeScreenEvent) {
      switch (event.index) {
        case 0:
          yield ScreenState(
              counter: state.counter + 1,
              index: event.index,
              screen: SpendScreen());
          break;
        case 1:
          yield ScreenState(
              counter: state.counter + 1,
              index: event.index,
              screen: IncomeScreen());
          break;
        case 2:
          yield ScreenState(
              counter: state.counter + 1,
              index: event.index,
              screen: AnalysisScreen());
          break;
        default:
          break; // ignore
      }
    } else if (event is Empty) {}
  }
}
