import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/core/constance.dart';
import 'package:store_app/features/home/domain/entities/product.dart';
import 'package:store_app/features/home/domain/use_cases/get_products.dart';
import 'package:store_app/features/home/presentation/bloc/product/product_event.dart';
import 'package:store_app/features/home/presentation/bloc/product/product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductStates> {
  final GetProductsUseCase getProducts;
  List<Product>? offerProducts;
  List<Product>? topSellingProducts;
  List<Product>? newProducts;

  ProductBloc({required this.getProducts}) : super(ProductInitialState()) {
    on<ProductEvent>((event, emit) async {
      if (event is GetProductsEvent) {
        emit(ProductLoadingState());
        final offer = await getProducts(Constance.offerProducts);
        final topSelling = await getProducts(Constance.topSellingProducts);
        final newPro = await getProducts(Constance.newProducts);
        offer.fold(
          (failure) {
            offerProducts = [];
          },
          (r) {
            offerProducts = r;
          },
        );
        topSelling.fold(
          (failure) {
            topSellingProducts = [];
          },
          (r) {
            topSellingProducts = r;
          },
        );
        newPro.fold(
          (failure) {
            newProducts = [];
          },
          (r) {
            newProducts = r;
          },
        );
        emit(GetProductSuccessState());
      }
    });
  }
}
