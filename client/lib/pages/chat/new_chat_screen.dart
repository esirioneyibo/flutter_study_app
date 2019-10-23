import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_study_app/components/loading.dart';
import 'package:flutter_study_app/i18n/fs_localization.dart';
import 'package:flutter_study_app/model/app_model.dart';
import 'package:flutter_study_app/service/http_service.dart';
import 'package:flutter_study_app/utils/index.dart';
import 'package:flutter_study_app/utils/tip_util.dart';
import 'package:quill_delta/quill_delta.dart';
import 'package:zefyr/zefyr.dart';

class NewChatScreen extends StatefulWidget {
  @override
  _NewChatScreenState createState() => _NewChatScreenState();
}

class _NewChatScreenState extends State<NewChatScreen> {
  ZefyrController _controller;
  FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _loadDocument().then((document) {
      setState(() {
        _controller = ZefyrController(document);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragEnd: (DragEndDetails details) {
        _saveDocument(context, details);
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(FsLocalizations.getLocale(context).newChat),
          actions: <Widget>[
            Builder(
              builder: (context) => IconButton(
                icon: Icon(Icons.save),
                onPressed: () => _createPost(context),
              ),
            )
          ],
        ),
        body: _buildBody(),
      ),
    );
  }

  Widget _buildBody() {
    if (_controller == null) {
      return Loading();
    } else {
      return ZefyrScaffold(
        child: ZefyrEditor(
          padding: EdgeInsets.all(16),
          controller: _controller,
          focusNode: _focusNode,
        ),
      );
    }
  }

  Future<NotusDocument> _loadDocument() async {
    final file = File(Directory.systemTemp.path + "/quick_start.json");
    if (await file.exists()) {
      final contents = await file.readAsString();
      return NotusDocument.fromJson(jsonDecode(contents));
    }
    final Delta delta = Delta()..insert("\n");
    return NotusDocument.fromDelta(delta);
  }

  /// create post
  _createPost(BuildContext context) {
    AppModel model = CommonUtil.getModel(context);
    var document = _controller.document.toJson();
    Operation operation = document[0];
    List<String> data = operation.data.trim().split('\n');
    String title = data[0].trim();

    if (title.isEmpty) {
      TipUtil.showTip(context, FsLocalizations.getLocale(context).contentTips);
      return;
    }

    String content = CommonUtil.toGithubString(operation.data);
    HttpService.addAnIssue(context, title, body: content).then((data) {
      if (data != null) {
        model.updatePosts(context);
        NavigatorUtil.back(context);
      }
    });
  }

  /// save to temp file
  void _saveDocument(BuildContext context, details) {
    AppModel model = CommonUtil.getModel(context);
    final contents = jsonEncode(_controller.document);
    final file = File(Directory.systemTemp.path + "/quick_start.json");
    file.writeAsString(contents).then((_) {
      model.updatePosts(context);
      NavigatorUtil.back(context, details);
    });
  }
}

class NewChatStyle {}
