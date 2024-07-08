import 'package:bloc/bloc.dart';
import 'package:booklyapp/Features/home/data/models/book_model/book_model.dart';
import 'package:booklyapp/Features/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit(this.homeRepo) : super(FeaturedBooksInitial());

  final HomeRepo homeRepo;

  Future<void> fetchFeaturedBox() async {
    emit(FeaturedBooksLoading());
    var result = await homeRepo.fetchFeaturedBox();

    result.fold((failure) {
      emit(
        FeaturedBooksFailure(failure.errorMessage),
      );
    }, (books) {
      emit(
        FeaturedBooksSucess(books),
      );
    });
  }
}
