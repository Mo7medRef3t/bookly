import 'dart:async';
import 'package:bookly/core/utils/app_router.dart';
import 'package:bookly/core/utils/assets.dart';
import 'package:bookly/core/widgets/space_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashBody extends StatefulWidget {
  const SplashBody({super.key});

  @override
  State<SplashBody> createState() => _SplashBodyState();
}

class _SplashBodyState extends State<SplashBody>
    with SingleTickerProviderStateMixin {
  double opacity = 0;
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;

  @override
  void initState() {
    super.initState();

    initSlidingAnimation();
    timerToOpacity();
    goHomePage();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        AnimatedOpacity(
          opacity: opacity,
          duration: const Duration(seconds: 2),
          child: Image.asset(AssetsData.logo),
        ),
        const VerticalSpace(1),
        SlideTransition(
          position: slidingAnimation,
          child: const Text(
            "Read Free Books",
            style: TextStyle(fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        )
      ],
    );
  }

  void initSlidingAnimation() {
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));

    slidingAnimation =
        Tween<Offset>(begin: const Offset(-1, 12), end: const Offset(0, 0))
            .animate(animationController);

    animationController.forward();
  }

  void timerToOpacity() {
    Timer(const Duration(seconds: 1), () {
      setState(() {
        opacity = 1;
      });
    });
  }

  void goHomePage() {
    Future.delayed(const Duration(seconds: 3), () {
      // ignore: use_build_context_synchronously
      GoRouter.of(context).push(AppRouter.kHomeView);
      
      // Get.to(() => const HomeView(), transition: Transition.fadeIn);
    });
  }
}
