import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:projet1/pages/home/main_food_page.dart';
import 'package:projet1/widget/app_icon.dart';

import '../../utils/colors.dart';
import '../../utils/dimansions.dart';
import '../../widget/Small_text.dart';
import '../../widget/big_text.dart';
import '../../widget/expandable_test_widget.dart';
import '../../widget/icon_and_text_widget.dart';

class PopularFoodDetails extends StatelessWidget {
  const PopularFoodDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          //background image
          Positioned(
              child: Container(
                width: double.maxFinite ,
                height: 400,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      "assets/image/food1.jpg"
                    ),
                  ),
                ),
              ),
          ),
          //icon widget
          Positioned(
              top: 45,
              left: 20,
              right: 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:[
                  GestureDetector(
                    onTap: (){
                      Get.to(()=>const MainFoodPage());
                    },
                      child:
                      AppIcon(icon: Icons.arrow_back_ios,)),
                  AppIcon(icon: Icons.add_shopping_cart_outlined,),

                ],

          )),
          //introduction of food
          Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              top:280 ,

              child: Container(

                padding: EdgeInsets.only(left: 20,right: 20,top: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20),
                  ),
                    color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        BigText(text: "Chines Side",size:26,),
                        SizedBox(height: 10,),
                        //comments section
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
                        SizedBox(height: 10,),
                        //time and distance
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
                    SizedBox(height: 20,),
                    BigText(text:"Introduce"),
                    SizedBox(height: 10,),
                    Expanded(
                      child: SingleChildScrollView(
                        child: ExpandableTextWidget(text: "Tout le monde veut devenir en bonne sant?? dans sa vie. Pour devenir en bonne sant??, nous devons manger de la bonne nourriture. Et c???est ce que nous devons tous acqu??rir une habitude alimentaire de qualit??. Votre nourriture peut changer votre sant?? dans un certain temps. Manger des aliments gras vous aidera ?? prendre du poids. Mais si vous continuez ?? les manger, vous serez en surpoids. Et ??tre en surpoids n???est pas une bonne chose souvent. Nous voyons beaucoup de gens travailler tr??s dur pour perdre du poids. La restauration rapide ou la malbouffe est risqu??e pour notre sant??. En raison de ces aliments, vous gagnerez trop de graisse sur votre corps et cela fera de vous une personne paresseuse. C???est pourquoi nous devons rester ?? l?????cart de ce type de nourriture. Essayez de manger avec votre famille ?? la table ?? manger. Fixez une heure de repas et essayez de manger r??guli??rement ?? ce moment-l??. Gardez les aliments faibles en gras sur votre liste. Les habitudes alimentaires sont tr??s importantes pour une bonne sant??. Si vous voulez devenir en bonne sant??, vous devez prendre conscience de ce que vous mangez. Il existe diff??rents types d???aliments disponibles. Vous devez manger des aliments sains et ??viter la malbouffe. Avant de faire un horaire ou un menu alimentaire, nous devons prendre les suggestions du m??decin. Les l??gumes sont une bonne option comme nourriture. Nous devons mettre beaucoup de l??gumes dans nos habitudes alimentaires. Pour gagner plus d?????nergie, nous devons aussi manger du poisson et de la viande. Mais manger trop de viande peut stocker trop de graisse dans notre corps. La graisse est risqu??e pour notre corps. Il augmente le risque de pression art??rielle et m??me les gens pourraient faire une crise cardiaque et un accident vasculaire c??r??bral en raison de trop de graisse sur le corps. Y compris les l??gumes, les fruits ont ??galement une ??norme quantit?? de ressources qui nous aident ?? ??tre en bonne sant??. Les habitudes alimentaires peuvent jouer un r??le ??norme dans notre vie quotidienne. Si notre nourriture n???est pas bonne, nous pouvons tomber malades. Il est important pour tout le monde de maintenir une saine habitude alimentaire. Les m??decins nous sugg??rent de manger beaucoup d???aliments sans gras. Surtout, nous devons rester ?? l?????cart de la malbouffe ou de la restauration rapide." ),
                      ),
                    ),
                    




                  ],

                ),
          )
    ),
          Positioned(

              child: Column(
                children: const [

                ],
              )),


        ],
      ),
      bottomNavigationBar: Container(
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
              child: Row(
                children: [
                  Icon(Icons.remove,color: AppColors.signColor,),
                  SizedBox(width: 5,),
                  BigText(text: "0"),
                  SizedBox(width: 5,),
                  Icon(Icons.add,color: AppColors.signColor,),
                ],
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
    );
  }
}
