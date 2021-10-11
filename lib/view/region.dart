import 'package:DIH4CPS_APP/components/region/patient_form.dart';
import 'package:DIH4CPS_APP/components/region/region_form.dart';
import 'package:DIH4CPS_APP/components/region/region_graph.dart';

import 'package:flutter/material.dart';

import 'package:DIH4CPS_APP/components/app_bar.dart';

class MyAppRegion extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppRegionState();
  }
}

class MyAppRegionState extends State<MyAppRegion>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: Drawer(
          child: Container(
            child: Text("This is a Drawer"),
          ),
        ),
        appBar: MyAppBar(
          appBar: AppBar(),
          title: Text("Score de sommeil"),
        ),
        body: Container(
          child: Column(
            children: [
              DefaultTabController(
                length: 2,
                child: Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 20.0,
                    vertical: 5.0,
                  ),
                  height: 45.0,
                  child: TabBar(
                    controller: _tabController,
                    tabs: [
                      Text(
                        "Region",
                        style: TextStyle(color: Colors.black, fontSize: 20.0),
                      ),
                      Text(
                        "Patient",
                        style: TextStyle(color: Colors.black, fontSize: 20.0),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: <Widget>[
                    _showPick(showPopUpRegion, "Veuillez choisir une région"),
                    _showPick(showPopUpPatient, "Veuillez choisir un patient"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _showPick(Function onPick, String buttonText) {
    return Container(
      child: Column(
        children: [
          Expanded(child: SimpleTimeSeriesChart()),
          Container(
            margin: EdgeInsets.only(right: 15.0, left: 15.0, bottom: 2.0),
            child: SizedBox(
              width: double.infinity,
              child: RaisedButton(
                child: Text(buttonText),
                onPressed: () {
                  onPick(context);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
