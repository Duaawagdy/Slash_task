

import 'package:flutter/material.dart';
import 'package:slashtask/model/productdetails.dart';
import 'package:slashtask/screens/home/widgets/productbrandname.dart';

class prodectdetials extends StatefulWidget {
  const prodectdetials({super.key, required this.data, required this.hascolor, required this.hassize});
  final  List<Data> data;
  final bool hascolor;
  final bool hassize;
  @override
  State<prodectdetials> createState() => _prodectdetialsState();
}

class _prodectdetialsState extends State<prodectdetials> {
  late PageController pageController;
  int selectedColor = 0;
   int selectsize=0;
   int selectcolor=0;
  int selectmaterial=0;
  //bool hascolorr=false;
  bool hassizee=false;
  List<bool> _isExpandedList = [false];



  @override
  void initState() {
    pageController = PageController(initialPage: 2, viewportFraction: 0.7);
    super.initState();

  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: const Text(
          'Product details',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
        ),
      ),
      body: ListView(

        physics: NeverScrollableScrollPhysics(),
        children: [
         SizedBox(
           height: size.longestSide,
            width: size.width,
            child: CustomScrollView(
              physics:BouncingScrollPhysics(),
              slivers: [
                SliverFillRemaining(
                  hasScrollBody: false,
               //fillOverscroll: !_isExpandedList[0],
                  child:Column(
                    //mainAxisAlignment: MainAxisAlignment.start,
                    //crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: size.width,
                        height: size.height * 0.4,
                        child: PageView.builder(
                          itemCount: widget.data[0].variations![0].productVarientImages?.length,
                          physics: const BouncingScrollPhysics(),
                          controller: pageController,
                          itemBuilder: (context, int) {
                            return AnimatedBuilder(
                              animation: pageController,
                              builder: (context, child) {
                                double value = 0.0;
                                if (pageController.position.haveDimensions) {
                                  value = int.toDouble() - (pageController.page ?? 0);
                                  value = (value * 0.04).clamp(-1, 1);
                                }
                                return Transform.rotate(
                                  angle: 2*3.14 * value,
                                  child: cards(context,size,widget.data[0].variations![0].productVarientImages![0].imagePath.toString()),
                                );
                              },
                            );
                          },
                        ),
                      ),
                      //SizedBox(height: 4,),
                      SizedBox(
                        //width: size.width * 0.48,
                          height: size.height * 0.07,
                          child: Row(mainAxisAlignment:MainAxisAlignment.center
                            ,children: [cardbody(context, size,widget.data[0].variations![0].productVarientImages![0].imagePath.toString())
                              ,const SizedBox(width: 8,),
                              cardbody(context, size,widget.data[0].variations![0].productVarientImages![0].imagePath.toString())],)),
                      const SizedBox(height: 15,),
                       Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,
                        children: [Padding(
                          padding: EdgeInsets.all(12.0),
                          child: productname(fontsize: 26, productnametext: widget.data[0].name.toString(),),
                        ),Padding(
                          padding: EdgeInsets.all(12.0),
                          child: brandlogo(width: 40,height: 40, imagepath: widget.data[0].brandImage.toString(),),
                        )],),
                       Row(
                        mainAxisAlignment:MainAxisAlignment.spaceBetween,
                        children: [Padding(
                          padding: EdgeInsets.all(2.0),
                          child: price(fonntsize: 15, pricetext: 'EGP ${widget.data[0].variations![0].price.toString()}',),
                        ),Padding(
                          padding: EdgeInsets.all(12.0),
                          child: brandname(fonntsize: 28, brandnametext: widget.data[0].brandName.toString(),),
                        )],),
                      const SizedBox(height: 15,),
                      widget.hascolor?SizedBox(
                        width: size.width ,
                        height: size.height * 0.08,
                        child: Center(
                          child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: 1,
                              itemBuilder:(context, index) {
                                return  Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: GestureDetector(
                                      onTap: (){setState(() {
                                        selectedColor = index;
                                      });},
                                      child: Container(height: 25,width:25,decoration:BoxDecoration(
                                          boxShadow:  [
                                            BoxShadow(
                                              color: const Color(0xff303030).withOpacity(1),
                                              spreadRadius: 3,
                                              blurRadius: 5,
                                              offset: const Offset(0, 0),
                                            ),
                                          ],
                                          shape: BoxShape.circle,color:Color(widget.data[0].avaiableProperties![2].values![0].value.hashCode),
                                          border: Border.all(style: BorderStyle.solid,
                                              color: (selectedColor ==index)?Colors.white!:Colors.transparent
                                              ,width: 1)),)),
                                );
                              }),
                        ),
                      ):SizedBox(height: 2,),
                      widget.hassize?Column(children: [ const Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,
                        children: [Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Text('Select Size',style: TextStyle(fontSize: 18,fontFamily: 'mulish',color: Colors.white,fontWeight: FontWeight.bold),),
                        ),Padding(
                          padding: EdgeInsets.all(12.0),
                          child:Text('Size chart',style: TextStyle(fontSize: 18,fontFamily: 'mulish',color: Colors.white,fontWeight: FontWeight.bold),),
                        )],)
                        , SizedBox(
                          width: size.width ,
                          height: size.height * 0.07,
                          child: Center(
                            child: ListView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: widget.data[0].variations![0].productPropertiesValues.length,
                                itemBuilder:(context, index) {
                                  return  Padding(
                                    padding: const EdgeInsets.all(3.0),
                                    child: GestureDetector(
                                        onTap: (){setState(() {
                                          selectsize = index;
                                        });},
                                        child: Container(

                                          padding: const EdgeInsets.only(top: 12,right: 4,left: 4),
                                          child: Text('50x500',textAlign: TextAlign.center,style: TextStyle(color:(selectsize ==index)?const Color(
                                              0xff0c0c0c):const Color(
                                              0xffffffff),fontSize: 20,fontWeight: FontWeight.bold),),
                                          //width:75,
                                          decoration:BoxDecoration(
                                            borderRadius: BorderRadius.circular(15),
                                            shape: BoxShape.rectangle,
                                            color:(selectsize ==index)?const Color(
                                                0xffb7ed2e):const Color(
                                                0xff1d1d1f),
                                          ),)),
                                  );
                                }),
                          ),
                        ),],):SizedBox(height: 2,),
                      Padding(
                        padding:  EdgeInsets.only(top: 12.0,right: size.width*0.63),
                        child: const Text('Select material',
                          style: TextStyle(fontSize: 18,fontFamily: 'mulish',
                              color: Colors.white,fontWeight: FontWeight.bold),),
                      ),const SizedBox(height: 15,),
                      SizedBox(
                        width: size.width ,
                        height: size.height * 0.06,
                        child: Center(
                          child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: 3,
                              itemBuilder:(context, index) {
                                return  Padding(
                                  padding: const EdgeInsets.all(3.0),
                                  child: GestureDetector(
                                      onTap: (){setState(() {
                                        selectmaterial = index;
                                      });},
                                      child: Container(

                                        padding: const EdgeInsets.only(top: 12,right: 4,left: 4),
                                        child: Text('Silk Satin',textAlign: TextAlign.center,style: TextStyle(color:(selectmaterial ==index)?const Color(
                                            0xff0c0c0c):const Color(
                                            0xffffffff),fontSize: 20,fontWeight: FontWeight.bold),),
                                        //width:75,
                                        decoration:BoxDecoration(
                                          borderRadius: BorderRadius.circular(11),
                                          shape: BoxShape.rectangle,
                                          color:(selectmaterial ==index)?const Color(
                                              0xffb7ed2e):const Color(
                                              0xff1d1d1f),
                                        ),)),
                                );
                              }),
                        ),
                      ),
                      const SizedBox(height: 15,),
                      SizedBox(
                        width: size.width,
                        height: size.longestSide,
                        child: ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: 1,
                            itemBuilder:(context,index){
                              return  ExpansionPanelList(expansionCallback:(index,isopen){
                                setState(() {
                                  _isExpandedList[index] = !_isExpandedList[index];
                                  //print(widget.hascolorr);
                                });
                              },
                                children:
                                [ ExpansionPanel(
                                  isExpanded: _isExpandedList[0], // Set to true if you want it to be expanded initially
                                  backgroundColor: const Color(0xff303030),
                                  headerBuilder: (BuildContext context, bool isExpanded) {
                                    return  Text(
                                      'Description',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                      ),
                                    );
                                  },
                                  body: Container(
                                    //color: Colors.lightGreenAccent,
                                    child: Text(
                                      widget.data[0].description.toString(),
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ),
                                ],
                              );
                            }
                        ),
                      ),

                    ],
                  ) ,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}



  Widget cards(BuildContext context,Size size,String images) {
    return Center(
      child: Container(
        width: size.width * 0.6,
        height: size.height * 0.35,
        child: Column(
          children: [
            SizedBox(width: size.width * 0.6,
                height: size.height * 0.3,child: cardbody(context,size,images)),

          ],
        ),
      ),
    );
  }



  Widget cardbody(BuildContext context,Size size,String image) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      //width: size.width * 0.15,
      //height: size.height * 1,
      child: FittedBox(
        fit: BoxFit.contain,
        child: Image.network(image),
      ),
    );
  }


