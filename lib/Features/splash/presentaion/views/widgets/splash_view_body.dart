import 'package:booklyapp/Features/splash/presentaion/views/widgets/sliding_text.dart';
import 'package:booklyapp/core/utils/app_router.dart';
import 'package:booklyapp/core/utils/assets_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimaton;
  @override
  void initState() {
    super.initState();
    initSlidingAnimation();
    nivagateToHome();
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(AssetsData.logo),
        const SizedBox(
          height: 5,
        ),
        SlidingText(slidingAnimaton: slidingAnimaton),
      ],
    );
  }

  void nivagateToHome() {
    Future.delayed(
      const Duration(seconds: 2),
      () {
        // Get.to(
        //   () => const HomeView(),
        //   transition: Transition.fade,
        //   duration: kTransitionDuration,
        // );
        GoRouter.of(context).push(AppRouter.kHomeView);
      },
    );
  }

  void initSlidingAnimation() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    slidingAnimaton = Tween<Offset>(begin: const Offset(0, 3), end: Offset.zero)
        .animate(animationController);
    animationController.forward();
  }
}
