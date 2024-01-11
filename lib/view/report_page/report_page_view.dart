import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_management/view/report_page/report_page_controller.dart';

class ReportPageView extends StatelessWidget {
  const ReportPageView({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<ReportPageController>();
    var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: theme.cardColor),
        title: Text(
          'Report Page',
          style: TextStyle(
              color: theme.cardColor,
              fontSize: 16,
              fontWeight: FontWeight.w600),
        ),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Fetching My Model Data',
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: theme.cardColor),
          ),
          SizedBox(height: 5,),
          Expanded(
            child: Obx(() {
              if (controller.isLoading.value) {
                return Center(child: CircularProgressIndicator());
              }
              return ListView.builder(
                  itemCount: controller.myModelList.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading:
                          Text(controller.myModelList[index].id.toString()),
                      title: Text(controller.myModelList[index].title),
                    );
                  });
            }),
          ),
          SizedBox(height: 5,),
          Text(
            'Fetching Popular Movie Data',
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: theme.cardColor),
          ),
          SizedBox(height: 5,),
          Expanded(
            child: GetBuilder<ReportPageController>(
                init: controller,
                builder: (context) {
                  return controller.hasPopularMovieDataLoaded
                      ? ListView.builder(
                          itemCount: controller.popularModel!.results!.length,
                          itemBuilder: (context, index) {
                            var data = controller.popularModel!.results![index];
                            return ListTile(
                              leading: Text(data.id.toString()),
                              title: Text(data.title!),
                            );
                          })
                      : Center(child: CircularProgressIndicator());
                }),
          ),
          SizedBox(height: 5,),
          Text(
            'Fetching Now Playing Movie Data',
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: theme.cardColor),
          ),
          SizedBox(height: 5,),
          Expanded(
            child: GetBuilder<ReportPageController>(
                init: controller,
                builder: (context) {
                  return controller.hasNowPlayingMovieDataLoaded
                      ? ListView.builder(
                          itemCount:
                              controller.nowPlayingModel!.results!.length,
                          itemBuilder: (context, index) {
                            var data =
                                controller.nowPlayingModel!.results![index];
                            return ListTile(
                              leading: Text(
                                data.id.toString(),
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: theme.cardColor),
                              ),
                              title: Text(
                                data.title!,
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: theme.cardColor),
                              ),
                            );
                          })
                      : Center(child: CircularProgressIndicator());
                }),
          ),
        ],
      ),
    );
  }
}
