import os
import sys

from flask import request
from flask_restful import Resource, abort, reqparse

from service.video_service import VideoService

sys.path.append(os.path.dirname(os.getcwd()))

parser = reqparse.RequestParser()
parser.add_argument('video', type=str)


class VideoApi(Resource):
    def __init__(self):
        self.video_service = VideoService()

    # 根据id 获取一个video详情 200
    def get(self, video_id):
        return self.video_service.get_by_id(video_id)

    def post(self):
        args = parser.parse_args()
        video = {'video': args['video']}
        self.video_service.add_model(video)

    # 根据id 删除一个video 204
    def delete(self, video_id):
        return 'delete a video by video id', video_id

    # 根据id 更新video 201
    def put(self, video_id):
        args = parser.parse_args()
        video = {'video': args['video']}
        # 根据id把video查出来,不为空时把更新到数据
        return 'put a video by video id', video_id

    # 判断一个video是否存在,不存在则返回404
    def abort_if_video_doesnt_exist(self, video_id):
        video_list = self.video_service.get_all()
        if video_id not in video_list:
            abort(404, message="video {} doesn't exist".format(video_id))


class VideoListApi(Resource):
    def __init__(self):
        self.video_service = VideoService()

    # 获取一个video list
    def get(self):
        return self.video_service.get_all()

    # 添加一个video
    def post(self):
        args = request.args.to_dict()
        video = {'video': args['video']}
        self.video_service.add_model(video)
