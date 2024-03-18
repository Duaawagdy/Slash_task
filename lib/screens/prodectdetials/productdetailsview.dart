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
  //Future<List<ProductVarientImage>> images=Future(() => []);
  bool hascolorr=false;
  bool hassizee=false;
  bool hasmatrial=false;
 int sizee=0;
 int colorr=0;
  int matriall=0;
  int colorindex=0;
  int sizeindex=0;
  int matrialindex=0;
  @override
  void initState() {
fetchData();
print('1');
  }
  Future<void> fetchData() async {
    ProductDetails data = await ProductData(Dio()).fetchProductDetails(widget.id);
    print('here');
    hasColor(data.availableProperties);
    hasSize(data.availableProperties);
   // images=data[0].variations![0].productVarientImages as Future<List<ProductVarientImage>>;
    //print(images);
    hasMatrial(data.availableProperties);
    print('2');
  }
  void hasColor(List<AvailableProperty> dataList) {
    String color = "Color";
    String colornum='';
    for (int i=0;i<dataList.length;i++) {
      print('3');


          print('4');
          //print(prop.value.toString());
          if (dataList[i].property == color) {
            setState(() {
              hascolorr = true;
            colorr=dataList[i].values.length;
            colorindex=i;
            print(color);
              print('5');
            });
            return;
          }


    }
  }

  void hasSize(List<AvailableProperty> dataList) {
    String size = "Size";
    for (int i=0;i<dataList.length;i++) {
      if (dataList[i].property == size) {

          setState(() {
            hassizee = true;
            sizee = dataList[i].values.length;
            sizeindex=i;
            print(sizee);
          });
          return; // Exit the loop once size property is found

      }
    }
  }

  void hasMatrial(List<AvailableProperty> dataList) {
    String matrial = "Materials";
    for (int i=0;i<dataList.length;i++) {


        if (dataList[i].property== matrial) {
          setState(() {
            hasmatrial = true;
            matriall=dataList[i].values.length;
            matrialindex=i;
            print(matriall);
          });
          return; // Exit the loop once size property is found
        }


    }
  }
  View(AsyncSnapshot<ProductDetails> snapshot){


    return SingleChildScrollView(
      child: prodectdetials(data: snapshot.data!,hascolor: hascolorr, hassize: hassizee, size: sizee, color: colorr,  matrial: matriall, hasmatrial: hasmatrial, colorindex: colorindex, matrialindex: matrialindex, sizeindex: sizeindex,  ),
    );
  }
  @override
  Widget build(BuildContext context) {

   return Column(children: [Flexible(child:
   FutureBuilder<ProductDetails>(
     builder: (BuildContext context, AsyncSnapshot<ProductDetails> snapshot,)
     {  if(snapshot.hasError){
       return Text('');}
     else if(snapshot.hasData)
     {
       //getdataa(snapshot.data!.toList());
       return prodectdetials(data: snapshot.data!,hascolor: hascolorr, hassize:hassizee, size: sizee, color: colorr, matrial: matriall, hasmatrial: hasmatrial, colorindex: colorindex, matrialindex: matrialindex, sizeindex: sizeindex, );

     }
     return Center(child: CircularProgressIndicator());},
     future: ProductData(Dio()).fetchProductDetails(widget.id),
   ))],);
  }


}