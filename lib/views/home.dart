import 'package:alvintestpartone/constants/controllers.dart';
import 'package:alvintestpartone/utils/http_requests.dart';
import 'package:alvintestpartone/views/sub_breeds.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:skeletons/skeletons.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HttpService httpService = HttpService();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Obx(() {
            return Text(
              'Dog Breeds (${dogsListController.dogsBreedList.length})',
              style: TextStyle(color: Theme.of(context).primaryColor),
            );
          }),
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: Obx(() {
          return RefreshIndicator(
              onRefresh: () {
                return dogsListController.fetchDogsBreedList();
              },
              child: !dogsListController.isLoading.value
                  ? Container(
                      height: _mediaQuery.height,
                      width: _mediaQuery.width,
                      child: ListView.separated(
                          separatorBuilder: (BuildContext context, int index) =>
                              SizedBox(
                                height: 1.0.h,
                              ),
                          padding:
                              EdgeInsets.fromLTRB(2.0.w, 2.0.w, 2.0.w, 2.0.w),
                          shrinkWrap: true,
                          itemCount: dogsListController.dogsBreedList.length,
                          itemBuilder: (BuildContext context, int index) {
                            return breedItem(index);
                          }),
                    )
                  : const Center(
                      child: CircularProgressIndicator(),
                    ));
        }));
  }

  Widget breedItem(index) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(1.0.w),
            topRight: Radius.circular(1.0.w),
            topLeft: Radius.circular(1.0.w),
            bottomLeft: Radius.circular(1.0.w)),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(0),
        onTap: () {
          Get.to(() => const SubBreeds(),
              arguments: dogsListController.dogsBreedList[index]);
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(1.0.w),
              topRight: Radius.circular(1.0.w),
              topLeft: Radius.circular(1.0.w),
              bottomLeft: Radius.circular(1.0.w)),
        ),
        title: Text("${dogsListController.dogsBreedList[index]['name']}"),
        leading: ClipRRect(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(1.0.w),
                bottomLeft: Radius.circular(1.0.w)),
            child: Image.network(
              "${dogsListController.dogsBreedList[index]['imageUrl']}",
              fit: BoxFit.cover,
              height: 15.0.w,
              width: 15.0.w,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;

                return SkeletonAvatar(
                  style: SkeletonAvatarStyle(
                      shape: BoxShape.rectangle, width: 15.0.w, height: 15.0.w),
                );
              },
              errorBuilder: (context, error, stackTrace) => Center(
                  child: Text(
                '!!',
                style: TextStyle(color: Theme.of(context).colorScheme.error),
              )),
            )),
      ),
    );
  }
}
