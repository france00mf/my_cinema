
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';


void main(List<String> args) {

  //Para implementar na ausencia de um pacote
  // final client = HttpClient();

  final url=Uri.parse("https://jsonplaceholder.typicode.com/posts/4");
  final request = MakeRequest();
  request.search(url);
  
}

class MakeRequest implements IMakeRequest{
  
  @override
  search(url) async{
    print("Loading...");
    var response = await http.get(url);    
    var data = requestBody(response);
    return data;
  }
  
  @override
  Map<String, dynamic> requestBody(Response response){
    
    Map<String, dynamic> data = json.decode( response.body); 
    print(response.statusCode.toString());
    switch(response.statusCode){
      case 201:
      case 200:
       return data;
      case 401:
      case 403:
       print("Você não tem permissão");
       break;
      case 404:
        print("Não encontrado");
        break;
      default:
       print("Unknow Error");
       break;
    }
   
  }
}

abstract class IMakeRequest{
  search(url);
  Map<String, dynamic> requestBody(Response response);
}
