import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:moja_budowa/app/features/cost/pages_add/cubit/add_first_cubit.dart';
import 'package:moja_budowa/repositories/costs_repository.dart';

class AddFirst extends StatefulWidget {
  const AddFirst({
    Key? key,
  }) : super(key: key);

  @override
  State<AddFirst> createState() => _AddFirstState();
}

class _AddFirstState extends State<AddFirst> {
  String? _title;

  DateTime? _date;
  int? _amount;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddFirstCubit(CostsRepository()),
      child: BlocListener<AddFirstCubit, AddFirstState>(
        listener: (context, state) {
          if (state.saved) {
            Navigator.of(context).pop();
          }
          if (state.errorMessage.isNotEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.errorMessage),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        child: BlocBuilder<AddFirstCubit, AddFirstState>(
          builder: (context, state) {
            return Scaffold(
              backgroundColor: const Color.fromARGB(235, 213, 228, 241),
              appBar: AppBar(
                title: const Text('Koszty dokumentacji'),
                actions: [
                  IconButton(
                    onPressed:
                        _title == null || _date == null || _amount == null
                            ? null
                            : () {
                                context.read<AddFirstCubit>().add(
                                      _title!,
                                      _date!,
                                      _amount!,
                                    );
                              },
                    icon: const Icon(Icons.check),
                  ),
                ],
              ),
              body: _AddPageBody(
                onTitleChanged: (newValue) {
                  setState(() {
                    _title = newValue;
                  });
                },
                onAmountChanged: (newValue) {
                  setState(() {
                    _amount = newValue;
                  });
                },
                value: _amount,
                onDateChanged: (newValue) {
                  setState(() {
                    _date = newValue;
                  });
                },
                selectedDateFormatted: _date == null
                    ? null
                    : DateFormat("dd.MM.yyyy").format(_date!),
              ),
            );
          },
        ),
      ),
    );
  }
}

class _AddPageBody extends StatelessWidget {
  const _AddPageBody({
    Key? key,
    required this.onTitleChanged,
    required this.onAmountChanged,
    required this.onDateChanged,
    this.selectedDateFormatted,
    int? value,
  }) : super(key: key);

  final Function(String) onTitleChanged;
  final Function(DateTime?) onDateChanged;
  final String? selectedDateFormatted;
  final Function(int) onAmountChanged;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(
        horizontal: 30,
        vertical: 20,
      ),
      children: [
        TextField(
          minLines: 1,
          maxLines: 4,
          onChanged: onTitleChanged,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'adaptacja projektu',
            label: Text('rodzaj usługi/materiału'),
          ),
        ),
        const SizedBox(height: 10),
        TextField(
          onChanged: ((value) {
            onAmountChanged(int.parse(value));
          }),
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
            FilteringTextInputFormatter.digitsOnly
          ],
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'cena',
            label: Text('podaj kwotę'),
          ),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            fixedSize: const Size(180, 40),
            backgroundColor: const Color.fromARGB(255, 162, 222, 240),
          ),
          onPressed: () async {
            final selectedDate = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(2010, 01, 01),
              lastDate: DateTime.now().add(
                const Duration(days: 365 * 10),
              ),
            );
            onDateChanged(selectedDate);
          },
          child: Text(
            selectedDateFormatted ?? ' data zakupu',
            style: GoogleFonts.kanit(color: Colors.black, fontSize: 16),
          ),
        ),
      ],
    );
  }
}
