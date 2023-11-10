/*
Create a simple quiz application using oop that allows users to play and view
their score. 
*/
import 'dart:io';

class Question {
  final String text;
  final List<String> chic;
  final String answer;

  const Question(this.text, this.chic, this.answer);
}

class Player {
  String nickName;
  int _scor = 0;

  Player(this.nickName);

  int get scor => _scor;
  int setscor(int scor) => _scor = scor;
}

void clearTerminal() {
  for (var i = 0; i < 20; i++) {
    print("\n");
  }
}

int menu() {
  print(
      "*" * 15 + "  Bilmeden Kazanamazsın Oyunumuza Hoşgeldiniz  " + "*" * 15);

  ///listLeaderboard();
  print("""\n
  1 - Oyuna Başla
  2 - Liderlik Tablosunu Görüntüle
  3 - Çıkış
  """);
  List<String> trueS = ["1", "2", "3"];
  String? answer;
  do {
    stdout.write("Seçiminizi giriniz : ");
    answer = stdin.readLineSync().toString();
  } while (!trueS.contains(answer));
  return int.parse(answer);
}

void startGame() {
  for (var i = 0; i < Questions.length; i++) {
    if (showQuestion(i)) {
      currentPlayer!.setscor(currentPlayer!.scor + 5);
      print("doğru cevap tebrikler ${currentPlayer!.nickName}");
      sleep(Duration(seconds: 1));
    } else {
      print(
          "${currentPlayer!.nickName} Maalesef yanlış cevap Doğrusu => ${Questions[i].answer}");
      sleep(Duration(seconds: 1, milliseconds: 500));
    }
    clearTerminal();
  }
  showStatus();
}

void listLeaderboard() {
  if (lastPlayer.isEmpty) {
    print("\nLiderlik Tablosu Boş");
  } else {
    print(" " * 10 + "<<=== Mevcut Liderlik Tablosu ===>>");
    print("Oyuncu Adı" + " " * 10 + "Skor");
    lastPlayer.sort((a, b) => a.scor.compareTo(b.scor));
    for (Player temp in lastPlayer) {
      print(temp.nickName.length > 20
          ? temp.nickName.substring(0, 19)
          : temp.nickName +
              " " * (20 - temp.nickName.length) +
              temp.scor.toString());
    }
    print("\n");
  }
}

void showStatus() {
  clearTerminal();
  print(
      "Sayın Oyuncumuz ${currentPlayer!.nickName} Skorunuz ${currentPlayer!.scor}");
  listLeaderboard();
}

void loadQuestions() {
  Questions.addAll([
    Question("Bir Gün Kaç Saniyedir?", ["86000 ", "88600 ", "86400 ", "84800"],
        "86400 "),
    Question("Aspirinin ilk kez çıkış yılı nedir?",
        ["1920", "1870", "1899", "1453"], "1899"),
    Question("Geminin baş kısmının adı nedir?",
        ["Sancak", "Pruva", "Güverte", "İskele"], "Pruva"),
    Question(
        "Hangi gezegen Güneş Sistemi'nde 'Kırmızı Gezegen' olarak da bilinir?",
        ["Venüs", "Mars", "Jüpiter", "Uranüs"],
        "Mars"),
    Question("Hangi ülke, 'Tango'nun doğum yeri' olarak kabul edilir?",
        ["Arjantin", "Brezilya", "İspanya", "Fransa"], "Arjantin"),
    Question(
        "Hangi ünlü ressam 'Starry Night' ve 'The Starry Night' gibi eserlerle tanınır?",
        [
          "Leonardo da Vinci",
          "Vincent van Gogh",
          "Pablo Picasso",
          "Claude Monet"
        ],
        "Vincent van Gogh"),
    Question(
        "Hangi ünlü yazar, 'Savaş ve Barış' ve 'Anna Karenina' gibi önemli eserlere imza atmıştır?",
        ["Fyodor Dostoyevski", "Franz Kafka", "Leo Tolstoy", "Charles Dickens"],
        "Leo Tolstoy"),
    Question(
        "Futbol sahasının büyüklüğü ne kadardır",
        [
          "55 metre x 100 metre",
          "68 metre x 150 metre",
          "50 metre x 100 metre",
          "30 metre x 75 metre"
        ],
        "50 metre x 100 metre"),
    Question(
        "Divan edebiyatında şairler hakkında bilgi veren eserlere ne ad verilir?",
        ["Tezkire", "Hilye", "Cönk", "keyfel"],
        "Tezkire"),
    Question(
        "Cep telefonuyla iletişim olanağından uzak kalma korkusuna ne ad verilir?",
        ["Agorafobi", "Nomofobi", "Sosyofobi", "Klostrofobi"],
        "Nomofobi"),
    Question(
        "Bölme işaretini kim bulmuştur?",
        ["Harezmi", "Johann Rahn", "Kenneth E. Iverson", "John Wallis"],
        "Johann Rahn"),
    Question("Hangi İlimizde Demiryolu Yoktur",
        ["Batman", "Kütahya ", "Aydın ", "Muğla"], "Muğla"),
    Question(
        "Atatürk'ün Türkçeye kazandırdığı terimlerden 'kaim zaviyeli müselles' ne anlama gelmektedir?",
        ["Karekök", "Paralelkenar", "Daire", "Dik üçgen"],
        "Dik üçgen"),
    Question(
        "Didem ve Mina'nın arasında 3 kişi olan bir kuyrukta Didem baştan 3. sıra, Mina sondan 2. sırada ise kuyruk kaç kişiliktir?",
        ["12", "9", "10", "8"],
        "8"),
    Question(
        "Bilge Kül Kağan hangi Türk devletinin kurucusudur?",
        [
          "Büyük Selçuklu Devleti",
          "Hazar Kağanlığı",
          "Göktürk Kağanlığı",
          "Uygur Kağanlığı"
        ],
        "Uygur Kağanlığı"),
    Question("En fazla sınır komşusuna sahip olan ülke hangisidir?",
        ["Türkiye", "Rusya", "Çin", "Brezilya"], "Çin"),
    Question("Osmanlı’da Lale devri hangi padişah döneminde yaşamıştır?",
        ["III. Ahmet", "IV. Murat", "III. Selim", "II. Mehmet"], "III. Ahmet"),
    Question(
        "Osmanlı Devleti'nin ilk resmi gazetesi nedir?",
        [
          "Ceride-i Havadis",
          "Takvim-i Vekayi",
          "Tercüman-ı Ahval",
          "Tasvir-i Efkar"
        ],
        "Takvim-i Vekayi"),
    Question("Dünyada bilinen en eski enstrüman hangisidir?",
        ["Gitar", "Flüt", "Tef", "Davul"], "Flüt"),
    Question("Kıbrıs Barış harekatı hangi tarihte gerçekleşmiştir?",
        ["1970", "1972", "1974", "1976"], "1974"),
  ]);
}

bool showQuestion(int index) {
  Question tempQ = Questions[index];
  print((index + 1).toString() + "-" + tempQ.text);
  print("A) " +
      tempQ.chic[0] +
      " " * 5 +
      "B) " +
      tempQ.chic[1] +
      " " * 5 +
      "C) " +
      tempQ.chic[2] +
      " " * 5 +
      "D) " +
      tempQ.chic[3] +
      "\n");
  List<String> trueAnswers = ["A", "B", "C", "D"];
  String? answer;
  while (true) {
    stdout.write("Cevabınızı giriniz : ");
    answer = stdin.readLineSync().toString().toUpperCase();
    if (answer.length == 1 && trueAnswers.contains(answer)) {
      break;
    }
  }
  return tempQ.chic[trueAnswers.indexOf(answer)] == tempQ.answer ? true : false;
}

void createPlayer() {
  stdout.write("Oyuncu Adını Giriniz :");
  currentPlayer = Player(stdin.readLineSync().toString());
  lastPlayer.add(currentPlayer!);
}

Player? currentPlayer;
List<Player> lastPlayer = [];
List<Question> Questions = [];
void main() {
  clearTerminal();
  loadQuestions();
  while (true) {
    int choice = menu();
    switch (choice) {
      case 1:
        createPlayer();
        clearTerminal();
        startGame();
        break;
      case 2:
        clearTerminal();
        listLeaderboard();
        break;
      case 3:
        exit(1);
      default:
        break;
    }
  }
}
