import 'package:flutter/material.dart';
import 'package:gallery360/pages/aipainter/model/image_template.dart';
import 'package:gallery360/pages/aipainter/repository/template_repository.dart';
import 'package:get/get.dart';

class templateController extends GetxController{
  var templateList = <template>[].obs;
  var loadComplate_template = false.obs;

  final templateRepository _templateRepo = templateRepository();

  Future getTemplateList() async{
    List<dynamic> respons = await _templateRepo.loadTemplate();
    List<template> rx = respons.map<template>((json) => template.fromJson(json)).toList();
    templateList.addAll(rx);
    loadComplate_template.value = true;

  }
}