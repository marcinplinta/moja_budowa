import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moja_budowa/app/features/event/add_event/add_event_page.dart';
import 'package:moja_budowa/app/features/event/cubit/event_cubit.dart';

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
      create: (context) => EventCubit()..start(),
      child: BlocBuilder<EventCubit, EventState>(
        builder: (context, state) {
          final docs = state.events?.docs;
          if (docs == null) {
            return const SizedBox.shrink();
          }
          return ListView(
            padding: const EdgeInsets.symmetric(
              vertical: 20,
            ),
            children: [
              for (final doc in docs)
                Dismissible(
                  key: ValueKey(doc.id),
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
                    // only from right to left
                    return direction == DismissDirection.endToStart;
                  },
                  onDismissed: (direction) {
                    context.read<EventCubit>().remove(documentID: doc.id);
                  },
                  child: _ListViewEvent(
                    document: doc,
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
    required this.document,
  }) : super(key: key);

  final QueryDocumentSnapshot<Map<String, dynamic>> document;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 30,
      ),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.black12,
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
                          document['title'],
                          style: const TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          (document['release_date'] as Timestamp)
                              .toDate()
                              .toString(),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.white70,
                  ),
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: const [
                      Text(
                        '0',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text('days left'),
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