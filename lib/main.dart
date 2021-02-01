import 'package:flutter/material.dart';
import 'package:flutter_app/clean_architecture/core/data/article_repository.dart';
import 'package:flutter_app/clean_architecture/core/usecase/get_articles_use_case.dart';
import 'package:flutter_app/clean_architecture/network/api_service.dart';
import 'package:flutter_app/clean_architecture/network/api_service_impl.dart';
import 'package:flutter_app/clean_architecture/presentation/home_bloc.dart';
import 'package:flutter_app/clean_architecture/presentation/home_page.dart';
import 'package:flutter_app/clean_architecture/repository/article_repository_impl.dart';
import 'package:flutter_app/router/scaffold_route.dart';
import 'package:flutter_app/view/album_page.dart';
import 'package:flutter_app/view/article_list_page.dart';
import 'package:flutter_app/view/UserListPage.dart';
import 'package:flutter_app/view/photo_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final ApiService _apiService = ApiServiceImpl();

  ArticleRepository _articleRepository;
  GetArticlesUseCase _getArticlesUseCase;

  @override
  void initState() {
    super.initState();
    _articleRepository = ArticleRepositoryImpl(_apiService);
    _getArticlesUseCase = GetArticlesUseCase(_articleRepository);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MultiProvider(
        providers: [
          Provider(
            create: (BuildContext context) => HomeBloc(_getArticlesUseCase),
            dispose: (BuildContext context, HomeBloc bloc) => bloc.dispose(),
          )
        ],
        child: ScaffoldRoute(),
      ),
    );
  }
}

//class MyApp extends StatelessWidget {
//  // This widget is the root of your application.
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      title: 'Flutter Demo',
//      theme: ThemeData(
//        primarySwatch: Colors.blue,
//        visualDensity: VisualDensity.adaptivePlatformDensity,
//      ),
//      home: ScaffoldRoute(),
//    );
//  }
//}