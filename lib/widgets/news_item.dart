import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:world_news/common_utils/image_loader.dart';
import 'package:world_news/common_utils/preferences/const.dart';
import 'package:world_news/common_utils/utils.dart';
import 'package:world_news/models/article_model.dart';
import 'package:world_news/res/colors.dart';
import 'package:world_news/res/theme/app_provider.dart';
import 'package:world_news/ui/news_details/news_details_screen.dart';

class NewsItem extends StatefulWidget {

  const NewsItem({
    required this.article,
     this.onBookMarkedTapped,
    Key? key,
  }) : super(key: key);

  final Article article;
  final void Function()? onBookMarkedTapped;

  @override
  State<NewsItem> createState() => _NewsItemState();
}

class _NewsItemState extends State<NewsItem> {
  CollectionReference bookMarks =
  FirebaseFirestore.instance.collection(Const.bookmarks);

  addToBookMarks({required Article article}) {
    bookMarks.add({
      "newsId":"",
      "title": article.title,
      "sourceUrl": article.sourceUrl,
      "imageUrl": article.sourceUrl,
      "author": article.author,
      "content": article.content,
      "description": article.description,
      "publishedAt": Utils.formatApiDate(article.publishedAt!),
      "source": article.source!.name});
  }

  @override
  Widget build(BuildContext context) {
    final appProvider = Provider.of<AppProvider>(context);
    return GestureDetector(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => NewsDetailsScreen(article: widget.article),
          )),
      child: Stack(
        children: [
          Container(
            height: 25.h,
            margin: EdgeInsets.only(bottom: 2.h, /*right: 2.w*/),
            decoration: BoxDecoration(
                color: appProvider.darkTheme
                    ? MColors.kDarkContainerBG
                    : Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  if (!appProvider.darkTheme)
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        offset: const Offset(3, 2),
                        spreadRadius: 1,
                        blurRadius: 2),
                ]),
            child: Row(
              children: [
                Container(
                  height: 25.h,
                  width: 35.w,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: ImageLoader.loadCachedNetworkImage(
                        widget.article!.imageUrl ?? ""),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 2.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 50.w,
                        child: Text(
                          widget.article.title!,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ),
                      SizedBox(height: 2.h),
                      SizedBox(
                        width: 50.w,
                        child: Text(
                          widget.article?.content ?? widget.article?.description ?? "",
                          overflow: TextOverflow.ellipsis,
                          maxLines: 4,
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                      ),
                      Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 18.w,
                            child: Text(
                              Utils.formatApiDate(widget.article.publishedAt!),
                              overflow: TextOverflow.ellipsis,
                              style:
                                  const TextStyle(color: MColors.kPrimaryColor),
                            ),
                          ),
                          SizedBox(width: 24.w),
                          SizedBox(
                            width: 10.w,
                            child: Text(
                              widget.article.source!.name!,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  color: MColors.kPrimaryColor,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Positioned(
            top: 0.h,
            right: 3.w,
            child: GestureDetector(
              onTap: ()=>addToBookMarks(article: widget.article),
              child: SvgPicture.asset("assets/svg/bookmark_filled.svg",
                  color: MColors.kPrimaryColor),
            ),
          )
        ],
      ),
    );
  }
}
