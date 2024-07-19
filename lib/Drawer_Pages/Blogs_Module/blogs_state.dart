import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../../ApiModel/blogs_model.dart';
import '../../constant/constant.dart';

class BlogsState extends ChangeNotifier {
  BlogsState() {
    getBlogs();
  }
  Dio dio = Dio();
  bool isLoading = false;
  setLoading(val) {
    isLoading = val;
    notifyListeners();
  }

  BlogsModel? blogsModelResponse;
  // List blogs = [];

  getBlogs() async {
    try {
      setLoading(true);
      var response = await dio.get('$base_url/blogs',
          options: Options(headers: {
            'apikey': 'elab-ktmrush-api-v1-2023',
          }));
      blogsModelResponse = BlogsModel.fromJson(response.data);
      print(response.data);
    } on DioException catch (e) {
      print(e.response);
    }
    setLoading(false);
  }
}
