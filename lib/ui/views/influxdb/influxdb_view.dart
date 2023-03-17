import 'package:flutter/material.dart';
import 'package:prueba_stackeddart/ui/views/home/home_view.dart';
import 'package:prueba_stackeddart/ui/views/home/home_viewmodel.dart';
import 'package:stacked/stacked.dart';
import 'package:prueba_stackeddart/ui/common/app_colors.dart';
import 'package:prueba_stackeddart/ui/common/app_strings.dart';
import 'influxdb_viewmodel.dart';
import 'widgets/dialog.dart';

class InfluxdbView extends StackedView<InfluxdbModel>{

  @override
  const InfluxdbView({
    super.key
});

  @override
  Widget builder(
      BuildContext context,
      InfluxdbModel viewModel,
      Widget? child,
      ){
    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent,
      appBar: AppBar(
        elevation: 0.0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView(
                children: [
                  // Banner
                  Container(
                    width: double.maxFinite,
                    height: 200,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/logo.png"),
                            alignment: Alignment.center,
                            fit: BoxFit.fitHeight
                        )
                    ),
                  ),

                  Column(
                    children: [
                      Row(
                        children: [
                          const Spacer(),
                          SizedBox(
                            width: 400,
                            height: 450,
                            child: ListView(
                              scrollDirection: Axis.vertical,
                              children: [
                                // Create
                                ClipRRect(
                                    borderRadius : BorderRadius.circular(25),
                                    child : InkWell(
                                      onTap: () {
                                        print(InfluxdbModel.createClient().url);
                                        final message = SnackBar(content: Text("Se creó el cliente", style: TextStyle(color: Colors.white), textAlign: TextAlign.center,), backgroundColor: Colors.black.withOpacity(0.5), showCloseIcon: true, duration: Duration(seconds: 10), closeIconColor: Colors.white, elevation: 6.0, shape: Border.all(width: 3.0, ),);
                                        ScaffoldMessenger.of(context).showSnackBar(message);
                                      },
                                        child : Container(
                                          width: double.maxFinite,
                                          height: 100,
                                          color: Colors.black,
                                          child: Column(
                                            children  : [
                                              const Spacer(),
                                              const Text("Crear Cliente", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20), textAlign: TextAlign.center,),
                                              const Spacer(),
                                            ],
                                          ),
                                        ),
                                    )
                                ),
                                const SizedBox(height: 10,),

                                // Write Data
                                ClipRRect(
                                    borderRadius : BorderRadius.circular(25),
                                    child : InkWell(
                                      onTap: (){
                                        DialogMenu.inputDialog(context, viewModel.pointController, viewModel.tagController, viewModel.tagValueController, viewModel.fieldController, viewModel.fieldValueController);
                                      },
                                        child : Container(
                                          width: double.maxFinite,
                                          height: 100,
                                          color: Colors.black,
                                          child: Column(
                                            children  : [
                                              const Spacer(),
                                              const Text("Escribir Datos", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
                                              const Spacer(),
                                            ],
                                          ),
                                        ),
                                    ),
                                ),
                                const SizedBox(height: 10,),

                                // Query
                                ClipRRect(
                                    borderRadius : BorderRadius.circular(25),
                                    child : InkWell(
                                      onTap: (){},
                                        child : Container(
                                          width: double.maxFinite,
                                          height: 100,
                                          color: Colors.black,
                                          child: Column(
                                            children  : [
                                              const Spacer(),
                                              const Text("Consultar Datos", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20), textAlign: TextAlign.center,),
                                              const Spacer(),
                                            ],
                                          ),
                                        ),
                                    ),
                                ),
                                const SizedBox(height: 10,),

                                // Delete
                                ClipRRect(
                                    borderRadius : BorderRadius.circular(25),
                                    child : InkWell(
                                      onTap : (){},
                                        child : Container(
                                          width: double.maxFinite,
                                          height: 100,
                                          color: Colors.black,
                                          child: Column(
                                            children  : [
                                              const Spacer(),
                                              const Text("Borrar Datos", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
                                              const Spacer(),
                                            ],
                                          ),
                                        ),
                                    ),
                                ),
                                const SizedBox(height: 10,),
                              ],
                            ),
                          ),
                          const Spacer(),
                        ],
                      )
                    ],
                  )
                  //
                ],
              ))
        ],
      ),
    );
  }

  @override
  InfluxdbModel viewModelBuilder(
      BuildContext context,
      ) =>
      InfluxdbModel();


}