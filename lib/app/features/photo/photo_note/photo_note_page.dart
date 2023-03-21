import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moja_budowa/app/core/enums.dart';
import 'package:moja_budowa/app/features/photo/photo_note/add_photo_page.dart';
import 'package:moja_budowa/app/features/photo/photo_note/cubit/photo_note_cubit.dart';
import 'package:moja_budowa/app/widgets/photo_widget.dart';
import 'package:moja_budowa/data/photo_remote_data_source.dart';
import 'package:moja_budowa/models/photo_note_model.dart';
import 'package:moja_budowa/repositories/photo_repository.dart';

class PhotoNotePage extends StatelessWidget {
  const PhotoNotePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          PhotoNoteCubit(PhotoRepository(PhotoRemoteDataSources()))..start(),
      child: BlocConsumer<PhotoNoteCubit, PhotoNoteState>(
        listener: (context, state) {
          if (state.status == Status.error) {
            final errorMessage = state.errorMessage ?? 'Unkown error';
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(errorMessage),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        builder: (context, state) {
          if (state.status == Status.initial) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state.status == Status.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state.status == Status.success) {
            final photoNoteModels = state.photos;
            return ViewPage(photoNoteModels: photoNoteModels);
          }

          return const ViewPage(
            photoNoteModels: [],
          );
        },
      ),
    );
  }
}

class ViewPage extends StatelessWidget {
  const ViewPage({
    Key? key,
    required this.photoNoteModels,
  }) : super(key: key);

  final List<PhotoNoteModel> photoNoteModels;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Zdjęcia budowy'),
      ),
      body: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        children: [
          for (final photoNoteModel in photoNoteModels) ...[
            PhotoWidget(photoNoteModel: photoNoteModel),
          ]
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (_) => BlocProvider.value(
                    value: context.read<PhotoNoteCubit>(),
                    child: const AddPhotoPage(),
                  )));
        },
        child: const Icon(Icons.add),
      ),
      backgroundColor: const Color.fromARGB(235, 213, 228, 241),
    );
  }
}
