import 'package:uuid/uuid.dart';

class VideoVo {
  String id;
  String cover;
  String title;
  String url;
  String voteCount;
  String commentsCount;
  String tag;

  VideoVo(
      {this.id,
      this.cover,
      this.title,
      this.url,
      this.voteCount,
      this.commentsCount,
      this.tag}) {
    this.id = Uuid().v1();
  }
}

final List<VideoVo> videos = [
  VideoVo(
      cover: 'https://image.xiaomo.info/cover/bg-1'
          '.jpg',
      title: 'flutter学习专题，一套代码开发多端应用,助你快速掌握flutter开发。',
      url: 'https://www.bilibili'
          '.com/video/av65343712/',
      voteCount: '88888',
      commentsCount: '666',
      tag: 'flutter'),
  VideoVo(
      cover: 'https://image.xiaomo.info/cover/bg-2'
          '.jpg',
      title: 'flutter学习专题，一套代码开发多端应用,助你快速掌握flutter开发。',
      url: 'https://www.bilibili'
          '.com/video/av65343712/',
      voteCount: '88888',
      commentsCount: '666',
      tag: 'flutter'),
  VideoVo(
      cover: 'https://image.xiaomo.info/cover/bg-3'
          '.jpg',
      title: 'flutter学习专题，一套代码开发多端应用,助你快速掌握flutter开发。',
      url: 'https://www.bilibili'
          '.com/video/av65343712/',
      voteCount: '88888',
      commentsCount: '666',
      tag: 'flutter'),
  VideoVo(
      cover: 'https://image.xiaomo.info/cover/bg-4'
          '.jpg',
      title: 'flutter学习专题，一套代码开发多端应用,助你快速掌握flutter开发。',
      url: 'https://www.bilibili'
          '.com/video/av65343712/',
      voteCount: '88888',
      commentsCount: '666',
      tag: 'flutter'),
  VideoVo(
      cover: 'https://image.xiaomo.info/cover/bg-5'
          '.jpg',
      title: 'flutter学习专题，一套代码开发多端应用,助你快速掌握flutter开发。',
      url: 'https://www.bilibili'
          '.com/video/av65343712/',
      voteCount: '88888',
      commentsCount: '666',
      tag: 'flutter'),
  VideoVo(
      cover: 'https://image.xiaomo.info/cover/bg-6'
          '.jpg',
      title: 'flutter学习专题，一套代码开发多端应用,助你快速掌握flutter开发。',
      url: 'https://www.bilibili'
          '.com/video/av65343712/',
      voteCount: '88888',
      commentsCount: '666',
      tag: 'flutter'),
  VideoVo(
      cover: 'https://image.xiaomo.info/cover/bg-7'
          '.jpg',
      title: 'flutter学习专题，一套代码开发多端应用,助你快速掌握flutter开发。',
      url: 'https://www.bilibili'
          '.com/video/av65343712/',
      voteCount: '88888',
      commentsCount: '666',
      tag: 'flutter'),
  VideoVo(
      cover: 'https://image.xiaomo.info/cover/bg-8'
          '.jpg',
      title: 'flutter学习专题，一套代码开发多端应用,助你快速掌握flutter开发。',
      url: 'https://www.bilibili'
          '.com/video/av65343712/',
      voteCount: '88888',
      commentsCount: '666',
      tag: 'flutter'),
  VideoVo(
      cover: 'https://image.xiaomo.info/cover/bg-9'
          '.jpg',
      title: 'flutter学习专题，一套代码开发多端应用,助你快速掌握flutter开发。',
      url: 'https://www.bilibili'
          '.com/video/av65343712/',
      voteCount: '88888',
      commentsCount: '666',
      tag: 'flutter'),
  VideoVo(
      cover: 'https://image.xiaomo.info/cover/bg-10'
          '.jpg',
      title: 'flutter学习专题，一套代码开发多端应用,助你快速掌握flutter开发。',
      url: 'https://www.bilibili'
          '.com/video/av65343712/',
      voteCount: '88888',
      commentsCount: '666',
      tag: 'flutter'),
  VideoVo(
      cover: 'https://image.xiaomo.info/cover/bg-11'
          '.jpg',
      title: 'flutter学习专题，一套代码开发多端应用,助你快速掌握flutter开发。',
      url: 'https://www.bilibili'
          '.com/video/av65343712/',
      voteCount: '88888',
      commentsCount: '666',
      tag: 'flutter'),
  VideoVo(
      cover: 'https://image.xiaomo.info/cover/bg-12'
          '.jpg',
      title: 'flutter学习专题，一套代码开发多端应用,助你快速掌握flutter开发。',
      url: 'https://www.bilibili'
          '.com/video/av65343712/',
      voteCount: '88888',
      commentsCount: '666',
      tag: 'flutter'),
  VideoVo(
      cover: 'https://image.xiaomo.info/cover/bg-13'
          '.jpg',
      title: 'flutter学习专题，一套代码开发多端应用,助你快速掌握flutter开发。',
      url: 'https://www.bilibili'
          '.com/video/av65343712/',
      voteCount: '88888',
      commentsCount: '666',
      tag: 'flutter'),
  VideoVo(
      cover: 'https://image.xiaomo.info/cover/bg-14'
          '.jpg',
      title: 'flutter学习专题，一套代码开发多端应用,助你快速掌握flutter开发。',
      url: 'https://www.bilibili'
          '.com/video/av65343712/',
      voteCount: '88888',
      commentsCount: '666',
      tag: 'flutter'),
  VideoVo(
      cover: 'https://image.xiaomo.info/cover/bg-15'
          '.jpg',
      title: 'flutter学习专题，一套代码开发多端应用,助你快速掌握flutter开发。',
      url: 'https://www.bilibili'
          '.com/video/av65343712/',
      voteCount: '88888',
      commentsCount: '666',
      tag: 'flutter'),
  VideoVo(
      cover: 'https://image.xiaomo.info/cover/bg-16'
          '.jpg',
      title: 'flutter学习专题，一套代码开发多端应用,助你快速掌握flutter开发。',
      url: 'https://www.bilibili'
          '.com/video/av65343712/',
      voteCount: '88888',
      commentsCount: '666',
      tag: 'flutter')
];
