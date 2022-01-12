// ignore_for_file: prefer_const_constructors, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:safisampletest/_utils/constants/app_colors.dart';
import 'package:safisampletest/articles/models/article.dart';
import 'package:safisampletest/articles/providers/article_list_provider.dart';
import 'package:safisampletest/articles/ui/article_detail_screen.dart';

class ArticleListScreen extends StatefulWidget {
  const ArticleListScreen({Key? key}) : super(key: key);

  @override
  _ArticleListScreenState createState() => _ArticleListScreenState();
}

class _ArticleListScreenState extends State<ArticleListScreen> {
  bool _isLoading = false;
  List<Article> _articles = <Article>[];

  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  @override
  void initState() {
    _getAllArticles();
    super.initState();
  }

  _getAllArticles() async {
    try {
      _isLoading = true;
      setState(() {});
      _articles = await ArticleListProvider().getAllArticles();
      _isLoading = false;
      setState(() {});
    } on Exception catch (_) {
      _isLoading = false;
      setState(() {});
    }
  }

  void _onRefresh() async {
    await Future.delayed(Duration(milliseconds: 1000));
    _getAllArticles();
    _refreshController.refreshCompleted();
  }

  void _onLoading() async {
    await Future.delayed(Duration(milliseconds: 1000));
    if (mounted) setState(() {});
    _getAllArticles();
    _refreshController.loadComplete();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        centerTitle: false,
        backgroundColor: AppColors.black,
        elevation: 0,
      ),
      body: SmartRefresher(
        enablePullDown: true,
        enablePullUp: false,
        header: WaterDropHeader(),
        controller: _refreshController,
        onRefresh: _onRefresh,
        onLoading: _onLoading,
        child: _isLoading
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemBuilder: (c, i) => Card(
                  child: ListTile(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ArticleDetailScreen(
                            _articles[i],
                          ),
                        ),
                      );
                    },
                    leading: SizedBox(
                      height: 50,
                      width: 50,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50.0),
                        child: _articles[i].thumbnail != null
                            ? Image.network(
                                _articles[i].thumbnail!,
                              )
                            : Container(
                                color: AppColors.grey,
                              ),
                      ),
                    ),
                    title: Text(
                      _articles[i].title,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 4),
                        Text(
                          _articles[i].abstractText,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 4),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Text(_articles[i].updated),
                        ),
                      ],
                    ),
                  ),
                ),
                itemExtent: 100.0,
                itemCount: _articles.length,
              ),
      ),
    );
  }
}
