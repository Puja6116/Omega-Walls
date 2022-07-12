import 'dart:ui';

import 'package:blur/blur.dart';
import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:omega_walls/app/data/Colors/app_colors.dart';
import 'package:omega_walls/app/routes/app_pages.dart';

import '../controllers/welcome_controller.dart';

class WelcomeView extends GetView<WelcomeController> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
          backgroundColor: AppColors.scaffoldColor,
          key: controller.fKey,
          drawer: openDrawer(height),
          appBar: AppBar(
            backgroundColor: AppColors.appBarColor,
            title: Text('Omega Walls',
                style: GoogleFonts.vesperLibre(
                    fontSize: 30, fontWeight: FontWeight.w600)),
            centerTitle: true,
          ),
          body: Padding(
            padding: const EdgeInsets.all(15.0),
            child: ListView(scrollDirection: Axis.vertical, children: [
              photoList(
                  assets: 'assets/images/superheros.jpg',
                  title: "Superheros",
                  height: height,
                  width: width,
                  routes: Routes.SUPERHERO_WALLS),
              SizedBox(height: height / 30),
              photoList(
                  assets: 'assets/images/dark.jpg',
                  title: "Dark",
                  height: height,
                  width: width,
                  routes: Routes.DARK_WALLS),
              SizedBox(height: height / 30),
              photoList(
                  assets: 'assets/images/nature.jpeg',
                  title: "Nature",
                  height: height,
                  width: width,
                  routes: Routes.NATURE_WALLS),
              SizedBox(height: height / 30),
              photoList(
                  assets: 'assets/images/cat.webp',
                  title: "Animals",
                  height: height,
                  width: width,
                  routes: Routes.ANIMAL_WALLS),
            ]),
          )),
    );
  }

  Drawer openDrawer(double height) {
    return Drawer(
      backgroundColor: AppColors.appBarColor,
      child: Stack(alignment: Alignment.topRight, children: [
        ListView(children: [
          DrawerHeader(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                CircleAvatar(
                    radius: 40,
                    backgroundImage:
                        Image.asset('assets/images/darkseid.jpg').image),
                SizedBox(
                  height: height / 200,
                ),
                Text(
                  "Omega Walls",
                  style: GoogleFonts.patuaOne(
                      color: Color(0xFFDFDFDF), fontSize: 25),
                ),
              ],
            ),
            decoration: BoxDecoration(color: AppColors.drawerColor),
          ),
          // UserAccountsDrawerHeader(
          //   currentAccountPicture: CircleAvatar(
          //       radius: 40, child: Image.asset('assets/images/darkseid.jpg')),
          //   accountName: Text("Omega Walls"),
          //   accountEmail: Text("wasikahamed7@gmail.com"),
          // ),
        ]),
        Positioned(
            child: IconButton(
                onPressed: () => Get.back(),
                icon: FaIcon(
                  FontAwesomeIcons.x,
                  color: Colors.white,
                )))
      ]),
    );
  }

  GestureDetector photoList(
      {required String assets,
      required String title,
      required double height,
      required double width,
      required var routes}) {
    return GestureDetector(
      onTap: () => Get.toNamed(routes),
      child: Stack(alignment: Alignment.center, children: [
        Blur(
          blur: 1.5,
          colorOpacity: 0.05,
          borderRadius: BorderRadius.circular(20),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              assets,
              height: height / 4,
              width: width / 1.1,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
            child: Text(
          title,
          style: GoogleFonts.italianno(
              color: Colors.white, fontSize: 80, fontWeight: FontWeight.w900),
        ))
      ]),
    );
  }
}
