import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../injector.dart';
import '../../repositories/category_repository.dart';

part 'category_cubit.freezed.dart';
part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  final CategoryRepository _categoryRepository;

  CategoryCubit(this._categoryRepository)
      : super(const CategoryState.initial());

  factory CategoryCubit.create() =>
      CategoryCubit(getIt.get())..getAllCategory();

  void getAllCategory() async {
    emit(const CategoryState.loading());
    final result = await _categoryRepository.getAllCategory();
    result.fold(
      (l) {
        emit(CategoryState.error(l.description));
      },
      (r) async {
        emit(CategoryState.success(r));
      },
    );
  }
}
