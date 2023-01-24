part of 'cubit.dart';

@immutable
abstract class AppState {}

class AppInitial extends AppState {}

class OnTapLoad extends AppState {}

class OnTapSuccess extends AppState {}

class OnSearchLoad extends AppState {}

class OnSearchSuccess extends AppState {}

class ChangeGenderState extends AppState {}

class ChangeCheckboxState extends AppState {}