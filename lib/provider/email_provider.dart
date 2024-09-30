
import 'package:flutter/material.dart';
import 'package:flutter_project/constants/constants.dart';
import 'package:flutter_project/helpers/requesthelper.dart';
import 'package:flutter_project/models/email_models.dart';
import 'package:flutter_project/widgets/showToast.dart';



class EmailProvider with ChangeNotifier {

  List<EmailModel> emailListShow = [];
  List<EmailModel> emailList = [];
  // we have 2 lists holding the emails, the first one is what will be displayed on the screen, the second one holds all the data of emails and can be searched too
  //when email is searched, the filtered data is sent to the emailListShow to display on the screen

  bool loading = false; //when getting the emails
  bool showSearchField = true; //used to show or hide search field in the home page
  int unread = 0; //number of undread emails

void toggleSearchField(){ //method used to toggle the search field
  showSearchField = !showSearchField;
  notifyListeners();
}

  getEmails(BuildContext context) async { //method used to get emails from api
    loading = true;
    notifyListeners();
    try {     
      HttpModel httpData  = await RequestHelper.getRequest("https://mocki.io/v1/743e73d5-c8ce-4311-8930-c35d702c8308", {});
      if (httpData.apistatus == ApiStatusEnum.success){   //check if status is successful        
      var body = httpData.data;
      List data = body;
        List<EmailModel> emailData = data
          .map((e) => EmailModel.fromJson(e))
          .toList();
        //update both the email list and email list show
        emailList =emailData;
        emailListShow = emailData;
        
        //filter the unread email and update the variable
        List<EmailModel> unreadEmail  = emailData.where((e) => e.read ==false).toList();
        unread = unreadEmail.length;
      
      }else{
        //show error 
        showToast(context:context,       
                msg: httpData.message?? "");        
      }
        loading = false;
        notifyListeners();
   
    } catch (e) {
              showToast(context:context,        
                msg: e.toString());
      loading = false;
      notifyListeners();
    
    }
  }
  filterEmail(String data){ //filter the email list by title or description
    List<EmailModel> searchEmail  = emailList.where((e) => 
    e.description.toLowerCase().contains(data.toLowerCase())==true || 
    e.subject.toLowerCase().contains(data.toLowerCase())==true 
     ) .toList();
    emailListShow = searchEmail;
    notifyListeners();
  }
}
