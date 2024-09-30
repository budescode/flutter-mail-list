// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter_project/constants/colors.dart';
import 'package:flutter_project/provider/email_provider.dart';
import 'package:flutter_project/widgets/app_bar.dart';
import 'package:flutter_project/widgets/container_widget.dart';
import 'package:flutter_project/widgets/loading_widget.dart';
import 'package:flutter_project/widgets/text_field.dart';
import 'package:flutter_project/widgets/text_widget.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      EmailProvider emailProvider =
          Provider.of<EmailProvider>(context, listen: false);
          emailProvider.getEmails(context);
    });
  }
final searchController = TextEditingController(); 
  @override
  Widget build(BuildContext context) {
       EmailProvider emailProvider =
          Provider.of<EmailProvider>(context);    
          Size size = MediaQuery.of(context).size;      
    return Scaffold(         
      appBar: appBarWidget(context),
      floatingActionButton: Container(
        width: size.width/3,
        height: size.height/15.06,
        decoration: BoxDecoration(
          color: blueColor,
          borderRadius: BorderRadius.circular(
            30)

        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Icon(Icons.add, color: whiteColor,),
        
        textWidget("Compose", color: whiteColor)
        ],),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10),
        child:
        
        emailProvider.loading?Center(child: loadingWidget()):
         RefreshIndicator(onRefresh: ()async{ //swipe down to refresh

          await emailProvider.getEmails(context);
         },
           child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 18.0, right: 18,),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  
                  children: [
                  emailProvider.showSearchField==true?
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    child: buildTextField(controller: searchController,
                                      hintText: "Search",
                                      fillColor: transparentColor,
                                      keyboardType: TextInputType.text,
                                      filled: true,
                                      onChanged: (e){
                                      emailProvider.filterEmail(e);
                                      },
                                      ),
                  ):SizedBox(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      textWidget("Inbox", color: black2, fontWeight: FontWeight.w500),
                      SizedBox(width: 5,),
                      textWidget("${emailProvider.unread} unread", color: blueColor, fontWeight: FontWeight.w500)
                    ],),
                  ],
                ),
              ),
              SizedBox(height: 10,),
            ...emailProvider.emailListShow.map((e)=>containerWidget(context, e))
              
            
            ],
                   ),
         ),
      ),
    );
  }
}
