import 'package:flutter/material.dart';
import 'package:one_hundred_days_of_flutter/Day-10/service/comment_model.dart';
import 'post_service.dart';

class CommentsLearnView extends StatefulWidget {
  const CommentsLearnView({super.key, this.postId});
  final int? postId;

  @override
  State<CommentsLearnView> createState() => _CommentsLearnViewState();
}

class _CommentsLearnViewState extends State<CommentsLearnView> {
  late final IPostService postService;
  bool _isLoading = false;
  List<CommentModel>? _commentItem;

  @override
  void initState() {
    super.initState();
    postService = PostService();
    fetchItemsWithId(widget.postId ?? 0);
  }

  void _changeLoading() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  Future<void> fetchItemsWithId(int postId) async {
    _changeLoading();
    _commentItem = await postService.fetchRelatedCommentWithPostId(postId);
    _changeLoading();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: ListView.builder(
          itemCount: _commentItem?.length ?? 0,
          itemBuilder: (context, index) {
            return Card(
              child: Text(_commentItem?[index].email ?? ''),
            );
          },
        ));
  }
}
