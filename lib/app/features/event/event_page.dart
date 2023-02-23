import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moja_budowa/app/core/enums.dart';
import 'package:moja_budowa/app/features/event/add_event/add_event_page.dart';
import 'package:moja_budowa/app/features/event/cubit/event_cubit.dart';
import 'package:moja_budowa/models/event_model.dart';
import 'package:moja_budowa/repositories/events_repository.dart';

class EventPage extends StatelessWidget {
  const EventPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wydarzenia'),
      ),
      body: const EventPageBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const AddEventPage(),
              fullscreenDialog: true,
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
      backgroundColor: const Color.fromARGB(235, 213, 228, 241),
    );
  }
}

class EventPageBody extends StatelessWidget {
  const EventPageBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EventCubit(EventsRepository())..start(),
      child: BlocConsumer<EventCubit, EventState>(
        listener: (context, state) {
          if (state.status == Status.error) {
            final errorMessage = state.errorMessage ?? "Wystąpił nieznany błąd";
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(errorMessage),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        builder: (context, state) {
          final eventModels = state.events;

          if (state.status == Status.loading) {
            return const CircularProgressIndicator();
          }

          return ListView(
            padding: const EdgeInsets.symmetric(
              vertical: 20,
            ),
            children: [
              for (final eventModel in eventModels)
                Dismissible(
                  key: ValueKey(eventModel.id),
                  background: const DecoratedBox(
                    decoration: BoxDecoration(
                      color: Colors.red,
                    ),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: EdgeInsets.only(right: 32.0),
                        child: Icon(
                          Icons.delete,
                        ),
                      ),
                    ),
                  ),
                  confirmDismiss: (direction) async {
                    return direction == DismissDirection.endToStart;
                  },
                  onDismissed: (direction) {
                    context
                        .read<EventCubit>()
                        .remove(documentID: eventModel.id);
                  },
                  child: _ListViewEvent(
                    eventModel: eventModel,
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}

class _ListViewEvent extends StatelessWidget {
  const _ListViewEvent({
    Key? key,
    required this.eventModel,
  }) : super(key: key);

  final EventModel eventModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 30,
      ),
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: Color.fromARGB(164, 6, 43, 124),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          eventModel.title,
                          style: const TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          eventModel.releaseDateFormatted(),
                          style: const TextStyle(
                            color: Color.fromARGB(242, 163, 250, 2),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Color.fromARGB(251, 243, 6, 6),
                  ),
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Text(
                        eventModel.daysLeft().toString(),
                        style: const TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Text('pozostało dni'),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
