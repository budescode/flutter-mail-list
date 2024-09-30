import 'package:flutter/material.dart';
import 'package:flutter_project/constants/colors.dart';
import 'package:flutter_project/constants/images.dart';
import 'package:flutter_project/provider/email_provider.dart';
import 'package:flutter_project/widgets/text_widget.dart';
import 'package:provider/provider.dart';

PreferredSizeWidget appBarWidget(BuildContext context){
       EmailProvider emailProvider =
          Provider.of<EmailProvider>(context);
          Size size = MediaQuery.of(context).size;
  return AppBar(    
        toolbarHeight: 70,   
          title: textWidget("Mail",
          fontWeight: FontWeight.w700,          
          ),
        actions: [          
          Image.asset(menuIcon, width: size.width/14.4, height: size.height/30.12,),
          SizedBox(width: size.width/24,),
          InkWell(
            onTap: (){
              emailProvider.toggleSearchField();
            },
            child: Image.asset(searchIcon, width: size.width/14.4, height:size.height/30.12)),
          SizedBox(width: size.width/24,),
        ],
          bottom: PreferredSize(
    preferredSize: Size.fromHeight(1.0),
    child: Container(
      color: grey,
      height: 1.0, 
    ),
  ),

        
      );
}