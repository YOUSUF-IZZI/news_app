import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/features/news_page/presentation_layer/widgets/theme_mode_switch.dart';
import 'package:url_launcher/url_launcher.dart';


class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key,});

  void launchWebUrl(Uri url) async{
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.inAppWebView);
    }  else {
      throw 'Could not launch $url';
    }
  }
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        //crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DrawerHeader(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(90),
              child: Image.asset('assets/images/app_icon.png'),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: ListTile(
              leading: Icon(CupertinoIcons.moon_stars, size: 24.sp, color: Theme.of(context).iconTheme.color,),
              title: const Text('Dark Mode'),
              trailing: const ThemeModeSwitcher(),
            ),
          ),
          ListTile(
            leading: Icon(CupertinoIcons.link, size: 24.sp, color: Theme.of(context).iconTheme.color,),
            title: const Text('Contact us'),
            trailing: MaterialButton(
              onPressed: (){
                launchUrl(Uri.parse('https://linktr.ee/Yousif_Ezzi'));
              },
              child: const Text('Click', style: TextStyle(color: Colors.blueAccent, decoration: TextDecoration.underline), ),
            ),
          ),
          const Spacer(flex: 1,),
          Text('QueueTeam', style: TextStyle(fontSize: 24.sp),),
          const SizedBox(height: 20,)
        ],
      ),
    );
  }
}