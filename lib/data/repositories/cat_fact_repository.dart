import 'package:bloc_tut/data/api/api_client.dart';
import 'package:bloc_tut/dormain/entities/cat_fact_entity.dart';
import 'package:bloc_tut/dormain/repositories/cat_fact_repository_interface.dart';

class CatFactRepository implements CatFactRepositoryInterface {
  final ApiClient _apiClient;

  CatFactRepository(this._apiClient);

  @override
  Future<CatFactEntity> getCatFact() async {
    final response = await _apiClient.get('/fact');
    final Map<String, dynamic> data = response.data;
    return CatFactEntity(
      fact: data['fact'],
      length: data['length'],
    );
  }
}
