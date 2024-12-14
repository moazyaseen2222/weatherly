import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constant/app_links.dart';
import '../../constant/app_text_styles.dart';
import '../../constant/spaces.dart';
import '../widgets/bn_widgets/build_contact_card.dart';

class AboutTheDeveloper extends StatelessWidget {
  const AboutTheDeveloper({super.key});

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About The Developer'),
      ),
      body:Column(
          children: [
             verticalSpace(30),
            const Icon(Icons.person,size: 50,),
            verticalSpace(10),

            Center(child: Text('Moaz Yaseen',style: AppTextStyles.font16SemiBoldBlack,)),
             verticalSpace(10),

              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 20.w),
                child: Text('Software Engineer Specialized in Mobile Application Development for Android & Ios.',
                style: AppTextStyles.font14RegularBlack,
                textAlign: TextAlign.center,),
              ),

              verticalSpace(10),

      BuildContactCard(title: 'Gmail', imagePath: 'images/gmail.png',url: AppLinks.gmailUrl, ),
      BuildContactCard(title: 'GitHub', imagePath: 'images/github.png', url: AppLinks.gitHubUrl, ),
      BuildContactCard(title: 'LinkedIn', imagePath: 'images/linkedin.png', url: AppLinks.linkedinUrl, ),
      BuildContactCard(title: 'WhatsApp', imagePath: 'images/whatsapp.png', url: AppLinks.whatsAppUrl,),

            
          ],
          
        ),
    );
  }
}

