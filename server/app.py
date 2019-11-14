import flask_restful
from flask import Flask

from api.video_api import VideoApi
from common.json_encoder import JSONEncoder
from config.config import base_url, is_debug

app = Flask(__name__)
app.json_encoder = JSONEncoder
api = flask_restful.Api(app, prefix=base_url)

# video 相关
# api.add_resource(VideoListApi, '/video')
api.add_resource(VideoApi, '/video/<string:video>')

# 插件相关
# api.add_resource(PluginListApi, '/plugin')
# api.add_resource(PluginApi, '/plugin/<video_id>')

if __name__ == '__main__':
    app.run(host='127.0.0.1', port=8081, debug=is_debug)
