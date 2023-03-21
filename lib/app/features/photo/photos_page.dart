// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:moja_budowa/app/core/enums.dart';
// import 'package:moja_budowa/app/features/photo/cubit/photo_cubit.dart';
// import 'package:moja_budowa/models/photo_note_model.dart';
// import 'package:moja_budowa/repositories/photo_repository.dart';

// class PhotosPage extends StatelessWidget {
//   const PhotosPage({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Zdjęcia'),
//       ),
//       body: const PhotosPageBody(),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {},
//         child: const Icon(Icons.add),
//       ),
//       backgroundColor: const Color.fromARGB(235, 213, 228, 241),
//     );
//   }
// }

// class PhotosPageBody extends StatelessWidget {
//   const PhotosPageBody({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => PhotoCubit(PhotoRepository())..start(),
//       child: BlocConsumer<PhotoCubit, PhotoState>(
//         listener: (context, state) {
//           if (state.status == Status.error) {
//             final errorMessage = state.errorMessage ?? "Wystąpił nieznany błąd";
//             ScaffoldMessenger.of(context).showSnackBar(
//               SnackBar(
//                 content: Text(errorMessage),
//                 backgroundColor: Colors.red,
//               ),
//             );
//           }
//         },
//         builder: (context, state) {
//           final photoModels = state.photos;

//           if (state.status == Status.loading) {
//             return const CircularProgressIndicator();
//           }

//           return ListView(
//             padding: const EdgeInsets.symmetric(
//               vertical: 20,
//             ),
//             children: [
//               for (final photoModel in photoModels)
//                 Dismissible(
//                   key: ValueKey(photoModel.id),
//                   background: const DecoratedBox(
//                     decoration: BoxDecoration(
//                       color: Colors.red,
//                     ),
//                     child: Align(
//                       alignment: Alignment.centerRight,
//                       child: Padding(
//                         padding: EdgeInsets.only(right: 32.0),
//                         child: Icon(
//                           Icons.delete,
//                         ),
//                       ),
//                     ),
//                   ),
//                   confirmDismiss: (direction) async {
//                     return direction == DismissDirection.endToStart;
//                   },
//                   onDismissed: (direction) {
//                     context
//                         .read<PhotoCubit>()
//                         .remove(documentID: photoModel.id);
//                   },
//                   child: _ListViewPhoto(
//                     photoModel: photoModel,
//                   ),
//                 ),
//             ],
//           );
//         },
//       ),
//     );
//   }
// }

// class _ListViewPhoto extends StatelessWidget {
//   const _ListViewPhoto({
//     Key? key,
//     required this.photoModel,
//   }) : super(key: key);

//   final PhotoModel photoModel;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(15),
//       ),
//       child: Padding(
//         padding: const EdgeInsets.only(
//           left: 5,
//           right: 5,
//           top: 5,
//         ),
//         child: Image(image: NetworkImage(photoModel.photo)),
//       ),
//     );
//   }
// }
