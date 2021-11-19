void main(List<String> args) {
  AudioPlayer audioPlayer = AudioPlayer();

  audioPlayer.play("mp3", "beyond the horizon.mp3");
  audioPlayer.play("mp4", "alone.mp4");
  audioPlayer.play("vlc", "far far away.vlc");
  audioPlayer.play("avi", "mind me.avi");
}

class MediaPlayer {
  void play(String audioType, String fileName) {}
}

class AdvancedMediaPlayer {
  void playVlc(String fileName) {}
  void playMp4(String fileName) {}
}

class VlcPlayer implements AdvancedMediaPlayer {
  @override
  void playMp4(String fileName) {}

  @override
  void playVlc(String fileName) {
    print("Playing vlc file. Name:  $fileName ");
  }
}

class Mp4Player implements AdvancedMediaPlayer {
  @override
  void playMp4(String fileName) {
    print("Playing mp4 file. Name:  $fileName");
  }

  @override
  void playVlc(String fileName) {}
}

class MediaAdapter implements MediaPlayer {
  late AdvancedMediaPlayer advancedMusicPlayer;

  MediaAdapter(String audioType) {
    if (audioType == "vlc") {
      advancedMusicPlayer = VlcPlayer();
    } else if (audioType == "mp4") {
      advancedMusicPlayer = Mp4Player();
    }
  }
  @override
  void play(String audioType, String fileName) {
    if (audioType == "vlc") {
      advancedMusicPlayer.playVlc(fileName);
    } else if (audioType == "mp4") {
      advancedMusicPlayer.playMp4(fileName);
    }
  }
}

class AudioPlayer implements MediaPlayer {
  late MediaAdapter mediaAdapter;
  @override
  void play(String audioType, String fileName) {
    if (audioType == "mp3") {
      print("Playing mp3 file. Name: $fileName");
    } else if (audioType == "vlc" || audioType == "mp4") {
      mediaAdapter = MediaAdapter(audioType);
      mediaAdapter.play(audioType, fileName);
    } else {
      print("Invalid media.  $audioType format not supported");
    }
  }
}
