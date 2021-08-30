import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sowmya_youtube/models/categoriessss.dart';
import 'package:sowmya_youtube/networks/auth/auth_manager.dart';
import 'package:sowmya_youtube/networks/auth/categorie_manager.dart';
import 'package:sowmya_youtube/networks/base_network.dart';
import 'package:sowmya_youtube/networks/base_response.dart';
import 'package:sowmya_youtube/providers/all_poviders.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _loading = true;
  CategoriesModel? _categoriesModel;
  Future<void> fetchCategories() async {
    setState(() {
      _loading = true;
    });

    final response = await categoriesManager.fetchCategories();

    setState(() {
      _loading = false;
    });

    if (response.status == ResponseStatus.SUCCESS) {
      Fluttertoast.showToast(msg:response.message);
   setState(() {
     _categoriesModel = response.data;
   });
      // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>HomePage()));
      // NavigationService().navigatePage(HomePage());
    } else {
      Fluttertoast.showToast(msg:response.message);
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchCategories();

  }
  @override
  Widget build(BuildContext context) {

    // final viewModel  = watch(getDataFuture);

    return Scaffold(
      body: Center(
        child: _loading ? CircularProgressIndicator(): Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("${_categoriesModel?.categoryName}")
          ],
        ),
      ),
    );
  }
}
