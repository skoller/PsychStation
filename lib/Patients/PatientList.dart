import "package:flutter/material.dart";
import "package:hive/hive.dart";
// import 'NewPatientForm.dart';
import '../models/PatientModel.dart';
import 'package:hive_flutter/hive_flutter.dart';

const String patientBoxName = "patients";


class PatientList extends StatefulWidget {

  @override
  _PatientListState createState() => _PatientListState();
}

enum PatientFilter {ALL, CURRENT, ARCHIVED}

class _PatientListState extends State<PatientList> {

  Box<PatientModel> ptBox;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController detailController = TextEditingController();

  PatientFilter filter = PatientFilter.ALL;

  @override
  void initState() {
    // implement initState
    super.initState();
    ptBox = Hive.box<PatientModel>(patientBoxName);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Patients"),
        actions: <Widget>[
          PopupMenuButton<String>(
            onSelected: (value) {
              ///Pt : Take action accordingly
              
              if(value.compareTo("All") == 0){
                setState(() {
                  filter = PatientFilter.ALL;
                });
              }else if (value.compareTo("Archived") == 0){
                setState(() {
                  filter = PatientFilter.CURRENT;
                });
              }else{
                setState(() {
                  filter = PatientFilter.ARCHIVED;
                });
              }
            },
            itemBuilder: (BuildContext context) {
              return ["All", "Current", "Archived"].map((option) {
                return PopupMenuItem(
                  value: option,
                  child: Text(option),
                );
              }).toList();
            },
          )
        ],
      ),

      body: Column(
        children: <Widget>[
          ValueListenableBuilder(
            valueListenable: ptBox.listenable(),

            builder: (context, Box<PatientModel> pts, _){

              List<int> keys;

              if(filter == PatientFilter.ALL){
                keys = pts.keys.cast<int>().toList();
              }else if(filter == PatientFilter.CURRENT){
                keys = pts.keys.cast<int>().where((key) => !pts.get(key).archived).toList();
              }else{
                keys = pts.keys.cast<int>().where((key) => pts.get(key).archived).toList();
              }

              return ListView.separated(
                  itemBuilder:(_, index){

                    final int key = keys[index];
                    final PatientModel pt = pts.get(key);


                    return ListTile(
                      title: Text(pt.name, style: TextStyle(fontSize: 24),),
                      subtitle: Text(pt.detail,style: TextStyle(fontSize: 20)),
                      leading: Text("$key"),
                      trailing: Icon(Icons.check, color: pt.archived ? Colors.red : Colors.green,),
                      onTap: (){
                        showDialog(
                            context: context,
                            builder: (BuildContext context) => Dialog(
                                child: Container(
                                  padding: EdgeInsets.all(16),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[

                                      ElevatedButton(
                                        child: Text("Mark as archived"),
                                        onPressed: () {
                                          PatientModel mPt = PatientModel(
                                              key,
                                              pt.name,
                                              pt.detail,
                                              true
                                          );

                                          ptBox.put(key, mPt);

                                          Navigator.pop(context);
                                        },
                                      )
                                    ],
                                  ),
                                )
                            )
                        );
                      },
                    );
                  },
                  separatorBuilder: (_, index) => Divider(),
                  itemCount: keys.length,
                shrinkWrap: true,
              );
            },
          )
        ],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: (){
          showDialog(
              context: context,
              builder: (BuildContext context) =>
              Dialog(
                  child: Container(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        TextField(
                          decoration: InputDecoration(hintText: "Name"),
                          controller: nameController,
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        TextField(
                          decoration: InputDecoration(hintText: "Detail"),
                          controller: detailController,
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        ElevatedButton(
                          child: Text("Add Patient"),
                          onPressed: () {
                            ///Todo : Add Pt in hive
                            ///
                            // final int id = 999;
                            final String name = nameController.text;
                            final String detail = detailController.text;

                            PatientModel pt = PatientModel(0, name, detail, false);

                            ptBox.add(pt);

                            Navigator.pop(context);
                          },
                        )
                      ],
                    ),
                  )
              )
          );
        },
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}