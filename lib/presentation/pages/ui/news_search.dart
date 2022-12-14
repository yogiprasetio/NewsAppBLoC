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
    return Scaffold(body: const NewsSearchListPage());
  }
}
