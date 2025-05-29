import 'package:ecom_print_store/ui/home/categories_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../filter_by_price_product_controller.dart';

class ShopSidebar extends StatelessWidget {
  CategoriesController categoriesController;
  FilterByPriceProductController filterByPriceProductController;
   ShopSidebar({super.key,required this.categoriesController,required this.filterByPriceProductController});

  final double _minValue = 50;
  final double _maxValue = 150;

  @override
  Widget build(BuildContext context) {
    double sliderValue = 15;
    RangeValues _currentRangeValues =  RangeValues(_minValue, _maxValue);



    return  Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Shop',
              style: TextStyle(
                color: Colors.redAccent,
                fontSize: 36,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 24),
            Divider(thickness: 1, color: Colors.grey[300]),
            const SizedBox(height: 24),
            Text(
              'Filter by price',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 8),
            StatefulBuilder(
              builder: (context, setState) {
                return Column(
                  children: [
                    RangeSlider(
                      values: _currentRangeValues,
                      min: 0,
                      max: 5000,
                      divisions: 100,
                      activeColor: Colors.red,       // This controls the selected range color (thumb + track)
                      inactiveColor: Colors.red[100],
                      labels: RangeLabels(
                        '₹${_currentRangeValues.start.round()}',
                        '₹${_currentRangeValues.end.round()}',
                      ),
                      onChanged: (RangeValues values) {
                        setState(() {
                          _currentRangeValues = values;
                        });
                      },
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        '₹${_currentRangeValues.start} to ${_currentRangeValues.end}',
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
            const SizedBox(height: 8),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                onPressed: () {
                  filterByPriceProductController.fetchProductsByPriceRange(
                    minPrice: _minValue,
                    maxPrice: _maxValue,
                  );
                },
                child: const Text(
                  'APPLY',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 32),
            const Text(
              'Categories',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Obx(() {
              if (categoriesController.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              }

              if (categoriesController.products.isEmpty) {
                return const Center(child: Text("No categories found"));
              }

              print("ProductsLength : "+categoriesController.products.length.toString());

             return ListView.builder(
                itemCount: categoriesController.products.length,
                itemBuilder:  (context, index) {
                  final categories = categoriesController.products[index];

                  return  CategoryItem(name: categories['name'], count: categories['count']??0);
                },
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
              );
            }),



            const Spacer(),
            const Text(
              'Showing 1–9 of 15 results  Default sorting',
              style: TextStyle(
                fontSize: 14,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 8),
          ],
        ),
      );
  }
}

class CategoryItem extends StatelessWidget {
  final String name;
  final int count;

  const CategoryItem({super.key, required this.name, required this.count});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            name,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.redAccent,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            '($count)',
            style: const TextStyle(
              fontSize: 16,
              color: Colors.black54,
            ),
          ),
        ],
      ),
    );
  }
}
