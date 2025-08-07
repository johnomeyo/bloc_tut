
import 'package:bloc_tut/dormain/entities/cat_fact_entity.dart';

abstract class CatFactRepositoryInterface {
  Future<CatFactEntity> getCatFact();
}