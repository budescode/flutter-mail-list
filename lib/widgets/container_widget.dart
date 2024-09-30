         // ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter_project/constants/colors.dart';
import 'package:flutter_project/models/email_models.dart';
import 'package:flutter_project/widgets/cache_image.dart';
import 'package:flutter_project/widgets/text_widget.dart';

Widget containerWidget(BuildContext context, EmailModel emailModel){
  Size size = MediaQuery.of(context).size;
  return   Container( 
              margin: EdgeInsets.only(bottom: 10),
               decoration: BoxDecoration(
              
              border: Border(
                bottom: BorderSide(
                  color: white2, 
                  width: 1.0,
                ),
              ),
            ),
               child: Padding(
                 padding: const EdgeInsets.only(left: 18.0, right: 18,),
                 child: Column(children: [
                 
                 Row(children: [
                               Container(width: size.width/12,height: size.height/25.1,
                               decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: white3
                               )
                               ,child:
                                emailModel.imageUrl == "" || emailModel.imageUrl == null?
                                Center(child: textWidget("${emailModel.firstName[0]}${emailModel.lastName[0]}")):

                                cachedImage(emailModel.imageUrl, 30, 30, circle_shape: true)
                                ,),
                               Expanded(child: Row(children: [
                  SizedBox(width: 10,),
                               textWidget("${emailModel.firstName} ${emailModel.lastName}", fontSize: 12, color: black3, fontWeight: FontWeight.w500),
                               Spacer(),
                               textWidget("1:20 PM", color: black3, fontWeight: FontWeight.w400, fontSize: 12),
                               ],)),
                              
                             ],),
                      
                          Row(children: [
                               Container(width: 30,height: 10,),
                               Expanded(child: Row(children: [
                  SizedBox(width: 10,),
                               textWidget(emailModel.subject, color: black4, fontSize: 13, fontWeight: FontWeight.w600),             
                               ],)),
                             ],),
                 
                               Row(children: [
                        Container(width: 30,  child: 
                        Checkbox(                          
                        value: emailModel.read,
                         fillColor: WidgetStateProperty.resolveWith<Color>((states) {
                          if (states.contains(WidgetState.selected)) {
                            return blueColor; // Background color when checked
                          }
                          return transparentColor; // Background color when unchecked
                        }),
                        onChanged: (bool? newValue) {                 
                        },
                          side: BorderSide(color: black3, width: .5),
                        )),
                        SizedBox(width: 8,),
                               Expanded(child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                              textWidget(emailModel.description, color: black3, fontSize: 14, fontWeight: FontWeight.w400),             
                               ],)),
                             ],),
                 SizedBox(height: 10,),
                             ],
                             
                             ),
               ),);
               }
           