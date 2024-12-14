import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';


import '../../constant/app_links.dart';
import '../../constant/app_text_styles.dart';
import '../../constant/spaces.dart';
import 'about_the_developer.dart';

class AboutTheApp extends StatelessWidget {
  const AboutTheApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About The App'),

      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(

          children: [
             verticalSpace(30),
            const Icon(Icons.description_rounded,size: 40,),
            verticalSpace(30),

            Center(child: Text('Weather Wave',style: AppTextStyles.font16SemiBoldBlack,)),
             verticalSpace(10),
              RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
         TextSpan(
           text: 'Weather Wave is Mobile application to get the latest weather info about any country in the world,\n You can save your favorites places to get there weather faster, with simple user interface and simple to use, this app will get your requirments.\n\n Weather Data Source From:\n',
        style: AppTextStyles.font16SemiRegulareBlack.copyWith(),
         ),
         TextSpan(
           text: '\nOpen Weather Map\n',
        style: AppTextStyles.font16SemiRegulareBlack.copyWith(color: Colors.blue),
        recognizer: TapGestureRecognizer()
        ..onTap = ()
         =>   launchUrl(AppLinks.openweathermap),

         ),
         TextSpan(
           text: '\nAny Notes, Contact me by:\n',
        style: AppTextStyles.font16SemiRegulareBlack,
        recognizer: TapGestureRecognizer()
        ..onTap = ()
         => Get.to(const AboutTheDeveloper())

         ),
         TextSpan(
           text: '\nAbout The Developer',
        style: AppTextStyles.font16SemiRegulareBlack.copyWith(color: Colors.blue),
        recognizer: TapGestureRecognizer()
        ..onTap = ()
         => Get.to(const AboutTheDeveloper())

         ),
        ]
      ),
      
      ),

          
            
          ],
          
        ),
      ),
    );
  }
}