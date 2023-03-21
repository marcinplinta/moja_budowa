import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moja_budowa/app/features/photo/photo_note/cubit/photo_note_cubit.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class AddPhotoPage extends StatefulWidget {
  const AddPhotoPage({super.key});

  @override
  State<AddPhotoPage> createState() => _AddPhotoPageState();
}

class _AddPhotoPageState extends State<AddPhotoPage> {
  XFile? image;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PhotoNoteCubit, PhotoNoteState>(
      listener: (context, state) {
        if (state.saved) {
          context.read<PhotoNoteCubit>().start();
          Navigator.of(context).pop();
        }
        if (state.errorMessage!.isNotEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.red,
              content: Text(state.errorMessage!),
            ),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
            appBar: AppBar(
              actions: [
                IconButton(
                    onPressed: () {
                      context.read<PhotoNoteCubit>().add(image!);
                    },
                    icon: const Icon(
                      Icons.check,
                    ))
              ],
            ),
            backgroundColor: const Color.fromARGB(235, 213, 228, 241),
            floatingActionButton: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(55),
                  ),
                  child: FloatingActionButton(
                    backgroundColor: Colors.transparent,
                    onPressed: () async {
                      final pickedImage = await ImagePicker().pickImage(
                          source: ImageSource.gallery,
                          maxHeight: 4800,
                          maxWidth: 2600,
                          imageQuality: 95);
                      setState(() {
                        image = pickedImage!;
                      });
                    },
                    child: const Icon(
                      Icons.photo_library,
                      color: Color.fromARGB(255, 56, 55, 55),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 10),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(55),
                    ),
                    child: FloatingActionButton(
                      backgroundColor: Colors.transparent,
                      onPressed: () async {
                        final pickedImage = await ImagePicker().pickImage(
                            source: ImageSource.camera,
                            maxHeight: 4800,
                            maxWidth: 2600,
                            imageQuality: 95);
                        setState(() {
                          image = pickedImage!;
                        });
                      },
                      child: const Icon(
                        Icons.camera_alt,
                        color: Color.fromARGB(255, 56, 55, 55),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            body: Padding(
              padding: const EdgeInsets.only(top: 50),
              child: image == null ? null : Image.file(File(image!.path)),
            ));
      },
    );
  }
}
