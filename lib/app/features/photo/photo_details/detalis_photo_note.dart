import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moja_budowa/app/core/enums.dart';
import 'package:moja_budowa/app/features/photo/photo_details/cubit/details_photo_cubit.dart';
import 'package:moja_budowa/data/photo_remote_data_source.dart';
import 'package:moja_budowa/models/photo_note_model.dart';
import 'package:moja_budowa/repositories/photo_repository.dart';

import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';

class DetalisPhotoNotePage extends StatelessWidget {
  const DetalisPhotoNotePage(
      {required this.id, this.photoNoteModel, super.key});
  final String id;
  final PhotoNoteModel? photoNoteModel;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          DetailsPhotoCubit(PhotoRepository(PhotoRemoteDataSources()))
            ..getPhotoWithID(id),
      child: BlocConsumer<DetailsPhotoCubit, DetailsPhotoState>(
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
              child: Text('Initial state'),
            );
          }
          if (state.status == Status.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state.status == Status.success) {
            if (state.photoNoteModel == null) {
              return const SizedBox.shrink();
            }
          }
          final photoNoteModel = state.photoNoteModel;
          return Scaffold(
              appBar: NewGradientAppBar(
                leading: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Color.fromARGB(255, 56, 55, 55),
                  ),
                ),
                gradient:
                    const LinearGradient(colors: [Colors.cyan, Colors.indigo]),
              ),
              body: Center(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 50),
                      child: Image(
                        image: NetworkImage(
                          photoNoteModel!.photo,
                        ),
                      ),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          context
                              .read<DetailsPhotoCubit>()
                              .remove(documentID: photoNoteModel.id);

                          Navigator.of(context).pop();
                        },
                        child: const Text('Delete'))
                  ],
                ),
              ));
        },
      ),
    );
  }
}
