part of 'bottom_navigation_bloc.dart';

abstract class BottomNavigationState extends Equatable {
  const BottomNavigationState();

  @override
  List<Object> get props => [];
}

class BottomNavigationInitial extends BottomNavigationState {}

class CurrentIndexChanged extends BottomNavigationState {
  CurrentIndexChanged({required this.currentIndex});

  final int currentIndex;

  @override
  String toString() => 'CurrentIndexChanged to $currentIndex';
}

class PageLoading extends BottomNavigationState {
  @override
  String toString() => 'PageLoading';
}

class SpendPageLoaded extends BottomNavigationState {
  SpendPageLoaded({required this.text});

  final String text;

  @override
  String toString() => 'SpendingPageLoaded with text: $text';
}

class IncomePageLoaded extends BottomNavigationState {
  IncomePageLoaded({required this.text});

  final String text;

  @override
  String toString() => 'IncomePageLoaded with text: $text';
}

class AnalysisPageLoaded extends BottomNavigationState {
  AnalysisPageLoaded({required this.text});

  final String text;

  @override
  String toString() => 'AnalyticsPageLoaded with text: $text';
}
