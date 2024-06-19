import 'package:flutter/material.dart';
import 'package:my_cinema/core/presentation/components/image_with_shimmer.dart';
import 'package:my_cinema/core/resources/app_values.dart';

class GriViewCard extends StatelessWidget {
  const GriViewCard({super.key, this.item});
   final SearchResultItem item;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return  Column(
      children: [
        GestureDetector(
          onTap: (){

          },
          child: AspectRatio(aspectRatio: 2 /3, 
          
          child: ClipRect(
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