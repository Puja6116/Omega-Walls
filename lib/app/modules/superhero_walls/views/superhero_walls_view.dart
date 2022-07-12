import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:omega_walls/app/data/Colors/app_colors.dart';
import 'package:omega_walls/app/data/Model/firebase_model.dart';
import 'package:omega_walls/app/views/views/photo_details_view.dart';

import '../controllers/superhero_walls_controller.dart';

class SuperheroWallsView extends GetView<SuperheroWallsController> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(drawer: Drawer(),key: controller.fshKey,
        backgroundColor: AppColors.scaffoldColor,
        appBar: AppBar(
          backgroundColor: AppColors.appBarColor,
          title: const Text('Superhero Walls'),
          centerTitle: true,
        ),
        body: FutureBuilder<List<FirebaseModel>>(
          future: controller.futureFiles,
          builder: (context, snapshot) {
            try {
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return const Center(child: CircularProgressIndicator());
                case ConnectionState.none:
                  return const Center(
                    child: Text(
                      "Something wrong",
                      style: TextStyle(color: Colors.white),
                    ),
                  );

                default:
                  final file = snapshot.data!;
                  if (snapshot.hasError) {
                    return const Center(
                      child: Text("Something went wrong"),
                    );
                  } else {
                    return GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              childAspectRatio: 1 / 1.6,
                              crossAxisCount: 2,
                              mainAxisSpacing: 15,
                              crossAxisSpacing: 15),
                      itemCount: file.length,
                      itemBuilder: (context, index) {
                        final files = file[index];

                        return Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: GestureDetector(onTap: ()=>Get.to(PhotoDetailsView(files: files, index: index,)),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: GridTile(
                                footer: GridTileBar(
                                  leading: IconButton(
                                      tooltip: 'Set wallpaper',
                                      onPressed: () => null,
                                      icon: const Icon(Icons.wallpaper)),
                                  trailing: IconButton(
                                    onPressed: () => controller.downloadPhoto(files.ref!, index),
                                    tooltip: 'Download wallpaper',
                                    icon: Icon(Icons.download),
                                  ),
                                  title: Text(files.name!),
                                  backgroundColor: Colors.black.withOpacity(0.4),
                                ),
                                child: Hero(tag: index,
                                  child: CachedNetworkImage(
                                    imageUrl: files.url!.toString(),
                                    fit: BoxFit.cover,
                                    // height: height / 5,
                                    // width: width / 5,
                                    placeholder: (context, url) => const Center(
                                      child: CircularProgressIndicator(),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }
              }
            } catch (e) {
              print(e.toString());
            }
            return const Text(" ");
          },
        ));
  }
}
