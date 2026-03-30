import 'package:bloc/bloc.dart';
import 'package:book_stroe/features/register/data/auth_repo.dart';
import 'package:meta/meta.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

 Future<void> login({required String email,required String password})async{
    emit(AuthLoadingState());
   final response=await AuthRepo.login(email: email, password: password);
  if(response){
    emit(AuthSuccessState());
  }else{
    emit(AuthErrorState());
  }
  }

Future<void> register({required String name,required String email, required String password,required String confirmPassword})async{
   emit(AuthLoadingState());
   final response=await AuthRepo.register(name: name, email: email, confirmPassword: confirmPassword, password: password);
   if(response){
     emit(AuthSuccessState());
   }else{
     emit(AuthErrorState());
   }
}
}
