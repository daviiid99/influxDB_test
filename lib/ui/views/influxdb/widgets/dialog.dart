import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../influxdb_viewmodel.dart';

class DialogMenu extends StatelessWidget{
  const DialogMenu({super.key});

  static inputDialog(BuildContext context, TextEditingController point, TextEditingController tag, TextEditingController tagValue, TextEditingController field, TextEditingController fieldValue){
    showDialog(
        context: context,
        builder: (BuildContext context){
          return AlertDialog(
            scrollable: true,
            backgroundColor: Colors.black.withOpacity(0.5),
            content: SizedBox(
              height: 600,
              width: double.maxFinite,
              child : Column(
                children: [
                  // Title
                  const Text("Insertar Registro", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30), textAlign: TextAlign.center,),
                  const SizedBox(height: 50,),
                  Row( children : [ const SizedBox(width: 5,), const Text("Punto", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold), textAlign: TextAlign.left,)]),
                  const SizedBox(height: 5,),
                  // Point
                  SizedBox(
                    height : 100,
                    width : 300,
                    child : TextField(
                      controller: point ,
                      decoration: InputDecoration(
                          hintText: "Introduce un punto",
                          alignLabelWithHint: true,
                          fillColor: Colors.white.withOpacity(0.7),
                          filled: true
                      ),
                    ),
                  ),

                  const SizedBox(height: 20,),

                    // Tag
                  Row( children : [ const SizedBox(width: 5,),const Text("Etiqueta", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold), textAlign: TextAlign.left,)]),
                  const SizedBox(height: 5,),

                  Row(
                    children: [
                      const Spacer(),
                      SizedBox(
                        height : 100,
                        width : 130,
                        child : TextField(
                        controller: tag ,
                        decoration: InputDecoration(
                            hintText: "Etiqueta",
                            alignLabelWithHint: true,
                            fillColor: Colors.white.withOpacity(0.7),
                            filled: true
                        ),
                      ),
                      ),
                      const SizedBox(width: 5,),
                      SizedBox(
                        height : 100,
                        width : 130,
                        child : TextField(
                          controller: tagValue ,
                          decoration: InputDecoration(
                              hintText: "Valor",
                              alignLabelWithHint: true,
                              fillColor: Colors.white.withOpacity(0.7),
                              filled: true
                          ),
                        ),
                      ),
                      const Spacer(),
                    ],
                  ),
                  const SizedBox(height: 20,),

                  // Field
                  Row( children : [ const SizedBox(width: 5,), const Text("Campo", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold), textAlign: TextAlign.left,)]),
                  const SizedBox(height: 5,),
                  Row(
                    children: [
                      const Spacer(),
                      SizedBox(
                        height : 100,
                        width : 130,
                        child : TextField(
                          controller: field ,
                          decoration: InputDecoration(
                              hintText: "Campo",
                              alignLabelWithHint: true,
                              fillColor: Colors.white.withOpacity(0.7),
                              filled: true
                          ),
                        ),
                      ),
                      const SizedBox(width: 5,),
                      SizedBox(
                        height : 100,
                        width : 130,
                        child : TextField(
                          controller: fieldValue ,
                          decoration: InputDecoration(
                              hintText: "Valor",
                              alignLabelWithHint: true,
                              fillColor: Colors.white.withOpacity(0.7),
                              filled: true
                          ),
                        ),
                      ),
                      const Spacer(),
                    ],
                  ),
                  const SizedBox(height: 20,),

                  Row(
                    children  : [
                      const SizedBox(width: 20,),
                      Expanded(
                        child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child : TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.greenAccent
                    ),
                      onPressed: (){
                      // Insertamos el valor
                        //InfluxdbModel.createClient();
                        InfluxdbModel.writeData(point.text, tag.text, tagValue.text, field.text, fieldValue.text);
                      },
                      child: const Text("Guardar", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),)
                    )
                        ),
                      ),
                      const SizedBox(width: 20,),
                    ],
                  )
                ]
              )
            ),
          );
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }}