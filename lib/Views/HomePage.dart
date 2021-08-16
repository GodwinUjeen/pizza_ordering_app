import 'dart:io';

import 'package:flutter/material.dart';
import 'package:pizzato/Helpers/Footer.dart';
import 'package:pizzato/Helpers/Headers.dart';
import 'package:pizzato/Helpers/Middle.dart';
import 'package:pizzato/Services/ManageMaps.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    Provider.of<GenerateMaps>(context, listen: false).getCurrentLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Footers().floatingActionButton(context),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Headers().appBar(context),
              Headers().headerText(),
              Headers().headerMenu(context),
              Divider(),
              MiddleHelpers().textFav(),
              MiddleHelpers().dataFav(context, 'favourite'),
              MiddleHelpers().textBusiness(),
              MiddleHelpers().dataBusiness(context, 'business'),
            ],
          ),
        ),
      ),
    );
  }
}
