import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:projet1/utils/colors.dart';
import 'package:projet1/utils/dimansions.dart';
import 'package:projet1/widget/app_icon.dart';
import 'package:projet1/widget/big_text.dart';
import 'package:projet1/widget/expandable_test_widget.dart';

import '../home/main_food_page.dart';

class RecommandedFoodDetail extends StatelessWidget {
  const RecommandedFoodDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            toolbarHeight: 70,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                onTap: (){
                 Get.to(()=>const MainFoodPage());
                    },
                  child:Text('')),
                AppIcon(icon: Icons.shopping_cart_outlined),

              ],
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(20),
              child: Container(
                child: Center(child: BigText(size:26,text: "Chinese Side"),),
                width: double.maxFinite,
                padding: EdgeInsets.only(top:5,bottom: 10,),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)
                  )
                ),
              ),
              
            ),
            snap: false,
            pinned: true,
            floating: true,
            backgroundColor: AppColors.iconColor2,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                "assets/image/food1.jpg",
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),

            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                  child: ExpandableTextWidget(text:"Les habitudes alimentaires sont très importantes pour une bonne santé. Si vous voulez devenir en bonne santé, vous devez prendre conscience de ce que vous mangez. Il existe différents types d’aliments disponibles. Vous devez manger des aliments sains et éviter la malbouffe. Avant de faire un horaire ou un menu alimentaire, nous devons prendre les suggestions du médecin. Les légumes sont une bonne option comme nourriture. Nous devons mettre beaucoup de légumes dans nos habitudes alimentaires. Pour gagner plus d’énergie, nous devons aussi manger du poisson et de la viande. Mais manger trop de viande peut stocker trop de graisse dans notre corps.",),
                  margin: EdgeInsets.only(left: 20,right: 20),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.only(
              left: 20*2.5,
              right: 20*2.5,
              top:10,
              bottom: 10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(
                    iconSize:24,
                    iconColor:Colors.white
                    ,backgroundColor:AppColors.mainColor,
                    icon: Icons.remove),
                BigText(text: "\$12.88"+" "+"X"+" "+"0",color:AppColors.mainBlackColor,size:26,),

                AppIcon(iconSize:24,
                    iconColor:Colors.white,
                    backgroundColor:AppColors.mainColor,
                    icon: Icons.add),
              ],
            ),
          ),
          Container(
            height: 120,
            padding: EdgeInsets.only(top: 30,bottom: 30, left: 20,right: 20),
            decoration: BoxDecoration(
                color: AppColors.buttonBackgroundColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20*2),
                  topRight: Radius.circular(20*2),

                )
            ),

            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.only(top: 20,bottom: 20,left: 20,right: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),

                  child:Icon(
                    Icons.favorite,
                    color: AppColors.mainColor,
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 20,bottom: 20,left: 20,right: 20),
                  child: BigText(text: "\$10 | Add to cart",color: Colors.white,),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppColors.mainColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
