import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:slashtask/datamodel/apiserver.dart';
import 'package:slashtask/model/product.dart';
import 'package:slashtask/screens/home/widgets/costemproductview.dart';

class homepage extends StatefulWidget{
  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  ListView(AsyncSnapshot<List<Product>> snapshot){
    return Padding(padding: EdgeInsets.only(top: 11,bottom: 8),
      child:GridView.count(mainAxisSpacing:20,crossAxisSpacing:2,crossAxisCount: 2,
        children: snapshot.data!.map((product) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: prodect(produucts: product),
        )).toList(),
    ) ,
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(backgroundColor: Colors.transparent,centerTitle: true,
      title: Text('Slash.',style: TextStyle(fontSize: 30,fontWeight: FontWeight.w900,fontFamily: 'Mulish'),),),
      body:Column(children: [Flexible(child:
      FutureBuilder<List<Product>>(
        builder: (BuildContext context, AsyncSnapshot<List<Product>> snapshot,)
        {  if(snapshot.hasError){
          return Text('');}
        else if(snapshot.hasData)
        {return ListView(snapshot);}
        return Center(child: CircularProgressIndicator());},
        future: FetchData(Dio()).fetchAllProducts(),
      ))],)



    );
  }
}

