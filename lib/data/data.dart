import 'package:background_audio/background_audio.dart';

List events = [
  {
    'title': 'Annual Overnight Prayer',
    'date': '31 December 2018',
    'place': 'Faith Ministries Africa',
    'startTime': '22H00',
    'endTime': '04H00',
    'imageUrl': 'assets/images/events1.jpg',
    'fees': 'Free Entry'
  },
  {
    'title': "Women's Workshop",
    'date': '08 March 2019',
    'place': 'Faith Ministries Africa',
    'startTime': '22H00',
    'endTime': '04H00',
    'imageUrl': 'assets/images/events1.jpg',
    'fees': 'Free Entry'
  },
  {
    'title': 'Youth Annual Concert',
    'date': '17 June 2019',
    'place': 'Faith Ministries Africa',
    'startTime': '16H00',
    'endTime': '18H00',
    'imageUrl': 'assets/images/youth.png',
    'fees': 'Free Entry'
  },
];

List sermons = [
  {
    "title": "The Son of God is coming soon",
    "preacher": "Benjamin Lukola",
    "contents":
        "A bright, talented, ambitious and self-motivated Mobile apps, web developer with a strong technical background who possesses self-discipline and the ability to work with the minimum of supervision. Able to play a key role throughout a mobile app development, web apps to ensure maximum accessibility, customer experience and usability.",
    "sermonAudio": "",
    "pubDate": "20 December 2018",
    "imageUrl": "assets/images/AudioBible.jpg"
  },
  {
    "title": "The Son of God is coming soon",
    "preacher": "Benjamin Lukola",
    "contents":
        "A bright, talented, ambitious and self-motivated Mobile apps, web developer with a strong technical background who possesses self-discipline and the ability to work with the minimum of supervision. Able to play a key role throughout a mobile app development, web apps to ensure maximum accessibility, customer experience and usability.",
    "sermonAudio": "",
    "pubDate": "21 December 2018",
    "imageUrl": "assets/images/sermon_1.jpg"
  }
];

List<BackgroundAudioPlaylist> songs = [
  BackgroundAudioPlaylist(
    songs: [
      {
        "id": 0,
        "title":"The Bank Vault",
        "author":"Kaecy Banks",
        //"source":"/storage/5886-18F1/WhatsApp/Media/WhatsApp Audio/AUD-20181005-WA0005.mp3",
        "source":"http://www.noiseaddicts.com/samples_1w72b820/4033.mp3",
        "albumArt":"assets/images/aris.png",
        "pubDate" : "21 December 2018",
      },
      {
        "id": 1,
        "title":"Niama na yo",
        "author":"Youssoupha",
        "source":"/storage/5886-18F1/Music/Polaroid Experience/Youssoupha   niama na yo.mp3",
        "albumArt":"assets/images/sermon_1.jpg",
        "pubDate" : "15 October 2018",
      },
      {
        "id":2,
        "title":"Par amour",
        "author":"Youssoupha",
        "source":"/storage/5886-18F1/Music/Polaroid Experience/Youssoupha   par amour.mp3",
        "albumArt":"assets/images/sermon_1.jpg",
        "pubDate" : "15 October 2018",
      },
      {
        "id":3,
        "title":"Devenir Vieux",
        "author":"Youssoupha",
        "source":"/storage/5886-18F1/Music/Polaroid Experience/Youssoupha   devenir vieux.mp3",
        "albumArt":"assets/images/sermon_1.jpg",
        "pubDate" : "15 October 2018",
      },
      {
        "id":4,
        "title":"Mourir Ensemble",
        "author":"Youssoupha",
        "source":"/storage/5886-18F1/Music/Polaroid Experience/Youssoupha   mourir ensemble.mp3",
        "albumArt":"assets/images/sermon_1.jpg",
        "pubDate" : "15 October 2018",
      },
      {
        "id":5,
        "title":"M'en Aller",
        "author":"Youssoupha",
        "source":"/storage/5886-18F1/Music/Polaroid Experience/Youssoupha   m en aller.mp3",
        "albumArt":"assets/images/sermon_1.jpg",
        "pubDate" : "15 October 2018",
      },
      {
        "id":6,
        "title":"Papaoutai",
        "author":"Stromae",
        "source":"/storage/emulated/0/Download/02-Papaoutai.mp3",
        "albumArt":"assets/images/04-01.jpg",
        "pubDate" : "10 October 2018",
      },
      {
        "id":7,
        "title":"Makolo ya Massiya",
        "author":"Carlyto Lassa",
        "source":"/storage/5886-18F1/Download/Carlyto_Lassa_-_Makolo_ya_massiya_audio[SaveFromss.online].mp3",
        "albumArt":"assets/images/03-01.jpg",
        "pubDate" : "09 October 2018",
      },
      {
        "id":9,
        "title":"Court Circuit",
        "author":"Ferre Gola",
        "source":"/storage/5886-18F1/Download/Ferre Gola - Court circuit.mp3",
        "albumArt":"assets/images/03-02.jpg",
        "pubDate" : "08 October 2018",
      },
    ],
    metadata: {"id": "1", "title": "Aris's Playlist"}
  ),
];

List blog = [
  {
    "title":"Fasting Season",
    "image":"assets/images/teaset.png",
    "pubDate":"25 January 2019",
    "contents":"The fasting season has began let focus on what matters",
  },
  {
    "title":"Youth Gala",
    "image":"assets/images/jumper.png",
    "pubDate":"16 June 2018",
    "contents":"Every year there is a new way of doing things and improving our youth activities",
  },
  {
    "title":"Father's Meeting",
    "image":"assets/images/jacket.png",
    "pubDate":"25 April 2018",
    "contents":"A great opportunities for all young parents to come to learn from olders",
  },
  {
    "title":"Women's workshop",
    "image":"assets/images/top.png",
    "pubDate":"20 May 2018",
    "contents":"All women are called to participate to this great workshop that will be beneficial to all women",
  },
  {
    "title":"Learn a healthy lifestyle",
    "image":"assets/images/cup.png",
    "pubDate":"30 March 2018",
    "contents":"Living healthy is so important to our health",
  },
  {
    "title":"Work of our young talent",
    "image":"assets/images/napkins.png",
    "pubDate":"11 Feb 2018",
    "contents":"Brother John Don has archieve a price of best young design at DUT this year",
  },
  {
    "title":"Back to School",
    "image":"assets/images/backpack.png",
    "pubDate":"28 January 2018",
    "contents":"All Children who are going back to school are called to take part to prayers organise at church",
  },
];