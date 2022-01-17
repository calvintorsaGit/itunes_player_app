import 'package:flutter/material.dart';
import 'package:itunes_player_app/bloc/itunes/itunes_bloc.dart';
import 'package:provider/provider.dart';

class ArtistSearchBox extends StatelessWidget {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {

    controllerListener(context);

    return Container(
      height: 80,
      padding: EdgeInsets.symmetric(vertical: 20),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
          hintText: 'Find Artist / Song',
          fillColor: Colors.white,
          filled: true,
          contentPadding:
          new EdgeInsets.symmetric(vertical: 0.0, horizontal: 10),
          suffixIcon: IconButton(
            onPressed: controller.clear,
            icon: Icon(Icons.clear),
          ),
        ),
      ),
    );
  }


  controllerListener(BuildContext context) {

    controller.addListener(() {
      String token = controller.text.trim();
      if (token == controller.text.trim() && token.length > 1) {
          try {
            context.read<ItunesBloc>().add(GetSongListEvent(search: token));
          } catch (e) {
            controller.text = "";
          }
        }
    });
  }
}
