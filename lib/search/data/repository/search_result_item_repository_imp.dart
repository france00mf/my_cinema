import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:my_cinema/core/data/error/exceptions.dart';
import 'package:my_cinema/core/data/error/failure.dart';
import 'package:my_cinema/search/data/datasource/search_datasource.dart';

import 'package:my_cinema/search/data/model/search_result_item_model.dart';
import 'package:my_cinema/search/domain/repository/search_result_item_repository.dart';

class SearchResultItemRepositoryImp implements SearchResultItemRepository {
  final SearchDatasource _baseSearchDatasource;
  SearchResultItemRepositoryImp(this._baseSearchDatasource);

  @override
  Future<Either<Failure, List<SearchResultItemModel>>> search(String search) async {
    try {
      final result = await  _baseSearchDatasource.search(search);
      return Right(result);
    } on ServerException catch(failure){
        return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    } on DioError catch (e) {
        return Left(ServerFailure(e.message!));
    }
  }

}