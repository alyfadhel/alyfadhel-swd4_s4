import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:swd4_s4/core/shared/network/local/cache_helper.dart';
import 'package:swd4_s4/core/shared/widgets/my_txt_button.dart';
import 'package:swd4_s4/features/shop/on_boarding/data/on_boarding_model.dart';
import 'package:swd4_s4/features/shop/on_boarding/presentatio/widgets/build_on_boarding_item.dart';
import 'package:swd4_s4/features/shop/users/login/presntation/screens/shop_login_screen.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

var controller = PageController();
bool isLast = false;
void onSubmit(context)
{
  CacheHelper.setData(key: 'onBoarding', value: true)
      .then((value){
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => ShopLoginScreen()),
    );
  });
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          MyTxtButton(
            onPressed: ()
            {
              onSubmit(context);
            },
            text: 'SKIP',
            style: Theme.of(
              context,
            ).textTheme.titleLarge!.copyWith(color: Colors.blue),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                physics: BouncingScrollPhysics(),
                controller: controller,
                onPageChanged: (index)
                {
                  if(index == boarding.length -1){
                    setState(() {
                      isLast = true;
                      print(isLast);
                    });
                  }else{
                    setState(() {
                      isLast = false;
                      print(isLast);
                    });
                  }
                },
                itemBuilder:
                    (context, index) =>
                        BuildOnBoardingItem(model: boarding[index]),
                itemCount: boarding.length,
              ),
            ),
            SizedBox(height: 20.0),
            Row(
              children: [
                SmoothPageIndicator(
                  controller: controller,
                  count: boarding.length,
                  axisDirection: Axis.horizontal,
                  effect: ExpandingDotsEffect(
                    dotWidth: 10.0,
                    dotHeight: 10.0,
                    spacing: 4.0,
                    dotColor: Colors.grey,
                    activeDotColor: Colors.blue,
                    expansionFactor: 1.01,
                  ),
                ),
                Spacer(),
                FloatingActionButton(
                  onPressed: () {
                    if(isLast){
                      onSubmit(context);
                    }
                    controller.nextPage(
                      duration: Duration(milliseconds: 750),
                      curve: Curves.fastEaseInToSlowEaseOut,
                    );
                  },
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: Icon(Icons.arrow_forward_ios, color: Colors.white),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
