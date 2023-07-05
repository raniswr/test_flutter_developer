import 'package:bloc/bloc.dart';
import 'package:test_flutter_developer/data/models/model_articles.dart';
import 'package:test_flutter_developer/data/services/api_services.dart';

part 'article_state.dart';

class ArticleCubit extends Cubit<ArticleState> {
  ArticleCubit() : super(ArticleState());

  Future<ModelArticles?> getArticle() async {
    var result = await ApiServices().getArticle();
    emit(ArticleState(articles: result));
    return result;
  }
}
