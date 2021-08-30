import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sowmya_youtube/networks/auth/auth_manager.dart';
import 'package:sowmya_youtube/networks/base_response.dart';
import 'package:sowmya_youtube/utlis/text_field.dart';

import 'home_page.dart';

class LoginPageTwo extends StatefulWidget {
  @override
  _LoginPageTwoState createState() => _LoginPageTwoState();
}

class _LoginPageTwoState extends State<LoginPageTwo> {
  final nameController = TextEditingController() ;
  final passwordController = TextEditingController();
  bool _loading = false;
  Future<void> performLogin() async {
    String name = nameController.text.trim();
    String pass = passwordController.text.trim();
    if (name.isEmpty || pass.isEmpty) {
      Fluttertoast.showToast( msg:"enter details");
      return;
    }

    setState(() {
      _loading = true;
    });

    final response = await authManager.performLogin(name , pass);

    setState(() {
      _loading = false;
    });

    if (response.status == ResponseStatus.SUCCESS) {
      Fluttertoast.showToast(msg:response.message);
      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>HomePage()));
      // NavigationService().navigatePage(HomePage());
    } else {
      Fluttertoast.showToast(msg:response.message);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextFieldWidget(
            controller: nameController, label: 'Name',


          ),
          TextFieldWidget(
            controller: passwordController,
            label: 'password',


          ),

          TextButton(onPressed: (){
            performLogin();
          }, child: Text("Login"))
        ],
      ),
    );
  }
}
