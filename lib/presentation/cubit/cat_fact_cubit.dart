// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:bloc_tut/dormain/repositories/cat_fact_repository_interface.dart';
import 'cat_fact_state.dart';

class CatFactCubit extends Cubit<CatFactState> {
  final CatFactRepositoryInterface _repository;

  CatFactCubit(this._repository) : super(CatFactInitial());

  Future<void> fetchCatFact() async {
    try {
      emit(CatFactLoading());
      final catFact = await _repository.getCatFact();
      emit(CatFactLoaded(catFact));
    } catch (e) {
      emit(CatFactError('Failed to fetch cat fact: ${e.toString()}'));
    }
  }
}