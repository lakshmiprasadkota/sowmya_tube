import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class TextFieldWidget extends StatefulWidget {
  TextFieldWidget(

      {
        required this.controller,
        this.textInputType,
        this.icon,
        this.hint = " ",
        this.enable,
        this.textInputFormatter,
        required this.label,
        this.textCapitalization,
        this.validator});

  String? Function(String?)? validator ;
  String label ;
  bool? enable= true;
  final String hint ;
  Widget? icon  ;
  TextEditingController  controller ;
  List <TextInputFormatter>? textInputFormatter;
  TextInputType? textInputType;
  TextCapitalization? textCapitalization ;


  @override
  _TextFieldWidgetState createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  FocusNode myFocusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: FocusScope(
        child: Focus(
          onFocusChange: (hasFocus) {
            setState(() {
              // we need call setState to Color update properly
              // based on isValid property
            });
          },
          child: TextFormField(
            validator:widget.validator ,
            focusNode: myFocusNode,
            enabled: widget.enable,
            style: TextStyle(
              fontSize: 16,
              // color: AppColors.lightBlack,
              fontWeight: FontWeight.w600,
            ),

            controller: widget.controller,
            keyboardType: widget.textInputType,
            inputFormatters: widget.textInputFormatter,
            textInputAction: TextInputAction.next,
            textCapitalization: widget.textCapitalization??TextCapitalization.sentences,
            decoration: InputDecoration(
                suffixIcon: widget.icon,
                suffixIconConstraints: BoxConstraints(
                  minWidth: 20,
                  minHeight: 20,
                ),
                labelText: widget.label,
                hintText:widget.hint,
                hintStyle:  TextStyle(
                  fontSize: 13,
                  // color: AppColors.darkGreyColor,
                  fontWeight: FontWeight.w600,
                ),
                labelStyle: TextStyle(
                  fontSize: 13,
                  // color: myFocusNode.hasFocus? AppColors.orangeColor :AppColors.darkGreyColor,
                  fontWeight: FontWeight.w600,
                ),
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      // color: AppColors.b1b1,
                    )),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      // color: AppColors.orangeColor,
                    ))),
          ),
        ),
      ),
    );
  }
}