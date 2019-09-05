import 'package:uuid/uuid.dart';

class Post {
  // 唯一id
  String id = Uuid().v1();

  // 文章标题
  String title;

  // 文章内容
  String content;

  // 作者名字
  String author;

  // 作者头像
  String icon;

  // 标签
  String tag;

  // 时间
  String dateTime;

  // 评论
  List<Comment> comments;

  Post(this.title, this.content, this.author, this.icon,
      this.tag, this.dateTime, this.comments);
}

class Comment {
  String id;
  String author;
  String icon;
  String content;
  DateTime time;

  Comment(
      {this.id,
      this.author,
      this.icon,
      this.content,
      this.time});
}

final List<Post> posts = [
  Post(
      'To the divided steak add bagel, margerine, iced tea andTo the divided steak add bagel, margerine, iced tea andTo the divided steak add bagel, margerine, iced tea and ',
      'My friends of the Syrian diaspora who were already in the U.K. had categorized the banks for me. First was the “there-is-no-fucking-way-for-you-Syrian-asshole-to-be-with-us” category, the ones who would refuse to even give you an appointment once they knew of your nationality. Next there was the “we-dont-need-your-damn-business-and-its-headache-but-we-are-too-nice-to-kick-your-sorry-ass-out-of-the-door-right-away” category, the ones who might give you an appointment after a month of waiting, then after another month, would tell you that your request had been denied by management or HQ without any justification. As a result, you end up having an account with a bank in the “we-are-too-big-to-care-or-too-small-to-refuse-any-customer-but-be-aware-that-you-can-be-kicked-out-at-any-moment-without-prior-notice” category.',
      'LENTIA ',
      'https://image.xiaomo.info/logo/avatar.png',
      'flutter',
      '${DateTime.now().hour}:${DateTime.now().minute}',
      comments),
  Post(
      'Shores sing with endurance!Remember: breaked shrimps taste best when sliceedShores sing with endurance!Remember: breaked shrimps taste best when sliceedShores sing with endurance!Remember: breaked shrimps taste best when sliceed ',
      'What usually happens is that the previously smiling official behind their nice desk with cameras and thumb scanners suddenly realizes the country name on your passport, immediately drops the smile, and becomes grumpy and jumpy. Once I even heard someone whispering “Oh shit, not another Syrian!”',
      'MUSA ',
      'https://image.xiaomo.info/logo/avatar.png',
      'flutter',
      '${DateTime.now().hour}:${DateTime.now().minute}',
      comments),
  Post(
      'Collision course at the habitat oddlyred alert was the para ',
      'Witnessing these reactions usually means one thing: the normally two-minute process of checking your visa and stamping your passport turns into an excruciatingly slow process of overly examining your passport, checking every visa, and counting all the stamps. All this is done with nervousness and carelessness, threatening to tear every page of the document, and breaking your heart along the way, since you know how much time and money it will cost to get a new one.',
      'CIRPI ',
      'https://image.xiaomo.info/logo/avatar.png',
      'flutter',
      '${DateTime.now().hour}:${DateTime.now().minute}',
      comments),
  Post(
      'It is an evil friendship, sir.All chilIt is an evil friendship, sir.All chilIt is an evil friendship, sir.All chil ',
      'Collision course at the habitat oddlyred alert was the paralyShores sing with endurance!Remember: breaked shrimps taste best when sliceed in a basin brushed with butter.Shores sing with endurance!Remember: breaked shrimps taste best when sliceed in a basin brushed with butter.Shores sing with endurance!Remember: breaked shrimps taste best when sliceed in a basin brushed with butter.Shores sing with endurance!Remember: breaked shrimps taste best when sliceed in a basin brushed with butter.Shores sing with endurance!Remember: breaked shrimps taste best when sliceed in a basin brushed with butter.sis of flight, invaded to a carnivorous phenomenan.',
      'PARTICULA ',
      'https://image.xiaomo.info/logo/avatar.png',
      'flutter',
      '${DateTime.now().hour}:${DateTime.now().minute}',
      comments),
  Post(
      'Particles fly with rumour!Abactor pius adgium estParticles Particles fly with rumour!Abactor pius adgium estParticles  ',
      'So, yes, opening a bank account for a Syrian citizen anywhere outside of Syria is a rather complicated matter. With the different sanctions on Syrian officials, and the ever-increasing layers of counter-terrorism regulations, Syrian nationals around the world, more than any other nationality, have become the outcasts of the 21st century, for whom a mundane task, like opening a bank account or wiring money for personal or business purposes, can easily turn into a nearly impossible mission.',
      'DEATH ',
      'https://image.xiaomo.info/logo/avatar.png',
      'flutter',
      '${DateTime.now().hour}:${DateTime.now().minute}',
      comments),
  Post(
      'It is an evil friendship, sir.All chilIt is an evil friendship, sir.All chilIt is an evil friendship, sir.All chilIt is an evil friendship, sir.All chilIt is an evil friendship, sir.All chil ',
      'Carrying this document, which is, by the way, the most expensive passport in the world with a cost of up to 400 per year, will definitely put you into some awkward situations. Who among us, who also carries this document, hasn’t encountered funny or humiliating reactions from passport-control officials in most of the world’s airports?',
      'DOMUS ',
      'https://image.xiaomo.info/logo/avatar.png',
      'flutter',
      '${DateTime.now().hour}:${DateTime.now().minute}',
      comments),
];

final List<Comment> comments = [
  Comment(
      id: '1',
      author: 'xiaomo2',
      icon: 'https://image'
          '.xiaomo.info/logo/avatar.png',
      content:
          'In Lebanon, the country where I have been living since before the start of the Syrian uprising, I wasn’t able to open a bank account until a Lebanese friend intervened on my behalf and called upon a personal favor with a bank manager. Two years later, the same friend couldn’t call on the same favor for my Syrian girlfriend, who was working online from Beirut for a company in the Arab Gulf. Eventually she was fired from her job because her company decided they couldn’t send her salary by Western Union anymore, and no bank would give her an account in which she could receive the modest monthly transfer of her salary. As for me, I can’t use my Lebanese bank account to receive any overseas transfers, nor can I get a mortgage or credit line of any kind. As a result, my Lebanese bank account is practically useless. My family was also recently informed that they cannot withdraw their 15-year-old deposit at a Lebanese bank in US, simply because they are Syrian.',
      time: DateTime.now()),
  Comment(
      id: '2',
      author: 'xiaomo3',
      icon: 'https://image'
          '.xiaomo.info/logo/avatar.png',
      content:
          'And do you know what hurts most of all? Knowing that after all these struggles, I am still one of a very few “privileged” Syrians, and that all of the above doesn’t even remotely compare to the fear and humiliation that my people are enduring everyday as refugees, as IDPs, and living under daily bombardment. Unwanted by their host countries, deported against their will to live their third or fourth forced displacement, not allowed to go back to their homeland by the regime and the different occupying forces, and left on their own to face daily aerial bombings, they find themselves trapped, without a future, and without hope for things to improve.！！',
      time: DateTime.now()),
  Comment(
      id: '3',
      author: 'xiaomo4',
      icon: 'https://image'
          '.xiaomo.info/logo/avatar.png',
      content:
          'AThere tends to be a predictable rhythm to most of the queries I follow in Reddit forums like “relationships” and “Am I the Asshole.” More often than not, the post centers around a woman who is subject to some awful behavior by a boyfriend or husband — “He’s a necrophiliac!” “He gave me chlamydia!” — yet who, despite her unhappiness, is reluctant to end the relationship. (The second most popular post: a man ready to dump a girlfriend over something hilariously minor.！',
      time: DateTime.now()),
  Comment(
      id: '4',
      author: 'xiaomo5',
      icon: 'https://image'
          '.xiaomo.info/logo/avatar.png',
      content:
          'And who knows: Maybe some of those clearly terrible people will reexamine their behavior once they see commenter after commenter taking them to task.！',
      time: DateTime.now()),
  Comment(
      id: '5',
      author: 'xiaomo6',
      icon: 'https://image'
          '.xiaomo.info/logo/avatar.png',
      content:
          'Sure, it’s not fun to remember that there are men out there still acting like sexist jerks — but we sort of knew that was the case anyway, didn’t we? And the truth is it’s not all bad. There’s the wholesome teenager who wanted to make a good impression on her boyfriend’s dog and wanted advice on how to win him over, for example.',
      time: DateTime.now()),
  Comment(
      id: '6',
      author: 'xiaomo7',
      icon: 'https://image'
          '.xiaomo.info/logo/avatar.png',
      content:
          'Unlike most cases of terrible misogyny in the United States — issues that have no easy answers or quick fixes — there is a solution when a guy is acting like an absolute piece of shit in his relationship. You get to watch in real time as people post updates about leaving their abusive spouses or controlling boyfriends. You can see the original poster start to take commenters’ advice seriously and begin to understand that, no, it’s not really normal for your boyfriend to throw a fit because you didn’t make his sandwich “correctly.”',
      time: DateTime.now()),
  Comment(
      id: '7',
      author: 'xiaomo8',
      icon: 'https://image'
          '.xiaomo.info/logo/avatar.png',
      content:
          'There tends to be a predictable rhythm to most of the queries I follow in Reddit forums like “relationships” and “Am I the Asshole.” More often than not, the post centers around a woman who is subject to some awful behavior by a boyfriend or husband — “He’s a necrophiliac!” “He gave me chlamydia!” — yet who, despite her unhappiness, is reluctant to end the relationship. (The second most popular post: a man ready to dump a girlfriend over something hilariously minor.)！',
      time: DateTime.now()),
  Comment(
      id: '8',
      author: 'xiaomo9',
      icon: 'https://image'
          '.xiaomo.info/logo/avatar.png',
      content:
          'Abandoned, forgotten, discriminated against, and dispensable in today’s world. This is how I would currently describe the wonderful experience of being Syrian',
      time: DateTime.now()),
  Comment(
      id: '9',
      author: 'xiaomo10',
      icon: 'https://image'
          '.xiaomo.info/logo/avatar.png',
      content:
          'And do you know what hurts most of all? Knowing that after all these struggles, I am still one of a very few “privileged” Syrians, and that all of the above doesn’t even remotely compare to the fear and humiliation that my people are enduring everyday as refugees, as IDPs, and living under daily bombardment. Unwanted by their host countries, deported against their will to live their third or fourth forced displacement, not allowed to go back to their homeland by the regime and the different occupying forces, and left on their own to face daily aerial bombings, they find themselves trapped, without a future, and without hope for things to improve.！',
      time: DateTime.now()),
  Comment(
      id: '10',
      author: 'xiaomo11',
      icon: 'https://image'
          '.xiaomo.info/logo/avatar.png',
      content:
          'Since that time, and after the expiration of my visa, I’ve never been able to travel to the United States again. In fact, I can’t even apply for a visa.！',
      time: DateTime.now()),
  Comment(
      id: '11',
      author: 'xiaomo12',
      icon: 'https://image'
          '.xiaomo.info/logo/avatar.png',
      content:
          'In January 2017, around the inauguration of Donald Trump, I was visiting the United States on my fourth lobbying tour to speak about the humanitarian response to Syria, and what could be done better. One of the major issues I continued to raise on every visit was the negative effect that sanctions were having on the work of local NGOs, and how banking was becoming increasingly impossible for them. Anytime the name Syria ',
      time: DateTime.now()),
  Comment(
      id: '12',
      author: 'xiaomo13',
      icon: 'https://image'
          '.xiaomo.info/logo/avatar.png',
      content:
          'opped up, transfers were being blocked, even when the money was destined for refugees in other countries. The bank “de-risking” of NGOs and Syrian nationals in all of the region’s countries was causing delays in delivering life-saving assistance where it was needed most.',
      time: DateTime.now()),
  Comment(
      id: '13',
      author: 'xiaomo14',
      icon: 'https://image'
          '.xiaomo.info/logo/avatar.png',
      content:
          'And instead of achieving any positive results for these efforts, I was shocked, like many others, by Mr. Trump’s signature of his first executive order, which banned travel for nationals from six countries, Syria among them, in what has since become known as the “Muslim travel ban.” Since that time, and after the expiration of my visa, I haven’t been able to travel to the United States again. In fact, I can’t even apply for a visa. In the beginning, whenever I received an invitation to speak at a conference or attend a fundraiser, the organizers would always apologize for not being able to help me obtain a visa. Then, eventually, the invitations stopped coming.！',
      time: DateTime.now()),
  Comment(
      id: '14',
      author: 'xiaomo15',
      icon: 'https://image'
          '.xiaomo.info/logo/avatar.png',
      content:
          'AWhile leaving the United States on that last trip, just a few days after the travel ban, an airline employee asked me after viewing my passport, “Sir, are you sure you want to leave the States? You won’t be able to come back if you do so.” Although she was acting out of genuine human compassion, the indignity I felt at that moment was both painful and humiliating.！',
      time: DateTime.now()),
  Comment(
      id: '15',
      author: 'xiaomo16',
      icon: 'https://image'
          '.xiaomo.info/logo/avatar.png',
      content:
          'Now, more than two years later, it still hurts whenever I think of it. It hurts to be banned from applying for a visa just because you were born in a certain region of the world. It hurts to be considered a terrorist by default just because of your nationality. It hurts to be chosen for a “random” security check every single time you try to board a plane to the United States or the U.K. It hurts to be stopped on every trip for “regular” additional questioning. In fact, it’s so silly that it makes me laugh nervously whenever I hear these terms. It hurts not to be able to open a bank account, get a mortgage, and start a family home. It hurts to be treated as an outcast by financial institutions, and lose the job you fought so hard to get in order to survive and provide for your family. And it really hurts to be treated as a third-class human being in a supposedly modern world.！',
      time: DateTime.now()),
];
