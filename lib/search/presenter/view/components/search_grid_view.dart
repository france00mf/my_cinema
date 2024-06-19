
import 'package:flutter/widgets.dart';
import 'package:my_cinema/core/resources/app_values.dart';
import 'package:my_cinema/search/domain/entities/search_result_item_entity.dart';
import 'package:my_cinema/search/presenter/view/components/grid_view_card.dart';

class SearchGridView extends StatelessWidget{

  final List<SearchResultItemEntity> results;

  SearchGridView({super.key, required this.results});


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Expanded(child: GridView.builder(
      itemCount: results.length,
      itemBuilder: (context,index)=> GriViewCard(item: results[index]),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, crossAxisSpacing: 12, childAspectRatio: .55),
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(vertical: AppPadding.p12),
      
    )
    ,
    );
  }

}

