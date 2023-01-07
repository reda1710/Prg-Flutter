import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:projet1/pages/food/popular_food_details.dart';
import 'package:projet1/widget/big_text.dart';
import 'package:projet1/widget/icon_and_text_widget.dart';
import 'package:projet1/widget/small_text.dart';

import '../../utils/colors.dart';
import '../food/recommanded_food_detail.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({Key? key}) : super(key: key);

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var _currPageValue=0.0;
  double _scaleFactor=0.8;
  double _height=220;
  @override
  void initState(){
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currPageValue= pageController.page!;

      });
    });
  }
  @override
  void dispose(){
    pageController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //slider section
        Container(
          //color:Colors.redAccent,
          height: 320,
          child: GestureDetector(
            onTap: (){
              Get.to(()=>const PopularFoodDetails());
            },
            child: PageView.builder(
                controller: pageController,
                itemCount: 4,
                itemBuilder: (context, position){
                  return _buildPageItem(position);
                }),
          ),
        ),
    //dots
    new DotsIndicator(
    dotsCount: 4,
    position: _currPageValue,
    decorator: DotsDecorator(
      activeColor: AppColors.mainColor,
    size: const Size.square(9.0),
    activeSize: const Size(18.0, 9.0),
    activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
    ),
    ),
        //Popular text
        SizedBox(height: 20,),
        Container(
          margin: EdgeInsets.only(left: 30),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              BigText (text: "Popular"),
              SizedBox(width: 10,),
              Container(
                margin: const EdgeInsets.only(bottom: 3,),
                child: BigText(text:".",color: Colors.black26,) ,
              ),
              SizedBox(width: 10,),
              Container(
                child: SmallText(text: "Food pairing",),
              ),
            ],
          ),
        ),
        //liste of food and images
        GestureDetector(
          onTap: (){
            Get.to(()=>const RecommandedFoodDetail());
          },
          child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 10,
              itemBuilder: (context, index){
                return Container(
                  margin: EdgeInsets.only(top:10,left: 20, right: 20),
                  child: Row(
                    children: [
                      //image section
                      Container(
                        width:120,
                        height: 120,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white38,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(
                                  "assets/image/food1.jpg"
                              ),
                            )
                        ),
                      ),
                      //text Container
                      Expanded(
                        child: Container(
                          height: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                            ),
                            color: Colors.white,
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(left: 10,right: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                BigText(text: "Nutritious fruit meal in china"),
                                SizedBox(height: 10,),
                                SmallText(text: "With chiness characteristics"),
                                SizedBox(height: 10,),

                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    IconAndTextWidget(icon: Icons.circle_sharp,
                                      text: "Normal",
                                      iconColor: AppColors.iconColor1,
                                    ),
                                    IconAndTextWidget(icon: Icons.location_on,
                                      text: "1.7km",
                                      iconColor: AppColors.mainColor,
                                    ),
                                    IconAndTextWidget(icon: Icons.access_time_rounded,
                                      text: "32min",
                                      iconColor: AppColors.iconColor2,
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),

                      ),
                    ],
                  ),

                );

              }),
        ),
      ],
    );
  }
  Widget _buildPageItem(int index){
    Matrix4 matrix= new Matrix4.identity();
    if(index==_currPageValue.floor()){
      var currScale= 1-(_currPageValue-index)*(1+_scaleFactor);
      var currTrans = _height*(1-currScale)/2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0,currTrans , 0);
    }
    else if(index ==_currPageValue.floor()+1){
      var currScale = _scaleFactor+(_currPageValue-index+1)*(1-_scaleFactor);
      var currTrans = _height*(1-currScale)/2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0,currTrans , 0);

    }
    else if(index ==_currPageValue.floor()-1){
      var currScale= 1-(_currPageValue-index)*(1-_scaleFactor);
      var currTrans = _height*(1-currScale)/2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0,currTrans , 0);

    }
    else{
      var currScale=0.8;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0,_height*(1-currScale)/2 , 0);
    }

    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          Container(
              height: 220,
              margin: EdgeInsets.only(left: 10,right: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: index.isEven?Color(0xFF69c5df):Color(0xFF9294cc),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                        "assets/image/food1.jpg"
                    )
                ),
              )
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
                height: 120,
                margin: EdgeInsets.only(left: 30,right: 30,bottom: 30),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFFe8e8e8),
                      blurRadius: 5.0,
                      offset: Offset(0,5),
                    )
                  ],
                ),
              child: Container(
                padding: EdgeInsets.only(top: 15,left: 15,right: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BigText(text: "Chinsese Side"),
                    SizedBox(height: 10,),
                    Row(
                      children: [
                        Wrap(
                          children: List.generate(5, (index) => Icon(Icons.star,color: AppColors.mainColor, size:15 ,) ),
                        ),
                        SizedBox(width: 10,),
                        SmallText(text: "4.5"),
                        SizedBox(width: 10,),
                        SmallText(text: "1287"),
                        SizedBox(width: 10,),
                        SmallText(text: "comments"),


                      ],
                    ),
                    SizedBox(height :20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconAndTextWidget(icon: Icons.circle_sharp,
                        text: "Normal",
                          iconColor: AppColors.iconColor1,
                        ),
                        IconAndTextWidget(icon: Icons.location_on,
                          text: "1.7km",
                          iconColor: AppColors.mainColor,
                        ),
                        IconAndTextWidget(icon: Icons.access_time_rounded,
                          text: "32min",
                          iconColor: AppColors.iconColor2,
                        )
                      ],
                    )
                  ],
                ),
              ),

            ),
          ),
        ],
      ),
    );
  }
}
