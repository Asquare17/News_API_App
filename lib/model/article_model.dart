class ArticleModel {
  String author;
  String title, description, url, urlToImage, content;
  DateTime publishedAt;
  ArticleModel(
      {this.description,
      this.author,
      this.content,
      this.title,
      this.url,
      this.urlToImage,
      this.publishedAt});
}
