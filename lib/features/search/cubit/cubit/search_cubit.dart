import 'package:bloc/bloc.dart';
import 'package:book_stroe/features/home/data/model/product_model.dart';
import 'package:book_stroe/features/search/data/search_repo.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final SearchRepo repository;
  final _searchSubject = PublishSubject<String>();

  SearchCubit(this.repository) : super(SearchInitial()) {
    _searchSubject.stream
        .debounceTime(const Duration(milliseconds: 500))
        .distinct()
        .listen(search);
  }
  void onSearch(String text) {
    _searchSubject.add(text);
  }

  Future<void> search(String text) async {
    if (text.isEmpty) {
      emit(SearchSuccessState(products: []));
      return;
    }
    emit(SearchLoadingState());
    final response = await SearchRepo.search(text: text);
    if (response != null) {
      emit(SearchSuccessState(products: response.data.products));
    } else {
      emit(SearchErrorState());
    }
  }

  @override
  Future<void> close() {
    _searchSubject.close();
    return super.close();
  }
}
