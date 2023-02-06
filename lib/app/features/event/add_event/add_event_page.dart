import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:moja_budowa/app/features/event/add_event/cubit/addevent_cubit.dart';
import 'package:moja_budowa/repositories/events_repository.dart';

class AddEventPage extends StatefulWidget {
  const AddEventPage({
    Key? key,
  }) : super(key: key);

  @override
  State<AddEventPage> createState() => _AddeventState();
}

class _AddeventState extends State<AddEventPage> {
  String? _title;
  DateTime? _releaseDate;
  TimeOfDay? _releaseTime;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddeventCubit(EventsRepository()),
      child: BlocListener<AddeventCubit, AddeventState>(
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
        child: BlocBuilder<AddeventCubit, AddeventState>(
          builder: (context, state) {
            return Scaffold(
              appBar: AppBar(
                title: const Text('Dodaj wydarzenie'),
                actions: [
                  IconButton(
                    onPressed: _title == null ||
                            _releaseDate == null ||
                            _releaseTime == null
                        ? null
                        : () {
                            context
                                .read<AddeventCubit>()
                                .add(_title!, _releaseDate!, _releaseTime!);
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
                onTimeChanged: (newValue) {
                  setState(() {
                    _releaseTime = newValue;
                  });
                },
                selectedTimeFormatted: _releaseTime?.toString(),
                onDateChanged: (newValue) {
                  setState(() {
                    _releaseDate = newValue;
                  });
                },
                selectedDateFormatted: _releaseDate == null
                    ? null
                    : DateFormat.yMMMMEEEEd().format(_releaseDate!),
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
    required this.onDateChanged,
    this.selectedDateFormatted,
    required this.onTimeChanged,
    required this.selectedTimeFormatted,
  }) : super(key: key);

  final Function(String) onTitleChanged;
  final Function(DateTime?) onDateChanged;
  final String? selectedDateFormatted;
  final Function(TimeOfDay?) onTimeChanged;
  final String? selectedTimeFormatted;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(
        horizontal: 30,
        vertical: 20,
      ),
      children: [
        TextField(
          onChanged: onTitleChanged,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'przyjazd koparki',
            label: Text('Wydarzenie'),
          ),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () async {
            final selectedDate = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime.now(),
              lastDate: DateTime.now().add(
                const Duration(days: 365 * 10),
              ),
            );
            onDateChanged(selectedDate);
          },
          child: Text(selectedDateFormatted ?? 'Wybierz datę wydarzenia'),
        ),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: () async {
            final selectedTime = await showTimePicker(
              context: context,
              initialTime: TimeOfDay.now(),
              cancelText: 'zamknij',
              confirmText: 'zapisz',
              helpText: 'wybierz godzinę',
            );

            onTimeChanged(selectedTime);
          },
          child: Text(selectedTimeFormatted ?? 'Dodaj godzinę'),
        ),
      ],
    );
  }
}
