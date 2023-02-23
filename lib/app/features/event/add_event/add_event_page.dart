import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
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
              backgroundColor: const Color.fromARGB(235, 213, 228, 241),
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
                // selectedTimeFormatted: _releaseTime == null
                //     ? null
                //     : DateFormat("HH:mm").format(_releaseTime!),
                onDateChanged: (newValue) {
                  setState(() {
                    _releaseDate = newValue;
                  });
                },
                selectedDateFormatted: _releaseDate == null
                    ? null
                    : DateFormat("dd.MM.yyyy").format(_releaseDate!),
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
          minLines: 1,
          maxLines: 4,
          onChanged: onTitleChanged,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'przyjazd koparki',
            label: Text('Wydarzenie'),
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
              cancelText: 'zamknij',
              confirmText: 'zapisz',
              helpText: 'wybierz datę',
              initialDate: DateTime.now(),
              firstDate: DateTime.now(),
              lastDate: DateTime.now().add(
                const Duration(days: 365 * 10),
              ),
            );
            onDateChanged(selectedDate);
          },
          child: Text(
            selectedDateFormatted ?? 'Wybierz datę wydarzenia',
            style: GoogleFonts.kanit(color: Colors.black, fontSize: 16),
          ),
        ),
        const SizedBox(height: 10),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            fixedSize: const Size(180, 40),
            backgroundColor: const Color.fromARGB(255, 162, 222, 240),
          ),
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
          child: Text(
            selectedTimeFormatted ?? 'Dodaj godzinę',
            style: GoogleFonts.kanit(color: Colors.black, fontSize: 16),
          ),
        ),
      ],
    );
  }
}
