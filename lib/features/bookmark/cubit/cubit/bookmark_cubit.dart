import 'package:bloc/bloc.dart';
import 'package:book_stroe/features/bookmark/data/bookmark_repo.dart';
import 'package:book_stroe/features/bookmark/cubit/cubit/bookmark_state.dart';
import 'package:book_stroe/features/home/data/model/product_model.dart';

class BookmarkCubit extends Cubit<BookmarkState> {
  BookmarkCubit() : super(BookmarkInitial());

  List<Product> wishlist = [];
  final Set<int> _pendingToggles = {};

  bool isFavorite(int bookId) {
    return wishlist.any((p) => p.id == bookId);
  }

  /// ================= LOAD BOOKMARK =================
  Future<void> showBookmark() async {
    emit(BookMarkLoading());

    try {
      final response = await BookMarkRepo.showBookMark();

      if (response != null) {
        wishlist = response.data.products;
        emit(GetBookMarkSuccess(bookmark: response));
      } else {
        emit(BookMarkError(message: "Failed to load wishlist"));
      }
    } catch (e) {
      emit(BookMarkError(message: e.toString()));
    }
  }

  /// ================= TOGGLE FAVORITE (OPTIMISTIC) =================
  Future<void> toggleFavorite(Product product) async {
    final int id = product.id;
    if (_pendingToggles.contains(id)) return; // Prevent duplicate concurrent API calls
    _pendingToggles.add(id);

    final bool currentlyFavorite = isFavorite(id);
    final originalWishlist = List<Product>.from(wishlist);

    // 1. Optimistic Update
    if (currentlyFavorite) {
      wishlist.removeWhere((p) => p.id == id);
    } else {
      wishlist.add(product);
    }

    // Emit GetBookMarkSuccess immediately to update UI instantly
    emit(GetBookMarkSuccess(
      bookmark: ProductsResponse(
        status: 200,
        data: ProductsData(products: List<Product>.from(wishlist)),
      ),
    ));

    // Emit action success state for Snackbar/Feedback
    emit(BookMarkActionSuccess(
      message: currentlyFavorite ? "removeFromFavorites" : "addToFavorites",
      bookId: id,
      isAdded: !currentlyFavorite,
    ));

    // 2. Call API
    bool success = false;
    try {
      if (currentlyFavorite) {
        success = await BookMarkRepo.removeFromFavorite(bookId: id);
      } else {
        success = await BookMarkRepo.addToFavourite(bookId: id);
      }
    } catch (_) {
      success = false;
    }

    _pendingToggles.remove(id);

    // 3. Rollback on failure
    if (!success) {
      wishlist = originalWishlist;
      emit(GetBookMarkSuccess(
        bookmark: ProductsResponse(
          status: 200,
          data: ProductsData(products: List<Product>.from(wishlist)),
        ),
      ));
      emit(BookMarkActionError(
        message: currentlyFavorite ? "Failed to remove from favorites" : "Failed to add to favorites",
      ));
    }
  }

  /// ================= ADD =================
  Future<void> addToBookmark(Product product) async {
    if (!isFavorite(product.id)) {
      await toggleFavorite(product);
    }
  }

  /// ================= REMOVE =================
  Future<void> removeFromBookmark(Product product) async {
    if (isFavorite(product.id)) {
      await toggleFavorite(product);
    }
  }
}

