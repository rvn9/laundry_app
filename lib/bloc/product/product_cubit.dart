import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:laundry_app/repositories/product_repository.dart';

import '../../injector.dart';
import '../../model/product.dart';

part 'product_cubit.freezed.dart';
part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  final ProductRepository _productRepository;

  ProductCubit(this._productRepository) : super(const ProductState.initial());

  factory ProductCubit.create() => ProductCubit(getIt.get())..getAllProduct();

  void getAllProduct() async {
    emit(const ProductState.loading());
    final result = await _productRepository.getAllProduct();
    result.fold(
      (l) {
        emit(ProductState.error(l.description));
      },
      (r) async {
        emit(ProductState.success(r));
      },
    );
  }
}
