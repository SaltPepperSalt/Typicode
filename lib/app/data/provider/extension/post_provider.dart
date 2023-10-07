import 'package:get/get.dart';
import 'package:typicode/app/data/model/posts.dart';
import 'package:typicode/app/data/provider/base.dart';

extension PostProviderEx on Provider {
  Future<Response<List<Rx<PostForList>>?>> getPostForLists() {
    return get('/posts/', decoder: (data) {
      try {
        if (data != null && data is List) {
          final List<Rx<PostForList>> parsedUserJson = data.map((postJson) {
            final Rx<PostForList> item = PostForList.fromJson(postJson).obs;
            getComments(item.value.id).then((value) {
              Response response = value;
              if (response.isOk && response.body != null) {
                item.value.commentCount = response.body.length;
              } else {
                item.value.commentCount = 0;
              }
            });
            return item;
          }).toList();
          return parsedUserJson;
        } else {
          return null;
        }
      } catch (e) {
        // control client side error ex) wrong field
        return null;
      }
    });
  }

  Future<Response<List<Comment>?>> getComments(int postId) {
    return get('/posts/$postId/comments/', decoder: (data) {
      try {
        if (data != null && data is List) {
          final List<Comment> parsedCommentJson =
              data.map((commentJson) => Comment.fromJson(commentJson)).toList();
          return parsedCommentJson;
        } else {
          return null;
        }
      } catch (e) {
        // control client side error ex) wrong field
        return null;
      }
    });
  }
}
