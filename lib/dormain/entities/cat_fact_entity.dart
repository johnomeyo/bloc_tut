import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class CatFactEntity extends Equatable {
  final String fact;
  int length;

  CatFactEntity({required this.fact, required this.length});

  @override
  List<Object?> get props => [fact, length];
}
