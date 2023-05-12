import 'package:flutter/material.dart';

import '../dummy_data.dart';
import '../widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DeliMeal'),
      ),
      body: GridView(
        padding: const EdgeInsets.all(25),

        //! IMPORTANT ************
        children: DUMMY_CATEGORIES//! DUMMY CATEGORIES IS A LIST OF ITEM STORED IN DUMMY_DATA.DART
            .map(
              (catData) => CategoryItem(//! CATDATA IS JUST A CONSTANT
                    catData.id,
                    catData.title,
                    catData.color,
                  ),
            )
            .toList(),
            //! ************
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
      ),
    );
  }
}
