import 'package:flutter/material.dart';
import 'package:sowmya_youtube/networks/auth/auth_manager.dart';
import 'package:sowmya_youtube/networks/base_response.dart';
import 'package:sowmya_youtube/pages/auth/register.dart';
import 'package:sowmya_youtube/pages/home_page.dart';
import 'package:sowmya_youtube/utlis/navigations.dart';
import 'package:sowmya_youtube/utlis/text_field.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final nameController = TextEditingController();
  final passController = TextEditingController();
  bool _loading = false;
  Future<void> performLogin() async {
    String name = nameController.text.trim();
    String pass = passController.text.trim();
    if (name.isEmpty || pass.isEmpty) {

      Fluttertoast.showToast( msg:"enter details");
      return;
    }

    FocusScope.of(context).requestFocus(FocusNode());

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
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFieldWidget(controller: nameController, label: "name"),
            TextFieldWidget(controller: passController, label: "password"),

           _loading? CircularProgressIndicator(): TextButton(onPressed: (){
              performLogin();
            }, child: Text("Login")),
            TextButton(onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>RegisterPage()));
             // NavigationService().navigatePage(RegisterPage());
            }, child: Text("Register"))
          ],
        ),
      ),
    );
  }
}
