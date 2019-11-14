import uuid
from flask_restful import abort
from model.models import Video
from service.base_service import BaseService
from flask import request
from common.import_status import import_status


class VideoService(BaseService):
    def get_all(self):
        return import_status('SUCCESS_GET_VIDEO', 'ok', data=self.query(Video).all())

    def get_by_id(self):
        video_id = request.args.get('id')
        if not video_id:
            abort(500, message='Missing args parameter: id')
        res = self.abort_if_video_doesnt_exist(video_id)
        response = import_status('SUCCESS_GET_VIDEO', 'ok', data=res)
        return response

    def abort_if_video_doesnt_exist(self, video_id):
        res = self.query(Video).filter(Video.id == video_id).first()
        if not res:
            abort(404, message="video {} doesn't exist".format(video_id))
        return res

    def add_video(self):
        data = request.json
        if not data:
            abort(500, message='Missing body parameter')
        # video_dict = {k: data.get(k) for k in Video.keys() if data.get(k)}
        video_dict = {'id': str(uuid.uuid1()),
                      'cover': data.get('cover'),
                      'title': data.get('title'),
                      'url': data.get('url'),
                      'voteCount': data.get('voteCount'),
                      'commentCount': data.get('commentCount'),
                      'tag': data.get('tag')
                      }
        super(VideoService, self).add_model(Video, **video_dict)
        return import_status('SUCCESS_ADD_VIDEO', 'ok')

    def update_video(self):
        pass

    def delete_video(self):
        pass
