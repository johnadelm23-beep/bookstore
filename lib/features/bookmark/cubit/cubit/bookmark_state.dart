import 'package:book_stroe/features/home/data/model/product_model.dart';
import 'package:meta/meta.dart';

@immutable
sealed class BookmarkState {}

class BookmarkInitial extends BookmarkState {}

class BookMarkLoading extends BookmarkState {}

class BookMarkError extends BookmarkState {
  final String message;
  BookMarkError({this.message = "Error"});
}

class BookMarkSuccess extends BookmarkState {
  final String message;
  BookMarkSuccess({this.message = "Success"});
}

class GetBookMarkSuccess extends BookmarkState {
  final ProductsResponse bookmark;

  GetBookMarkSuccess({required this.bookmark});
}

class BookMarkActionLoading extends BookmarkState {}

class BookMarkActionSuccess extends BookmarkState {
  final String message;
  final int bookId;
  final bool isAdded;

  BookMarkActionSuccess({
    required this.message,
    required this.bookId,
    required this.isAdded,
  });
}

class BookMarkActionError extends BookmarkState {
  final String message;

  BookMarkActionError({required this.message});
}

