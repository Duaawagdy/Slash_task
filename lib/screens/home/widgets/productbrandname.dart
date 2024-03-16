import 'package:flutter/material.dart';

class productname extends StatelessWidget {
  const productname({
    super.key, required this.fontsize, required this.productnametext,
  });
final double fontsize;
  final String productnametext;

  @override
  Widget build(BuildContext context) {
    return Text('${productnametext}',softWrap: false,overflow: TextOverflow.ellipsis,style:
    TextStyle(color: Colors.white,fontWeight: FontWeight.w900,fontSize: fontsize,fontFamily: 'Mulish'),);
  }
}
class brandname extends StatelessWidget {
  const brandname({
    super.key, required this.fonntsize, required this.brandnametext,
  });

  final double fonntsize;
  final String brandnametext;

  @override
  Widget build(BuildContext context) {
    return Text('${brandnametext}',softWrap: false,style:
    TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontFamily: 'Mulish'),);
  }
}
class brandlogo extends StatelessWidget {
  const brandlogo({
    super.key, required this.width, required this.height, required this.imagepath,
  });
final double width;
  final double height;

final String imagepath;
  @override
  Widget build(BuildContext context) {
    return Container
      (height: height,width:width,
        foregroundDecoration:BoxDecoration(image: DecorationImage(image: NetworkImage('${imagepath}',)),
            shape: BoxShape.circle,color:Colors.white,
            border: Border.all(color: Colors.white,width: 0.1)),

    );
  }
}
class price extends StatelessWidget {
  const price({
    super.key, required this.fonntsize, required this.pricetext,
  });
   final double fonntsize;
  final String pricetext;
  @override
  Widget build(BuildContext context) {
    return Text('   ${pricetext}',
      style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontFamily: 'Mulish',fontSize: fonntsize),);
  }
}