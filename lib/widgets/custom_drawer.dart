import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:world_news/res/theme/app_provider.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appProvider = Provider.of<AppProvider>(context);
    return Drawer(
      width: 60.w,
      child: Column(
        children: [
          DrawerHeader(
            child: SizedBox(width: double.infinity, child: FlutterLogo()),
            decoration: BoxDecoration(color: Colors.grey),
          ),
          CustomListTile(
            title: "Home",
            icon: Icons.home,
            onTapped: () {},
          ),
          CustomListTile(
            title: "Bookmark",
            icon: Icons.bookmark,
            onTapped: () {},
          ),
          Divider(),
          Row(
            children: [
              Text("Dark Mode"),
              Switch(
                value: appProvider.darkTheme,
                onChanged: (val) => appProvider.darkTheme = val,
              )
            ],
          )
        ],
      ),
    );
  }
}

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    required this.title,
    required this.icon,
    required this.onTapped,
    Key? key,
  }) : super(key: key);

  final IconData icon;
  final String title;
  final void Function()? onTapped;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: onTapped,
    );
  }
}
