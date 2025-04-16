part of 'names_cubit.dart';

@immutable
sealed class NamesState {}

final class NamesInitial extends NamesState {}
final class Namesloading extends NamesState {}
final class Namesloaded extends NamesState {
  final Welcome data;
  Namesloaded({required this.data});
}
final class Nameserror extends NamesState {
  final String error;
  Nameserror({required this.error});
}
