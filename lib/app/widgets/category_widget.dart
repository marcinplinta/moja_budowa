import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moja_budowa/app/category/cubit/category_page_cubit.dart';
import 'package:moja_budowa/app/expenses/expenses_page.dart';
import 'package:moja_budowa/models/category_model.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({
    required this.categoryWithSum,
    Key? key,
  }) : super(key: key);
  final CategoryWithSum categoryWithSum;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        await Navigator.of(context).push(
          MaterialPageRoute(
              builder: (_) => ExpensesPage(
                    id: categoryWithSum.categoryModel.id,
                    categoryWithSum: categoryWithSum,
                  )),
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
                      categoryWithSum.categoryModel.title,
                      style: GoogleFonts.lora(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Text(
                    " suma ${categoryWithSum.sumOfExpenses.toString()} zł",
                    style: GoogleFonts.lora(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
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
