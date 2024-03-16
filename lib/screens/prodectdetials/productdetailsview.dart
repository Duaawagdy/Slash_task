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

  bool hascolorr=false;
  bool hassizee=false;
 String size='';
 String color='';

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
    print('2');
  }
  void hasColor(List<Data> dataList) {
    String color = "Color";
    String colornum='';
    for (var variation in dataList[0].variations!) {
      print('3');

        for (var prop in variation.productPropertiesValues!) {
          print('4');
          print(prop.value.toString());
          if (prop.property.toString() == color) {
            setState(() {
              hascolorr = true;
            colornum=prop.value.toString();
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

            });
            return; // Exit the loop once size property is found
          }
        }

    }
  }
  View(AsyncSnapshot<List<Data>> snapshot){

    List<Data> data=snapshot.data!.toList();
    return SingleChildScrollView(
      child: prodectdetials(data: snapshot.data!.toList(),hascolor: hascolorr, hassize: hassizee,),
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
       return prodectdetials(data: snapshot.data!.toList(),hascolor: hascolorr, hassize:hassizee,);

     }
     return Center(child: CircularProgressIndicator());},
     future: ProductData(Dio()).fetchProductDetails(widget.id),
   ))],);
  }


}