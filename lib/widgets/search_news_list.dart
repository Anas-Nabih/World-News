import 'package:flutter/material.dart';
import 'package:world_news/generated/l10n.dart';
import 'package:world_news/models/articles_model.dart';
import 'package:world_news/ui/search/search_provider.dart';
import 'package:world_news/widgets/news_item.dart';
import 'package:world_news/widgets/search_place_holder.dart';
import 'package:world_news/widgets/total_result.dart';
import 'package:sizer/sizer.dart';

class SearchNewsList extends StatelessWidget {
  const SearchNewsList({Key? key, required this.searchProvider})
      : super(key: key);

  final SearchProvider<Articles> searchProvider;

  @override
  Widget build(BuildContext context) {
     return searchProvider.list[0].articles!.isNotEmpty
        ? Expanded(
         child: ListView.builder(
           shrinkWrap: true,
           itemCount: searchProvider.list[0].articles!.length,
           itemBuilder: (context, index) {
             return NewsItem(
                 article: searchProvider.list[0].articles![index]);
           },
         ),
            )
        : SearchPlaceHolder(
            text: S.of(context).noDataFoundAboutThisSearch,
          );
  }
}
