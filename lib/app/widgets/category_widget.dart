import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moja_budowa/app/expenses/expenses_page.dart';
import 'package:moja_budowa/models/category_model.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({
    required this.categoryModel,
    Key? key,
  }) : super(key: key);
  final CategoryModel categoryModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (_) => ExpensesPage(id: categoryModel.id)),
        );
      },
      child: Row(
        children: [
          Expanded(
            child: Container(
              color: Colors.cyan,
              padding: const EdgeInsets.all(15),
              margin: const EdgeInsets.all(3),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      categoryModel.title,
                      style: GoogleFonts.arimo(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const Icon(
                    Icons.arrow_right,
                    color: Colors.black,
                    size: 20,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
