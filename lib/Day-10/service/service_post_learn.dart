import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:one_hundred_days_of_flutter/Day-10/service/post_model.dart';

class ServicePostLearn extends StatefulWidget {
  const ServicePostLearn({super.key});

  @override
  State<ServicePostLearn> createState() => _ServicePostLearnState();
}

class _ServicePostLearnState extends State<ServicePostLearn> {
  String? name;
  bool _isLoading = false;
  late final Dio _dio;
  final _baseUrl = 'https://jsonplaceholder.typicode.com';
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _bodyController = TextEditingController();
  final TextEditingController _userIdController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _dio = Dio(BaseOptions(baseUrl: _baseUrl));
    name = 'Run App';
  }

  void _changeLoading() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  Future<void> addItemToService(PostModel postModel) async {
    _changeLoading();
    final response = await _dio.post('/posts', data: postModel);

    if (response.statusCode == HttpStatus.created) {
      name = 'Başarılı';
    }
    _changeLoading();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name ?? ''),
        actions: [
          _isLoading
              ? const CircularProgressIndicator.adaptive()
              : const SizedBox.shrink()
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: TextField(
                textInputAction: TextInputAction.next,
                controller: _titleController,
                decoration: const InputDecoration(labelText: 'Title')),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: TextField(
                textInputAction: TextInputAction.next,
                controller: _bodyController,
                decoration: const InputDecoration(labelText: 'Body')),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: TextField(
                textInputAction: TextInputAction.done,
                keyboardType: TextInputType.number,
                controller: _userIdController,
                decoration: const InputDecoration(labelText: 'UserId')),
          ),
          ElevatedButton(
            onPressed: _isLoading
                ? null
                : () {
                    if (_titleController.text.isNotEmpty &&
                        _bodyController.text.isNotEmpty &&
                        _userIdController.text.isNotEmpty) {
                      final model = PostModel(
                          title: _titleController.text,
                          body: _bodyController.text,
                          userId: int.parse(_userIdController.text));
                      addItemToService(model);
                    }
                  },
            child: const Text('Create a new Post'),
          )
        ],
      ),
    );
  }
}
