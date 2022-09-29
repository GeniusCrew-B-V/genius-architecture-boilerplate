part of 'updates_page_view_model_shared.dart';

mixin UpdatesPageViewModel on UpdatesPageViewModelShared {
  // ******************************************
  // *************** Posts ********************
  // ******************************************

  PostsFilterModel selectedFiltersForPost = PostsFilterModel(pageNumber: 1, totalPerPage: 10);
  List<PostModelResponse> postsList = [];
  String postId = '';
  int maxPostsNum = 0;

  /// Function called to scroll on the NextPage
  Future scrollNextPagePosts() async {
    if (!showPageLoader) {
      showPageLoader = true;
      notifyListeners();
      int pageNum = 1;
      pageNum += selectedFiltersForPost.pageNumber ?? 1;
      PostsFilterModel filterModel = PostsFilterModel(pageNumber: pageNum, totalPerPage: selectedFiltersForPost.totalPerPage);
      await updatePosts(filterModel: filterModel, addPosts: true);
      showPageLoader = false;
      notifyListeners();
    }
  }

  /// Function to fetch the posts list
  Future updatePosts({PostsFilterModel? filterModel, bool addPosts = false}) async {
    try {
      if (filterModel != null) selectedFiltersForPost = filterModel;
      showPageLoader = true;
      await updatesPageRepository.getPosts(selectedFiltersForPost).then((postsDetail) {
        maxPostsNum = postsDetail.maxElementsNum;
        postsList.addAll(postsDetail.posts);
        showPageLoader = false;
        notifyListeners();
      }).catchError((error) {
        showPageLoader = false;
        showSnackBar!(translation.generic.genericError);
        notifyListeners();
      });
    } catch (e) {
      print(e);
      showPageLoader = false;
      notifyListeners();
    }
  }
}
