
import 'package:dio/dio.dart';
import 'package:my_cinema/core/data/error/exceptions.dart';
import 'package:my_cinema/core/data/network/api_constants.dart';
import 'package:my_cinema/core/data/network/error_message_model.dart';
import 'package:my_cinema/search/data/datasource/search_datasource.dart';

class SearchRemoteDataSourceImpl implements SearchDatasource{
  @override
  Future<List> search(String title) async{
      final response = await Dio().get(ApiConstants.getSearchPath(title));
      if(response.statusCode==200){
          return List<SearchResultItemModel>.from(
          (  response.data["results"] as List
          ).where((element) => element['media_type'] != 'person').map((e) => SearchItemModel.fromJson(e)));
      } else {
        throw ServerException(errorMessageModel: 
          ErrorMessageModel.fromJson(response.data)
        )
      }
    
  }
  
}
  
  