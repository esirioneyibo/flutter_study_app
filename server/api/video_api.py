import os
import sys

from flask import jsonify
from flask_restful import Resource, reqparse
from config.response import APIS_WRONG
from service.video_service import VideoService

sys.path.append(os.path.dirname(os.getcwd()))

parser = reqparse.RequestParser()
parser.add_argument('video', type=str)


class VideoApi(Resource):
    def __init__(self):
        self.video_service = VideoService()

    def get(self, video):

        apis = {
            "get": self.video_service.get_by_id,  # 根据id 获取一个video详情
            "list": self.video_service.get_all,  # 获取一个video list
        }

        if video in apis.keys():
            return jsonify(apis[video]())
        return APIS_WRONG

    def post(self, video):

        apis = {
            "add": self.video_service.add_video,  # 添加
            "update": self.video_service.update_video,  # 更新
            "delete": self.video_service.delete_video,  # 删除
        }

        if video in apis.keys():
            return jsonify(apis[video]())
        return APIS_WRONG

#     # 根据id 删除一个video 204
#     def delete(self, video_id):
#         return 'delete a video by video id', video_id
#
#     # 根据id 更新video 201
#     def put(self, video_id):
#         args = parser.parse_args()
#         video = {'video': args['video']}
#         # 根据id把video查出来,不为空时把更新到数据
#         return 'put a video by video id', video_id
#
#     # 判断一个video是否存在,不存在则返回404
#     def abort_if_video_doesnt_exist(self, video_id):
#         video_list = self.video_service.get_all()
#         if video_id not in video_list:
#             abort(404, message="video {} doesn't exist".format(video_id))
#
#
# class VideoListApi(Resource):
#     def __init__(self):
#         self.video_service = VideoService()
#
#     # 获取一个video list
#     def get(self):
#         return self.video_service.get_all()

    # 添加一个video
    # def post(self):
    #     args = request.args.to_dict()
    #     video = {'video': args['video']}
    #     self.video_service.add_model(video)
