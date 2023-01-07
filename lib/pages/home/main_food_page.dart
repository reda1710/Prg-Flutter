import 'package:flutter/material.dart';
import 'package:projet1/pages/home/food_page_body.dart';
import 'package:projet1/utils/colors.dart';
import 'package:projet1/widget/big_text.dart';
import 'package:projet1/widget/Small_text.dart';


class MainFoodPage extends StatefulWidget {
  const MainFoodPage({Key? key}) : super(key: key);

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends  State<MainFoodPage>  {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(

            child: Container(
              margin: EdgeInsets.only(top: 45, bottom: 15) ,
              padding: EdgeInsets.only(left: 20,right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      BigText(text: "Morocco",color: AppColors.mainColor,),
                      Row(
                        children: [
                          SmallText(text: "Agadir", color: Colors.black54),
                          Icon(Icons.arrow_drop_down_rounded)
                          
                        ],
                      )
                     ],
                  ),
                  Center(
                    child: Container(
                      width: 45,
                      height: 45,
                      child: Icon(Icons.search , color: Colors.white,size: 24,),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: AppColors.mainColor,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(child: SingleChildScrollView(
            child: FoodPageBody(),
          )),
        ],
      ) ,
    );
  }
}
