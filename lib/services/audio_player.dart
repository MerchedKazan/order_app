import 'package:audioplayers/audioplayers.dart';

class Audio_PLayer{
  final audioPlayer=AudioPlayer();

 Future playAudio()async{
 //   String url="https://audio.mp3";
 // await audioPlayer.play(url);
 final player= AudioCache(prefix: "assets/");
 final url=await player.load("remove.mp3");
 await audioPlayer.setUrl(url.path,isLocal: true);
await audioPlayer.play(
   url.path,
 );
}
}