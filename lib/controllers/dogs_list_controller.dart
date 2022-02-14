import 'dart:async';
import 'package:alvintestpartone/constants/controllers.dart';
import 'package:alvintestpartone/models/dog_sub_breed_model.dart';
import 'package:alvintestpartone/widgets/toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:convert';

class DogsListController extends GetxController {
  static DogsListController instance = Get.find();
  RxBool isLoading = false.obs;
  RxBool isSubBreedLoading = false.obs;
  RxString error = ''.obs;
  RxList dogsBreedList = [].obs;
  RxList subBreedImagesList = [].obs;
  RxList dogsSubBreedList = [].obs;
  RxList breedImagesList = [].obs;

  @override
  void onInit() async {
    fetchDogsBreedList();
    super.onInit();
  }

  Future fetchDogsBreedList() async {
    isLoading.value = true;
    dogsBreedList.value = [];
    try {
      var response = await httpService.getData(
        apiUrl: "breeds/list/all",
      );

      var data = jsonDecode(response.body);

      await data['message'].forEach((k, v) async {
        var randomImageRes = await httpService.getData(
          apiUrl: "breed/$k/images/random",
        );
        var _data = jsonDecode(randomImageRes.body);

        dogsBreedList
            .add({"name": k, "subBreeds": v, 'imageUrl': _data["message"]});
      });
    } catch (e) {
      error.value = '$e';
    }

    isLoading.value = false;
  }

  Future fetchDogsSubBreedList(breed) async {

    isSubBreedLoading.value = true;
    update();
    try {
      dogsSubBreedList.value = [];

      await breed['subBreeds'].forEach((k) async {
        var randomImageRes = await httpService.getData(
          apiUrl: "breed/${breed['name']}/$k/images/random",
        );
        var _data = jsonDecode(randomImageRes.body);

        dogsSubBreedList.add({"name": k, 'imageUrl': _data["message"]});
      });
    } catch (e) {
      error.value = '$e';
      print('fetchDogsSubBreedList $e');
    }

    isSubBreedLoading.value = false;
    update();
  }

  Future fetchBreedImages(breed) async {
    isSubBreedLoading.value = true;

    update();
    try {
      breedImagesList.value = [];

      var imageRes = await httpService.getData(
        apiUrl: "breed/${breed['name']}/images",
      );

      var _data = jsonDecode(imageRes.body);

      breedImagesList.value = _data["message"];
    } catch (e) {
      error.value = '$e';
      print('fetchBreedImages error $e');
    }
    isSubBreedLoading.value = false;
    update();
  }

  Future fetchSubBreedImages(breed, subBreed) async {
    isSubBreedLoading.value = true;
    update();
    try {
      subBreedImagesList.value = [];

      var imageRes = await httpService.getData(
        apiUrl: "breed/$breed/$subBreed/images",
      );
      var _data = jsonDecode(imageRes.body);

      subBreedImagesList.value = _data["message"];
    } catch (e) {
      error.value = '$e';
      print('fetchSubBreedImages error $e');
    }
    isSubBreedLoading.value = false;
    update();
  }
}
