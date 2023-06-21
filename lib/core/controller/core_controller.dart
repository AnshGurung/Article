import 'package:article_hub/core/data/model/tag_model.dart';
import 'package:get/get.dart';

class CoreController extends GetxController {
  var tagInfo = <TagModel>[];

  List<TagModel> get getTagList => tagInfo;
  set setTagList(List<TagModel> tagList) {
    tagInfo = tagList;
    update();
  }

  void addTag(TagModel tag) {
    tagInfo.add(tag);
    update();
  }

  void delete(TagModel tag) {
    tagInfo.remove(tag);
    update();
  }

  void edit(TagModel tag) {
    var toEditItem = tagInfo.firstWhere((item) => item.tagId == tag.tagId);
    int index = tagInfo.indexOf(toEditItem);
    tagInfo[index] = tag;
    update();
  }
}
