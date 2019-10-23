class ProjectVo {
  String projectName;
  String desc;
  String language;
  String star;
  String fork;
  String url;

  ProjectVo(
      {this.projectName,
      this.desc,
      this.language,
      this.star,
      this.fork,
      this.url});

  factory ProjectVo.fromJson(Map<String, dynamic> json) {
    return ProjectVo(
      projectName: json['projectName'],
      desc: json['desc'],
      language: json['language'],
      star: json['star'],
      fork: json['fork'],
      url: json['url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'projectName': projectName,
      'desc': desc,
      'language': language,
      'star': star,
      'fork': fork,
      'url': url,
    };
  }
}

final List<ProjectVo> projects = [
  ProjectVo(
      projectName: 'angular',
      desc: 'this is an '
          'project for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angular',
      star: '4221',
      fork: '123',
      url: 'https://github.com/houko/Angular'),
  ProjectVo(
      projectName: 'angular',
      desc: 'this is an '
          'project for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angular',
      star: '4221',
      fork: '123',
      url: 'https://github.com/houko/Angular'),
  ProjectVo(
      projectName: 'angular',
      desc: 'this is an '
          'project for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angular',
      star: '4221',
      fork: '123',
      url: 'https://github.com/houko/Angular'),
  ProjectVo(
      projectName: 'angular',
      desc: 'this is an '
          'project for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angular',
      star: '4221',
      fork: '123',
      url: 'https://github.com/houko/Angular'),
  ProjectVo(
      projectName: 'angular',
      desc: 'this is an '
          'project for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angular',
      star: '4221',
      fork: '123',
      url: 'https://github.com/houko/Angular'),
  ProjectVo(
      projectName: 'angular',
      desc: 'this is an '
          'project for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angular',
      star: '4221',
      fork: '123',
      url: 'https://github.com/houko/Angular'),
  ProjectVo(
      projectName: 'angular',
      desc: 'this is an '
          'project for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angular',
      star: '4221',
      fork: '123',
      url: 'https://github.com/houko/Angular'),
  ProjectVo(
      projectName: 'angular',
      desc: 'this is an '
          'project for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angular',
      star: '4221',
      fork: '123',
      url: 'https://github.com/houko/Angular'),
  ProjectVo(
      projectName: 'angular',
      desc: 'this is an '
          'project for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angular',
      star: '4221',
      fork: '123',
      url: 'https://github.com/houko/Angular'),
  ProjectVo(
      projectName: 'angular',
      desc: 'this is an '
          'project for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angular',
      star: '4221',
      fork: '123',
      url: 'https://github.com/houko/Angular'),
  ProjectVo(
      projectName: 'angular',
      desc: 'this is an '
          'project for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angularproject for angular',
      star: '4221',
      fork: '123',
      url: 'https://github.com/houko/Angular'),
];
