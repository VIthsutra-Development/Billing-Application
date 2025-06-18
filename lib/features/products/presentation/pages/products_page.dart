import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:new_billing/core/widgets/app_delete_confirmation_bottom_sheet.dart';
import 'package:new_billing/core/widgets/app_dropdown.dart';
import 'package:new_billing/core/widgets/app_empty_widget.dart';
import 'package:new_billing/core/widgets/app_error_widget.dart';
import 'package:new_billing/core/widgets/app_snack_bar.dart';
import 'package:new_billing/features/pdf_viev/page/pdf_view_page.dart';
import 'package:new_billing/features/products/presentation/cubit/add_product_cubit.dart';
import 'package:new_billing/features/products/presentation/cubit/delete_product_cubit.dart';
import 'package:new_billing/features/products/presentation/cubit/fetch_product_cubit.dart';
import 'package:new_billing/features/products/presentation/widgets/add_products_form.dart';
import 'package:new_billing/features/products/presentation/widgets/product_loading_widget.dart';
import 'package:new_billing/features/products/presentation/widgets/product_tile.dart';
import 'package:new_billing/init_dependencies.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({super.key});

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  final TextEditingController _productNameController = TextEditingController();
  final TextEditingController _productPriceController = TextEditingController();
  final TextEditingController _productQuantityController =
      TextEditingController();
  final TextEditingController _productHSNSACController =
      TextEditingController();
  final TextEditingController _productUnitController = TextEditingController();
  String? invoiceId;

  @override
  void initState() {
    _fetchProducts();
    getInvoiceId();
    super.initState();
  }

  void _clearController() {
    _productHSNSACController.clear();
    _productNameController.clear();
    _productPriceController.clear();
    _productQuantityController.clear();
    _productUnitController.clear();
  }

  void _fetchProducts() {
    BlocProvider.of<FetchProductCubit>(context).fetchProducts();
  }

  @override
  void dispose() {
    _productHSNSACController.dispose();
    _productNameController.dispose();
    _productPriceController.dispose();
    _productQuantityController.dispose();
    _productUnitController.dispose();
    super.dispose();
  }

  void _showAddProductsForm() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) => BlocProvider(
        create: (context) => serviceLocator<AddProductCubit>(),
        child: BlocConsumer<AddProductCubit, AddProductState>(
          listener: (context, state) {
            if (state is AddProductSuccessState) {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                AppSnackBar(message: state.message).build(context),
              );
              _fetchProducts();
              _clearController();
            }
            if (state is AddProductFailureState) {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                AppSnackBar(message: state.message).build(context),
              );
              _clearController();
            }
          },
          builder: (context, state) {
            return AddProductForm(
              productHSNSACController: _productHSNSACController,
              productNameController: _productNameController,
              productPriceController: _productPriceController,
              productQuantityController: _productQuantityController,
              productUnitController: _productUnitController,
              list: [
                DropDownElements(id: "Kg", name: "Kg"),
                DropDownElements(id: "g", name: "Gram (g)"),
                DropDownElements(id: "mg", name: "Milligram (mg)"),
                DropDownElements(id: "quintal", name: "Quintal"),
                DropDownElements(id: "L", name: "Liter (L)"),
                DropDownElements(id: "ml", name: "Milliliter (ml)"),
                DropDownElements(id: "pcs", name: "Pieces (pcs)"),
                DropDownElements(id: "dozen", name: "Dozen"),
                DropDownElements(id: "pack", name: "Pack"),
                DropDownElements(id: "box", name: "Box"),
                DropDownElements(id: "bag", name: "Bag"),
              ],
              onPressed: () {
                BlocProvider.of<AddProductCubit>(context).addProduct(
                  productName: _productNameController.text.trim(),
                  productHsn: _productHSNSACController.text.trim(),
                  productQty: _productQuantityController.text.trim(),
                  productRate: _productPriceController.text.trim(),
                  productUnit: _productUnitController.text.trim(),
                );
              },
              isLoading: state is AddProductLoadingState,
            );
          },
        ),
      ),
    );
  }

  Future<void> getInvoiceId() async {
    final box = serviceLocator<Box<String>>().get("invoice_id");
    invoiceId = box;
  }

  void _showDeleteDialog({
    required String title,
    required String subtitle,
    required String id,
  }) {
    showModalBottomSheet(
      context: context,
      builder: (context) => BlocProvider(
        create: (context) => serviceLocator<DeleteProductCubit>(),
        child: BlocConsumer<DeleteProductCubit, DeleteProductState>(
          listener: (context, state) {
            if (state is DeleteProductSuccessState) {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                AppSnackBar(message: state.message).build(context),
              );
              _fetchProducts();
            }
            if (state is DeleteProductFailureState) {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                AppSnackBar(message: state.message).build(context),
              );
            }
          },
          builder: (context, state) {
            return AppDeleteConfirmationBottomSheet(
              title: title,
              subtitle: subtitle,
              onDeletePressed: () {
                BlocProvider.of<DeleteProductCubit>(context).deleteProduct(
                  productId: id,
                );
              },
            );
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Products"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => PDFScreen(
                    pdfUrl:
                        "https://apmc.http.vithsutra.com/download/invoice/$invoiceId",
                  ),
                ),
              );
            },
            icon: Icon(
              Icons.arrow_forward_ios_rounded,
            ),
          ),
        ],
      ),
      body: BlocBuilder<FetchProductCubit, FetchProductState>(
        builder: (context, state) {
          if (state is FetchProductLoadingState) {
            return ProductLoadingWidget();
          }
          if (state is FetchProductFailureState) {
            return AppErrorWidget(
              errorMessage: state.message,
              onPressed: () {
                _fetchProducts();
              },
            );
          }
          if (state is FetchProductSuccessState && state.product.isEmpty) {
            return AppEmptyWidget(
              errorMessage: "No Products To Display.",
              onPressed: () {
                _fetchProducts();
              },
            );
          }
          if (state is FetchProductSuccessState) {
            return SingleChildScrollView(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Align(
                        alignment: Alignment(-1, 0),
                        child: Text(
                          "Product's",
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Align(
                        alignment: Alignment(-1, 0),
                        child: Text(
                          "Add Products To Invoice",
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return ProductTile(
                          productName: state.product[index].productName,
                          productQuantity: state.product[index].productQuantity,
                          onDeletePressed: () {
                            _showDeleteDialog(
                              title: state.product[index].productName,
                              subtitle: state.product[index].productQuantity,
                              id: state.product[index].productId,
                            );
                          },
                          productPrice: "₹ ${state.product[index].productRate}",
                        );
                      },
                      itemCount: state.product.length,
                    ),
                  ],
                ),
              ),
            );
          }
          return ProductLoadingWidget();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddProductsForm();
        },
        child: Icon(
          Icons.add,
        ),
      ),
    );
  }
}
