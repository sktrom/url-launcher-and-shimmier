import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:url_lanch_and_shimmer_app/app_router.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void uriLauncher(Uri uri, bool insideMyApp) async {
    try {
      if (await canLaunchUrl(uri)) {
        if (insideMyApp) {
          // open uri inside my app
          await launchUrl(uri, mode: LaunchMode.inAppWebView);
          log('in the app web : $insideMyApp');
        } else {
          // open uri in the orginal app like =>phone.
          await launchUrl(uri, mode: LaunchMode.externalApplication);
          log('in the external application : $insideMyApp');
        }
      }
    } catch (e) {
      log(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('URL Launcher'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  uriLauncher(Uri.parse("https://www.google.com"), false);
                },
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  width: MediaQuery.sizeOf(context).width,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.blue,
                  ),
                  child: const Center(
                    child: Text(
                      'Open url in Browser',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              InkWell(
                onTap: () {
                  uriLauncher(Uri.parse("https://www.google.com"), true);
                },
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  width: MediaQuery.sizeOf(context).width,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.indigo,
                  ),
                  child: const Center(
                    child: Text(
                      'Open url in App',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              InkWell(
                onTap: () {
                  uriLauncher(Uri.parse("tel:0988486104"), false);
                },
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  width: MediaQuery.sizeOf(context).width,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.green,
                  ),
                  child: const Center(
                    child: Text(
                      'Call phone number',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              InkWell(
                onTap: () {
                  uriLauncher(Uri.parse("mailto:sad@gmail.com"), false);
                },
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  width: MediaQuery.sizeOf(context).width,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.amber,
                  ),
                  child: const Center(
                    child: Text(
                      'Send Email',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              InkWell(
                onTap: () {
                  uriLauncher(
                      Uri.parse("https://www.youtube.com/watch?v=QOPqSxJajNc"),
                      false);
                },
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  width: MediaQuery.sizeOf(context).width,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.redAccent,
                  ),
                  child: const Center(
                    child: Text(
                      'Open youtupe video',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  GoRouter.of(context).push(AppRouter.kshimmerView);
                },
                child: const Text('Go to page of Shimmer'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
