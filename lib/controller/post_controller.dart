import 'package:dio/dio.dart' as dio;
import 'package:flutter/cupertino.dart';
import 'package:flutter_getx/model/post_model.dart';
import 'package:get/get.dart';

class PostController extends GetxController {
  //with obs
  var postModel = List<PostModel>().obs;
  var completePostModel = List<PostModel>();
  var isLoading = true.obs;
  int i;
  var text = "".obs;
  var textController = TextEditingController();
  @override
  void onInit() {
    i = 0;
    fetchPostData();
    //this is use for searching.
    debounce(
      text,
      (_) {
        postModel([]);
        postModel.addAll(completePostModel
            .where((e) => e.name.contains(text.value))
            .toList());
        print(postModel.length);
      },
      time: Duration(seconds: 1),
    );
    super.onInit();
  }

  @override
  void onReady() {
    // called after the widget is rendered on screen
//    showIntroDialog();
    super.onReady();
  }

  fetchPostData({bool isRefresh = false}) async {
    print("ok");
    if (isRefresh) {
      i = 1;
      textController.text = "";
      postModel([]);
    } else {
      i++;
      textController.text = "";
      postModel([]);
      postModel.addAll(completePostModel);
    }
    if (i == 1) isLoading(true);

    dio.Response res = await dio.Dio()
        .get('https://jsonplaceholder.typicode.com/comments?postId=$i');
    print(res.data);
    for (Map<String, dynamic> r in res.data) {
      postModel.add(PostModel.fromJson(r));
    }
    completePostModel.addAll(postModel);
    if (i == 1) isLoading(false);
  }

  @override
  void onClose() {
    super.onClose();
  }
}
