import 'package:book_store/Core/utils/Constants.dart';
import 'package:book_store/Core/utils/app_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashScreenBody extends StatefulWidget {
  const SplashScreenBody({super.key});


  @override
  State<SplashScreenBody> createState() => _SplashScreenBodyState();
}

class _SplashScreenBodyState extends State<SplashScreenBody> with SingleTickerProviderStateMixin {

  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;

  @override
  void initState(){
    super.initState();
    initSlidingAnimation();
    navigateToHome();
  }


  @override
  void dispose(){
    super.dispose();
    animationController.dispose();
    /// to stop the controller because if we don't do this the controller will still open with waste resources
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(AssetData.logo,),
          const SizedBox(height: 5,),
          buildAnimatedBuilder()
        ],
      ),
    );
  }

  AnimatedBuilder buildAnimatedBuilder() {
    return AnimatedBuilder(
          animation: slidingAnimation,
          builder: (context,_) {
            return SlideTransition(
              position: slidingAnimation,
              child: const Text("read free books ",
              textAlign: TextAlign.center,
              ),
            );
          }
        );
  }

  void initSlidingAnimation() {

    animationController=AnimationController(vsync: this, duration: const Duration(seconds: 2));
    slidingAnimation= Tween<Offset>(
        begin:const Offset(0, 10),
        end: Offset.zero).animate(animationController);
    animationController.forward();
  }

  void navigateToHome() {

    Future.delayed(const Duration(seconds:4 ),(){
      GoRouter.of(context).push(AppRouter.homePath);
      // Get.to( HomeView(),transition: Transition.fade,duration:Constants.kAppTransition);
    });
  }
}
