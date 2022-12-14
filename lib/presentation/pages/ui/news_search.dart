part of 'pages.dart';

class NewsSearchScreen extends StatefulWidget {
  static const routeName = "/article_search_list";
  const NewsSearchScreen({Key? key}) : super(key: key);

  @override
  State<NewsSearchScreen> createState() => _NewsSearchScreenState();
}

class _NewsSearchScreenState extends State<NewsSearchScreen> {
  @override
  Widget build(BuildContext context) {
    double listItemWidth =
        MediaQuery.of(context).size.width - 2 * defaultMargin;
    return Scaffold(
      body: ChangeNotifierProvider<NewsProvider>(
        create: (_) => NewsProvider(
            apiService: ApiService(), category: "business", country: "id"),
        child: const NewsListPage(),
      ),
    );
    // return PlatformWidget(androidBuilder: _buildAndroid, iosBuilder: _buildIos);
  }

  /*Widget _buildAndroid(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Article's Page", style: Theme.of(context).textTheme.headline5, ),
      ),
      body: buildFutureBuilder(context),
    );
  }

  Widget _buildIos(BuildContext context){
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
          middle: const Text("Article's Page"),
        transitionBetweenRoutes: false,
      ),
      child: buildFutureBuilder(context),
    );
  }*/
  //
  // FutureBuilder<String> buildFutureBuilder(BuildContext context) {
  //   return FutureBuilder<String>(
  //     future: DefaultAssetBundle.of(context).loadString('assets/articles.json'),
  //     builder: (context, snapshot){
  //       final List<Article> articles = parseArticles(snapshot.data);
  //       return ListView.builder(
  //           itemCount: articles.length,
  //           itemBuilder: (context, index){
  //             return _buildArticleItem(context, articles[index]);
  //           }
  //       );
  //     },
  //   );
  // }
}
