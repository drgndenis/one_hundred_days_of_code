import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:one_hundred_days_of_flutter/Day-10/service/comment_model.dart';
import 'post_model.dart';

abstract class IPostService {
  Future<bool> addItemToService(PostModel postModel);
  Future<bool> updateItemToService(PostModel postModel, int id);
  Future<bool> deleteItemToService(int id);
  Future<List<PostModel>?> fetchItemsAdvance();
  Future<List<CommentModel>?> fetchRelatedCommentWithPostId(int id);
}

class PostService implements IPostService {
  final Dio _dio;
  PostService()
      : _dio =
            Dio(BaseOptions(baseUrl: 'https://jsonplaceholder.typicode.com/'));

  // Item ekleme
  @override
  Future<bool> addItemToService(PostModel postModel) async {
    final response =
        await _dio.post(_PostServicePaths.posts.name, data: postModel);
    return response.statusCode == HttpStatus.created;
  }

  // Item gunceleme
  @override
  Future<bool> updateItemToService(PostModel postModel, int id) async {
    final response =
        await _dio.put('{$_PostServicePaths.posts.name}/$id', data: postModel);
    return response.statusCode == HttpStatus.ok;
  }

  // Item silme
  @override
  Future<bool> deleteItemToService(int id) async {
    final response = await _dio.put('{$_PostServicePaths.posts.name}/$id');
    return response.statusCode == HttpStatus.ok;
  }

  @override
  Future<List<PostModel>?> fetchItemsAdvance() async {
    try {
      final response = await _dio.get(_PostServicePaths.posts.name);
      if (response.statusCode == HttpStatus.ok) {
        final datas = response.data;

        if (datas is List) {
          return datas.map((e) => PostModel.fromJson(e)).toList();
        }
      }
    } on DioError catch (exception) {
      _ShowDebug.showDioError(exception, this);
    }
    return null;
  }

  @override
  Future<List<CommentModel>?> fetchRelatedCommentWithPostId(int id) async {
    try {
      final response =
          await _dio.get(_PostServicePaths.comments.name, queryParameters: {
        _PostQueryPaths.postId.name: id,
      });
      if (response.statusCode == HttpStatus.ok) {
        final datas = response.data;

        if (datas is List) {
          return datas.map((e) => CommentModel.fromJson(e)).toList();
        }
      }
    } on DioError catch (exception) {
      // this ile hangi class'da hata oldugunu gosteriyoruz
      _ShowDebug.showDioError(exception, this);
    }
    return null;
  }
}

enum _PostServicePaths { posts, comments }

enum _PostQueryPaths { postId }

class _ShowDebug {
  static void showDioError<T>(DioError error, type) {
    if (kDebugMode) {
      print(error.message);
      print(type);
    }
  }
}
