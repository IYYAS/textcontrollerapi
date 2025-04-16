import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

import '../model/model.dart';

part 'names_state.dart';

class NamesCubit extends Cubit<NamesState> {

  NamesCubit() : super(NamesInitial());


  final TextEditingController name = TextEditingController();

  getname()async{
    emit(Namesloading());
  final   url =  "https://api.agify.io/?name=${name.text}";
  final response = await http.get(Uri.parse(url));
  if (response.statusCode == 200){
   final data = welcomeFromJson(response.body);
     emit(Namesloaded(data: data));
  }else{
   emit(Nameserror(error: "errorrr"));
  }
  }
}
