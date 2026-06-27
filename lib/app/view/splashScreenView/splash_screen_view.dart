import 'package:box_keeper_app/app/res/app_assets.dart';
import 'package:box_keeper_app/app/res/app_fonts.dart';
import 'package:box_keeper_app/app/res/app_text_styles.dart';
import 'package:box_keeper_app/app/view/homeScreenView/home_screen_view.dart';
import 'package:flutter/material.dart';

class SplashScreenView extends StatefulWidget {
  const SplashScreenView({super.key});

  @override
  State<SplashScreenView> createState() => _SplashScreenViewState();
}

class _SplashScreenViewState extends State<SplashScreenView> {
  @override
  void initState() {
    super.initState();
    startApp();
  }

  Future<void> startApp() async {
    await Future.delayed(const Duration(seconds: 2));

    if (!mounted) return;

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const HomeScreenView()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xff5B5CEB), Color(0xff7A5AF8)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          children: [
            const Spacer(),

            // Logo Card
            Container(
              height: 140,
              width: 140,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(.15),
                    blurRadius: 30,
                    offset: const Offset(0, 12),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(25),
                child: Image.asset(
                  AppAssets.box,
                  color: const Color(0xff5B5CEB),
                ),
              ),
            ),

            const SizedBox(height: 35),

            Text(
              "Box Keeper",
              style: AppTextStyles.customText(
                fontfamily: AppFonts.lukiestGuy,
                fontSize: 35,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 5),

            Text(
              "Organize • Store • Track",
              style: AppTextStyles.customText(
                fontfamily: AppFonts.patuaOne,
                fontSize: 16,
                color: Colors.white70,
              ),
            ),

            const Spacer(),

            const SizedBox(
              width: 28,
              height: 28,
              child: CircularProgressIndicator(
                strokeWidth: 3,
                valueColor: AlwaysStoppedAnimation(Colors.white),
              ),
            ),

            const SizedBox(height: 30),

            Column(
              children: [
                Text(
                  "Version 1.0.0",
                  style: AppTextStyles.customText(
                    color: Colors.white60,
                    fontSize: 13,
                  ),
                ),

                const SizedBox(height: 8),

                RichText(
                  text: TextSpan(
                    style: AppTextStyles.customText(
                      color: Colors.white70,
                      fontSize: 13,
                    ),
                    children: [
                      TextSpan(text: "Crafted  with "),
                      TextSpan(text: "❤️"),
                      TextSpan(text: " by "),
                      TextSpan(
                        text: "Usama Basharat",
                        style: AppTextStyles.customText(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontfamily: AppFonts.patuaOne,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 30),
              ],
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
