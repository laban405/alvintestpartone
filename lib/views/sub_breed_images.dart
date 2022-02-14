import 'package:alvintestpartone/constants/controllers.dart';
import 'package:alvintestpartone/utils/http_requests.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:skeletons/skeletons.dart';

class SubBreedImages extends StatefulWidget {
  const SubBreedImages({Key? key}) : super(key: key);

  @override
  State<SubBreedImages> createState() => _SubBreedImagesState();
}

class _SubBreedImagesState extends State<SubBreedImages> {
  final HttpService httpService = HttpService();
  var data = Get.arguments;

  @override
  void initState() {
    print('$data');
    // if (breed['subBreeds'].length > 0) {
    dogsListController.fetchSubBreedImages(
        data['breed'], data['subBreed']['name']);
    // }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            '${data['subBreed']['name']}',
            style: TextStyle(color: Theme.of(context).primaryColor),
          ),
        ),
        body: Obx(() {
          return images();
        }));
  }

  Widget images() {
    final _mediaQuery = MediaQuery.of(context).size;
    return !dogsListController.isSubBreedLoading.value
        ? Container(
            height: _mediaQuery.height,
            width: _mediaQuery.width,
            child: ListView.separated(
                separatorBuilder: (BuildContext context, int index) => SizedBox(
                      height: 1.0.h,
                    ),
                padding: EdgeInsets.fromLTRB(2.0.w, 2.0.w, 2.0.w, 2.0.w),
                shrinkWrap: true,
                itemCount: dogsListController.subBreedImagesList.length,
                itemBuilder: (BuildContext context, int index) {
                  return imageItem(index);
                }),
          )
        : const Center(
            child: CircularProgressIndicator(),
          );
  }

  Widget imageItem(index) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(1.0.w)),
              child: Image.network(
                "${dogsListController.subBreedImagesList[index]}",
                fit: BoxFit.cover,
                height: 40.0.h,
                width: double.infinity,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;

                  return SkeletonAvatar(
                    style: SkeletonAvatarStyle(
                        shape: BoxShape.rectangle,
                      height: 40.0.h,
                      width: double.infinity,),
                  );
                },
                errorBuilder: (context, error, stackTrace) => Center(
                    child: SizedBox(
                      height: 40.0.h,
                      width: double.infinity,
                      child: Text(
                  '!!',
                  style: TextStyle(color: Theme.of(context).colorScheme.error),
                ),
                    )),
              )),
        ],
      ),
    );
  }
}
