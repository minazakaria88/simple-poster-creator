
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poster/appcubit/cubit.dart';
import 'package:poster/appcubit/state.dart';
import 'package:poster/posterscreen.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>AppCubit(),
      child: BlocConsumer<AppCubit,AppState>(
        listener: (context, state) {

        },
        builder: (context, state) {
          var cubit=AppCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: const Text(
                'poster',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                ),
              ),
            ),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'poster details',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  newTextForm(
                    controller: cubit.text,
                      label: 'poster text'
                  ),
                  newTextForm(
                      controller: cubit.textColor,
                      label: 'poster textColor'
                  ),
                  newTextForm(
                      controller: cubit.backgroundColor,
                      label: 'poster backgroundColor'
                  ),
                  Center(
                    child: MaterialButton(
                      color: Colors.blue,
                      child: const Text(
                        'create poster',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                        ),
                      ),
                        onPressed: (){
                        cubit.createPoster();
                        String image=cubit.imageUrl;
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => PosterScreen(image),)
                          );
                        },
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

Widget newTextForm({
  String ? label,
  TextEditingController ? controller,
})=> Padding(
  padding: const EdgeInsets.all(8.0),
  child: TextFormField(
    controller: controller,
    decoration:   InputDecoration(
      labelText: label,
      border: const OutlineInputBorder(),
    ),
  ),
);
