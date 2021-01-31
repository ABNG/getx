import 'package:flutter/material.dart';
import 'package:flutter_getx/controller/post_controller.dart';

import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class PostScreen extends StatelessWidget {
  final model = Get.find<PostController>();
  final _refreshController = RefreshController(initialRefresh: false);
  void _onLoading() async {
    print("on load");
    await model.fetchPostData();
    _refreshController.loadComplete();
  }

  void _onRefresh() async {
    // monitor network fetch
    print("on refresh");
    await model.fetchPostData(isRefresh: true);
    // if failed,use refreshFailed()
    _refreshController.refreshCompleted();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(
          () => TextField(
            controller: model.textController.value,
            style: TextStyle(color: Colors.black),
            onChanged: (value) {
              model.text(value);
            },
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
            ),
          ),
        ),
      ),
      body: Obx(
        () => model.isLoading.value
            ? Center(
                child: CircularProgressIndicator(),
              )
            : SmartRefresher(
                controller: _refreshController,
                onLoading: _onLoading,
                enablePullUp: true,
                enablePullDown: true,
                onRefresh: _onRefresh,
                child: ListView.builder(
                    itemCount: model.postModel.length,
                    itemBuilder: (context, index) => ListTile(
                          title: Text(
                            "${model.postModel[index].name}",
                            textScaleFactor: 1.5,
                          ),
                          subtitle: Text(
                            "${model.postModel[index].name}",
                            textScaleFactor: 1.5,
                          ),
                        )),
              ),
      ),
    );
  }
}
