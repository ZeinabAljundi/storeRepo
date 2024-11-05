import 'package:flutter/material.dart';

import '../core/constances/all_colors.dart';
import '../core/service/media_query_service.dart';
class SideMenu extends StatelessWidget {
  const SideMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(drawer: Drawer( backgroundColor: MyColor.mydrawarColor,
      child: ListView(
        padding: EdgeInsets.all(8),
        children:[ SizedBox(height: MySize.screenHeight(context)*0.04,),
          Align(alignment: Alignment.centerLeft,
            child: CircleAvatar( radius: MySize.screenWidth(context) * 0.1,
              child: Image(
                image: AssetImage("assets/images/profile.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: MySize.screenHeight(context)*0.02,),
          Text("Programmer X",style: TextStyle(color: MyColor.myWhite),),
          SizedBox(height: MySize.screenHeight(context)*0.04,),
          ListTile(
            leading:Icon( color: MyColor.myWhite,Icons.perm_identity_rounded),
            title: Text('Profile',style: TextStyle(color: MyColor.myWhite)),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.add_shopping_cart ,color: MyColor.myWhite,),
            title: Text('MyCart',style: TextStyle(color: MyColor.myWhite)),
            onTap: () {
              // Close the drawer and navigate to the settings screen
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.favorite, color: MyColor.myWhite,),
            title: Text('Favorate',style: TextStyle(color: MyColor.myWhite)),
            onTap: () {
              // Close the drawer and navigate to the about screen
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.train_outlined , color: MyColor.myWhite,),
            title: Text('Order',style: TextStyle(color: MyColor.myWhite)),
            onTap: () {
              Navigator.pop(context);
            },
          ), ListTile(
            leading: Icon(Icons.notification_important_rounded , color: MyColor.myWhite,),
            title: Text('Notification',style: TextStyle(color: MyColor.myWhite)),
            onTap: () {
              Navigator.pop(context);
            },
          ), ListTile(
            leading: Icon( Icons.settings , color: MyColor.myWhite,),
            title: Text('Sitting',style: TextStyle(color: MyColor.myWhite)),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          Divider(
            color: MyColor.myWhite,      // Line color
            thickness: 1.0,          // Line thickness
            indent: 16.0,            // Left indentation
            endIndent: 16.0,         // Right indentation
          ),
          ListTile(
            leading:Icon( color: MyColor.myWhite,Icons.logout),
            title: Text('Sign Out',style: TextStyle(color: MyColor.myWhite)),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    ),);
  }
}

