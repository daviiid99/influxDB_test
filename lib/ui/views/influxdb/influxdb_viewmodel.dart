import 'dart:io';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:influxdb_client/api.dart';

class InfluxdbModel extends BaseViewModel{

   static var client;
   static var point;
  TextEditingController pointController = TextEditingController(text: "");
  TextEditingController tagController = TextEditingController(text: "");
  TextEditingController tagValueController = TextEditingController(text: "");
  TextEditingController fieldController = TextEditingController(text: "");
  TextEditingController fieldValueController = TextEditingController(text: "");

  static InfluxDBClient createClient(){
    // Este metodo crea un cliente para influxdb

    if (Platform.isAndroid){
      return client = InfluxDBClient(
          url: 'http://10.0.2.2:8086',
          token: 'JLnYTAp0LsqQWp3uqmk6MHjalgxE9kTl-cwkbuZPefImS5sjIQZyrP7HXWIdvbeAgBVieqVv-am5XT00H5AZFA==',
          org: 'local',
          bucket: 'test',
          debug: true);
    } else {
      return client = InfluxDBClient(
          url: 'http://localhost:8086',
          token: 'JLnYTAp0LsqQWp3uqmk6MHjalgxE9kTl-cwkbuZPefImS5sjIQZyrP7HXWIdvbeAgBVieqVv-am5XT00H5AZFA==',
          org: 'local',
          bucket: 'test',
          debug: true);
    }

  }

  static writeData(String pointText, String tagText, String tagValueText, String fieldText, String fieldValueText) async {
    // Preparamos una instancia de writeApi
    var writeApi = WriteService(createClient());
    var point = createPoint(pointText, tagText, tagValueText, fieldText, fieldValueText);

    print(point.fields.keys);
    print(createClient().bucket);

    await writeApi.write(point).then((value) => print("Wrote data!"));

  }

  static Point createPoint(String pointText, String tagText, String tagValueText, String fieldText, String fieldValueText){
    // Recuperamos los datos
    return point = Point(pointText)
        .addTag(tagText, tagValueText)
        .addField(fieldText, double.parse(fieldValueText))
        .time(DateTime.now().toUtc());
  }
}