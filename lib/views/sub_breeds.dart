import 'package:alvintestpartone/constants/controllers.dart';
import 'package:alvintestpartone/utils/http_requests.dart';
import 'package:alvintestpartone/views/sub_breed_images.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:skeletons/skeletons.dart';

class SubBreeds extends StatefulWidget {
  const SubBreeds({Key? key}) : super(key: key);

  @override
  State<SubBreeds> createState() => _SubBreedsState();
}

class _SubBreedsState extends State<SubBreeds> {
  final HttpService httpService = HttpService();
  var breed = Get.arguments;

  @override
  void initState() {
    if (breed['subBreeds'].length > 0) {
      dogsListController.fetchDogsSubBreedList(breed);
    }
    dogsListController.fetchBreedImages(breed);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _mediaQuery = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              '${breed['name']}',
              style: TextStyle(color: Theme.of(context).primaryColor),
            ),
            bottom: TabBar(
              indicatorColor: Theme.of(context).colorScheme.secondary,
              padding: EdgeInsets.only(left: 2.0.w),
              tabs: [
                Tab(
                  icon: Icon(Icons.directions_car),
                  child: Text(
                    "Sub Breeds",
                    style: Theme.of(context).textTheme.subtitle1?.copyWith(
                        fontSize: 12.0.sp,
                        color: Theme.of(context).colorScheme.primary),
                  ),
                ),
                Tab(
                  icon: Icon(Icons.directions_car),
                  child: Text(
                    "Images",
                    style: Theme.of(context).textTheme.subtitle1?.copyWith(
                        fontSize: 12.0.sp,
                        color: Theme.of(context).colorScheme.primary),
                  ),
                ),
              ],
            ),
          ),
          body: TabBarView(children: [
            subBreedsList(_mediaQuery),
            Obx(() {
              return images();
            })
          ])),
    );
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
                itemCount: dogsListController.breedImagesList.length,
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
                "${dogsListController.breedImagesList[index]}",
                fit: BoxFit.cover,
                height: 40.0.h,
                width: double.infinity,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;

                  return SkeletonAvatar(
                    style: SkeletonAvatarStyle(
                      shape: BoxShape.rectangle,
                      height: 40.0.h,
                      width: double.infinity,
                    ),
                  );
                },
                errorBuilder: (context, error, stackTrace) => Center(
                    child: SizedBox(
                  height: 40.0.h,
                  width: double.infinity,
                  child: Text(
                    '!!',
                    style:
                        TextStyle(color: Theme.of(context).colorScheme.error),
                  ),
                )),
              )),
        ],
      ),
    );
  }

  Widget subBreedsList(_mediaQuery) {
    return breed['subBreeds'].length == 0
        ? Center(
            child: Text("No sub breeds found for ${breed['name']}"),
          )
        : Obx(() {
            return dogsListController.dogsBreedList.isNotEmpty
                ? SizedBox(
                    // height: (_mediaQuery.height-8.0.h),
                    // width: _mediaQuery.width,
                    child: ListView.separated(
                        separatorBuilder: (BuildContext context, int index) =>
                            SizedBox(
                              height: 1.0.h,
                            ),
                        padding:
                            EdgeInsets.fromLTRB(2.0.w, 2.0.w, 2.0.w, 2.0.w),
                        shrinkWrap: true,
                        itemCount: dogsListController.dogsSubBreedList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return subBreedItem(index);
                        }),
                  )
                : const Center(
                    child: CircularProgressIndicator(),
                  );
          });
  }

  Widget subBreedItem(index) {
    return InkWell(
      onTap: () {
        Get.to(() => const SubBreedImages(), arguments: {
          'subBreed': dogsListController.dogsSubBreedList[index],
          "breed": breed['name']
        });
      },
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(1.0.w),
                    topRight: Radius.circular(1.0.w)),
                child: Image.network(
                  "${dogsListController.dogsBreedList[index]['imageUrl']}",
                  fit: BoxFit.cover,
                  height: 45.0.w,
                  width: double.infinity,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;

                    return SkeletonAvatar(
                      style: SkeletonAvatarStyle(
                        shape: BoxShape.rectangle,
                        height: 45.0.w,
                        width: double.infinity,
                      ),
                    );
                  },
                  errorBuilder: (context, error, stackTrace) => Center(
                      child: Text(
                    '!!',
                    style:
                        TextStyle(color: Theme.of(context).colorScheme.error),
                  )),
                )),
            Padding(
              padding: EdgeInsets.all(1.0.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${dogsListController.dogsBreedList[index]['name']}",
                    style: Theme.of(context).textTheme.subtitle1?.copyWith(
                          fontSize: 14.0.sp,
                        ),
                  ),
                  Text(
                    "${breed['name']}",
                    style: Theme.of(context).textTheme.subtitle1?.copyWith(
                        fontSize: 12.0.sp,
                        color: Theme.of(context).colorScheme.secondary),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
