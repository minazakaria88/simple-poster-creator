

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poster/appcubit/state.dart';

class AppCubit extends Cubit<AppState>
{
  AppCubit():super(InitState());

  static AppCubit get(context)=>BlocProvider.of(context);

  TextEditingController text=TextEditingController();
  TextEditingController textColor=TextEditingController();
  TextEditingController backgroundColor=TextEditingController();

  String imageUrl='';
  void createPoster()
  {
    String image='https://img.bruzu.com/?bg=${backgroundColor.text}&h=600&w=500&a.type=textBox'
        ' &a.text=${text.text}&a.fontFamily=Inter&'
        'a.fontWeight=800&a.color=${textColor.text}';

    imageUrl=image;

  }


}