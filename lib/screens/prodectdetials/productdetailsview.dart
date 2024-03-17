import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:slashtask/datamodel/productdetailsapi.dart';
import 'package:slashtask/model/productdetails.dart';
import 'package:slashtask/screens/prodectdetials/prodectdetialbuilder.dart';

class productview extends StatefulWidget{
  const productview({super.key, required this.id});
final int id;

  @override
  State<productview> createState() => _productviewState();
}

class _productviewState extends State<productview> {
  Future<List<ProductVarientImage>> images=Future(() => []);
  bool hascolorr=false;
  bool hassizee=false;
  bool hasmatrial=false;
 String sizee='';
 String color='';
  String matriall='';
  @override
  void initState() {
fetchData();
print('1');
  }
  Future<void> fetchData() async {
    final List<Data> data = await ProductData(Dio()).fetchProductDetails(widget.id);
    print('here');
    hasColor(data);
    hasSize(data);
    images=data[0].variations![0].productVarientImages as Future<List<ProductVarientImage>>;
    print(images);
    hasMatrial(data);
    print('2');
  }
  void hasColor(List<Data> dataList) {
    String color = "Color";
    String colornum='';
    for (var variation in dataList[0].variations!) {
      print('3');

        for (var prop in variation.productPropertiesValues!) {
          print('4');
          //print(prop.value.toString());
          if (prop.property.toString() == color) {
            setState(() {
              hascolorr = true;
            color=prop.value.toString();
            print(color);
              print('5');
            });
            return;
          }
        }

    }
  }

  void hasSize(List<Data> dataList) {
    String size = "Size";
    for (var variation in dataList[0].variations!) {

        for (var prop in variation.productPropertiesValues!) {
          if (prop.property == size) {
            setState(() {
              hassizee = true;
           sizee=prop.value.toString();
           print(sizee);
            });
            return; // Exit the loop once size property is found
          }
        }

    }
  }
  void hasMatrial(List<Data> dataList) {
    String matrial = "Materials";
    for (var variation in dataList[0].variations!) {

      for (var prop in variation.productPropertiesValues!) {
        if (prop.property == matrial) {
          setState(() {
            hasmatrial = true;
            matriall=prop.value.toString();
            print(matriall);
          });
          return; // Exit the loop once size property is found
        }
      }

    }
  }
  View(AsyncSnapshot<List<Data>> snapshot){

    List<Data> data=snapshot.data!.toList();
    return SingleChildScrollView(
      child: prodectdetials(data: snapshot.data!.toList(),hascolor: hascolorr, hassize: hassizee, size: sizee, color: color,  matrial: matriall, hasmatrial: hasmatrial,  ),
    );
  }
  @override
  Widget build(BuildContext context) {

   return Column(children: [Flexible(child:
   FutureBuilder<List<Data>>(
     builder: (BuildContext context, AsyncSnapshot<List<Data>> snapshot,)
     {  if(snapshot.hasError){
       return Text('');}
     else if(snapshot.hasData)
     {
       //getdataa(snapshot.data!.toList());
       return prodectdetials(data: snapshot.data!.toList(),hascolor: hascolorr, hassize:hassizee, size: sizee, color: color, matrial: matriall, hasmatrial: hasmatrial, );

     }
     return Center(child: CircularProgressIndicator());},
     future: ProductData(Dio()).fetchProductDetails(widget.id),
   ))],);
  }


}