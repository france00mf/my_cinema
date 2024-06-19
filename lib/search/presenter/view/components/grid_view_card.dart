import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_cinema/core/presentation/components/image_with_shimmer.dart';
import 'package:my_cinema/core/resources/app_routes.dart';
import 'package:my_cinema/core/resources/app_values.dart';
import 'package:my_cinema/search/domain/entities/search_result_item_entity.dart';

class GriViewCard extends StatelessWidget {
  const GriViewCard({super.key,required  this.item});
   final SearchResultItemEntity item;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return  Column(
      children: [
        GestureDetector(
          onTap: (){
                    item.isMovie
                ? context.pushNamed(AppRoutes.movieDetailsRoute,
                    params: {'movieId': item.tmdbID.toString()})
                : context.pushNamed(AppRoutes.tvShowDetailsRoute,
                    params: {'tvShowId': item.tmdbID.toString()});
          },
          child: AspectRatio(aspectRatio: 2 /3, 
          
          child: ClipRRect(
              borderRadius: BorderRadius.circular(AppSize.s8),
              
               child: ImageWithShimmer(
                imageUrl: item.posterUrl,
                width: double.infinity,
                height: AppSize.s150,
              ),
          ),),
        ),

               Expanded(
          child: Text(
            item.title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: textTheme.bodyMedium,
          ),
        ),
      ],
    );
  }
}