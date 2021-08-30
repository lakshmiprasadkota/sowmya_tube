import 'package:flutter/material.dart';
import 'package:sowmya_youtube/networks/auth/auth_manager.dart';
import 'package:sowmya_youtube/networks/base_response.dart';
import 'package:sowmya_youtube/pages/home_page.dart';
import 'package:sowmya_youtube/utlis/text_field.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final nameController = TextEditingController();
  final passController = TextEditingController();
  final rePassController = TextEditingController();
  bool _loading = false;
  Future<void> performRegister() async {
    String name = nameController.text.trim();
    String pass = passController.text.trim();
    String rePass = rePassController.text.trim();
    if (name.isEmpty || pass.isEmpty|| rePass.isEmpty) {

      Fluttertoast.showToast( msg:"enter details");
      return;
    }

    FocusScope.of(context).requestFocus(FocusNode());

    setState(() {
      _loading = true;
    });

    final response = await authManager.preformRegister(name , pass , rePass);

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
            TextFieldWidget(controller: rePassController, label: "Re-enter password"),

            _loading? CircularProgressIndicator(): TextButton(onPressed: (){
              performRegister();
            }, child: Text("Login"))
          ],
        ),
      ),
    );
  }
}
