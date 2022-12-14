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
        appBar: AppBar(title: const Text('SearchArticle')),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                onChanged: (query) {
                  context.read<NewsSearchBloc>().add(OnQueryNewsChanged(query));
                },
                decoration: const InputDecoration(
                    hintText: 'Search Tittle',
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder()),
                textInputAction: TextInputAction.search,
              ),
              const SizedBox(
                height: 16,
              ),
              const Text('Search Reasult'),
              NewsSearchListPage(),
            ],
          ),
        ));
  }
}
