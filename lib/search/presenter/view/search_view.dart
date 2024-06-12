
import 'package:flutter/material.dart';
import 'package:my_cinema/core/resources/app_values.dart';
import 'package:my_cinema/search/data/datasource/search_datasource.dart';
import 'package:my_cinema/search/data/datasource/search_datasource_imp.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  SearchRemoteDataSourceImpl searchDataSource= SearchRemoteDataSourceImpl();
  
  @override
  void initState() {
    // TODO: implement initState
    var show=searchDataSource.search("One Piece");  
    print(show.toString());
    super.initState();  
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
             top: AppPadding.p12,
            left: AppPadding.p16,
            right: AppPadding.p16,
        ),
        child: Column(
          children: [
            Center(child: Text("data", style: TextStyle(color: Colors.white),),),
          ],
        ),
      ), 
    );
  }
}

