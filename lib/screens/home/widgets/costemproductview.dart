import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:slashtask/datamodel/apiserver.dart';
import 'package:slashtask/datamodel/productdetailsapi.dart';
import 'package:slashtask/model/product.dart';
import 'package:slashtask/screens/home/widgets/productbrandname.dart';
import 'package:slashtask/screens/prodectdetials/prodectdetialbuilder.dart';
import 'package:slashtask/screens/prodectdetials/productdetailsview.dart';

class prodect extends StatelessWidget {
  const prodect({
    super.key, required this.produucts,
  });
  final Product produucts;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      physics: NeverScrollableScrollPhysics(),
      child: GestureDetector(
        onTap: (){Navigator.of(context).push(
            MaterialPageRoute (
          builder: (BuildContext context) =>  productview(id: produucts.id!.toInt(),),));
        ProductData(Dio()).fetchProductDetails(produucts.id!.toInt());
          print(produucts.id);
          },
        child: Container(


          height: size.height,
          //width: 90,
          child:
          Column(mainAxisAlignment:MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.center,children: [
            Container(

              height: 93,
              width: 130,
             foregroundDecoration:BoxDecoration(image: DecorationImage(image: NetworkImage('${produucts.productVariations![0].productVarientImages![0].imagePath}')),
                color: Colors.white,

                borderRadius: BorderRadius.circular(20),
              ) ,
              //child: FittedBox(fit:BoxFit.contain,
                //  child: Image.network('${produucts.productVariations![0].productVarientImages![0].imagePath}')),
            ),SizedBox(height: 8,),
            Container(
              height: size.height*0.06,
              //color: Colors.cyan,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width:size.width*0.3,
                    child: Wrap(
                      children: [
                        brandname(fonntsize: 14, brandnametext:'${produucts.brands!.brandName.toString()}-' ,),
                        //Text(' - ',style: TextStyle(color: Colors.white),),
                        productname(fontsize: 14, productnametext: produucts.name.toString(),),
                      ],
                    ),
                  ),
                  brandlogo(width: 30,height: 30, imagepath: '${produucts.brands?.brandLogoImagePath.toString()}',)
                ],),
            ),
            SizedBox(height: 2,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,children: [
              price(fonntsize: 14, pricetext: 'EGP${produucts.productVariations![0].price.toString()}',),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  IconButton(padding: EdgeInsets.only(left: 23),onPressed: (){}, icon: Icon(Icons.favorite_border,color: Color(
                      0xffffffff),)),IconButton(onPressed: (){}, icon: Icon(Icons.shopping_cart,color: Color(
                      0xff9d9d9d),))],)],)],
          ),
        ),
      ),
    );
  }
}






