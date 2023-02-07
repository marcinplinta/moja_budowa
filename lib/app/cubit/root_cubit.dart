import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:moja_budowa/app/core/enums.dart';
import 'package:moja_budowa/repositories/login_repository.dart';

part 'root_state.dart';

class RootCubit extends Cubit<RootState> {
  RootCubit(this._loginRepository) : super(const RootState());

  final LoginRepository _loginRepository;

  Future<void> register(
      {required String email, required String password}) async {
    try {
      await _loginRepository.register(email: email, password: password);
      emit(
        const RootState(status: Status.success),
      );
    } catch (error) {
      emit(
        RootState(
          user: null,
          status: Status.error,
          errorMessage: error.toString(),
        ),
      );
    }
  }

  Future<void> signIn({required String email, required String password}) async {
    try {
      await _loginRepository.signIn(email: email, password: password);
      emit(
        const RootState(status: Status.success),
      );
    } catch (error) {
      emit(
        RootState(
          user: null,
          status: Status.error,
          errorMessage: error.toString(),
        ),
      );
    }
  }

  Future<void> signOut() async {
    _loginRepository.signOut();
    emit(
      const RootState(status: Status.success),
    );
  }

  Future<void> signInAn() async {
    _loginRepository.signInAn();
    emit(
      const RootState(status: Status.success),
    );
  }

  Future<void> creatingAccount() async {
    emit(
      const RootState(
        user: null,
        isCreatingAccount: true,
      ),
    );
  }

  Future<void> notCreatingAccount() async {
    emit(
      const RootState(
        user: null,
        isCreatingAccount: false,
      ),
    );
  }

  StreamSubscription? _streamSubscription;

  Future<void> singOut() async {
    FirebaseAuth.instance.signOut();
  }

  Future<void> start() async {
    emit(
      const RootState(
        user: null,
        status: Status.initial,
        isCreatingAccount: false,
        errorMessage: '',
      ),
    );

    _streamSubscription = _loginRepository.authState().listen(
      (user) {
        emit(
          RootState(
            user: user,
          ),
        );
      },
    )..onError(
        (error) {
          emit(RootState(
            status: Status.error,
            errorMessage: error.toString(),
          ));
        },
      );
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
