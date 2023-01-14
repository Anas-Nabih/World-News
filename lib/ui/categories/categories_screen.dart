import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:world_news/common_utils/image_loader.dart';
import 'package:world_news/res/theme/app_provider.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appProvider = Provider.of<AppProvider>(context);
    return SafeArea(
      child: Scaffold(
        body: GridView.builder(
          padding: EdgeInsets.only(right: 3.w,left: 3.w,top: 2.h,bottom: 1.h),
            itemCount: appProvider.categoriesList(context: context).length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisExtent: 30.h,
              mainAxisSpacing: 2.h,
              crossAxisSpacing: 3.w
            ),
            itemBuilder:(context,index)=>Container(
               decoration: BoxDecoration(
                  color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                 boxShadow: [
                   BoxShadow(
                     color: Colors.grey.withOpacity(0.3),
                     spreadRadius:2,
                     blurRadius: 4,
                     offset: const Offset(2, 3), // changes position of shadow
                   ),
                 ]
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 25.h,
                    child: ClipRRect(
                      borderRadius:const BorderRadius.only(
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12),
                      ),
                      child: ImageLoader.loadCachedNetworkImage
                        ("https://firebasestorage.googleapis.com/v0/b/e-commerce-a7827.appspot.com/o/pc.jpg?alt=media&token=ae3199b4-4650-4e7c-9607-b9ac0f4cab94"),
                    ),
                  ),
                  Spacer(),
                  Center(child: Text(appProvider.categoriesList
                    (context: context)[index],
                  style: TextStyle(
                    fontSize: 12.sp
                  ),)),
                  Spacer(),

                ],
              ),
            )),
      ),
    );
  }
}
