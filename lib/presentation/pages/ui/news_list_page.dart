part of 'pages.dart';

class NewsListPage extends StatelessWidget {
  const NewsListPage({Key? key}) : super(key: key);

  Widget _buildList() {
    return Consumer<NewsProvider>(builder: (context, state, _) {
      if (state.state == ResultState.loading) {
        return const Center(child: CircularProgressIndicator());
      } else if (state.state == ResultState.hasData) {
        return ListView.builder(
            shrinkWrap: true,
            itemCount: state.result.articles.length,
            itemBuilder: (context, index) {
              return _buildArticleItem(context, state.result.articles[index]);
            });
      } else if (state.state == ResultState.noData ||
          state.state == ResultState.error) {
        return Center(
          child: Material(
            child: Text(state.message),
          ),
        );
      } else {
        return Center(
          child: Material(
            child: Text("_______"),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildList(),
    );
  }
}

Widget _buildArticleItem(BuildContext context, Articles articl) {
  return ListTile(
    onTap: () {
      Navigator.pushNamed(context, DetailArticlePage.routeName,
          arguments: articl);
    },
    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    leading: Image.network(
      articl.urlToImage,
      width: 100,
    ),
    title: Text(articl.title),
    subtitle: Text(articl.author),
  );
}
