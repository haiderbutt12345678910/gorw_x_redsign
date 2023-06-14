import 'package:flutter_application_growx_new_design/Features/Domain/UseCases/AuthUseCases/isloggedin_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../BlocStates/bloc_states.dart';

class IsLoggedInCubit extends Cubit<BlocStates> {
  IsLoggedInUseCase isLoggedInUseCase;
  bool? isLoggedInLocalVar;

  IsLoggedInCubit({required this.isLoggedInUseCase}) : super(Initial());

  Future<void> isLoggedIn() async {
    try {
      await isLoggedInUseCase.isLoggedIn().then((value) {
        isLoggedInLocalVar = value;
      });
    } on Exception catch (_) {}
  }

  bool? isLoggedInLocal() {
    return isLoggedInLocalVar;
  }
}
