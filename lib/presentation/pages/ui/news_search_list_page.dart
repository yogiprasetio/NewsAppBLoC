part of 'pages.dart';

class NewsSearchListPage extends StatelessWidget {
  const NewsSearchListPage({Key? key}) : super(key: key);

  Widget _buildList() {
    return BlocBuilder<NewsSearchBloc, NewsSearchState>(
        builder: (context, state) {
      if (state is NewsSearchLoading) {
        return const Center(child: CircularProgressIndicator());
      } else if (state is NewsSearchHasData) {
        final result = state.data;
        return Expanded(
          child: ListView.builder(
              shrinkWrap: true,
              itemCount: state.data.articles.length,
              itemBuilder: (context, index) {
                return _buildArticleItem(context, state.data.articles[index]);
              }),
        );
      } else if (state is NewsSearchError) {
        return Center(
          child: state.retry == null
              ? Material(
                  child: Text(state.message),
                )
              : Material(
                  child: Text(
                      "${state.message}, retry: ${state.retry.toString()}"),
                ),
        );
      } else if (state is NewsSearchEmpty) {
        return Center(
          child: Text(state.message),
        );
      } else {
        return const Center(
          child: Material(
            child: Text("_______"),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return _buildList();
  }
}
