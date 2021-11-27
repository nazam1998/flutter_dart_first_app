class Post {
  String name;
  String time;
  String imagePath;
  String desc;
  int likes;
  int comments;

  Post({
    required this.name,
    required this.time,
    required this.imagePath,
    required this.desc,
    this.likes: 0,
    this.comments: 0,
  });

  String setTime() => "$time ago";
  String setLikes() {
    return "$likes likes";
  }

  String setComments() {
    if (comments > 1) {
      return '$comments comments';
    }else{
      return '$comments comment';
    }
  }
}