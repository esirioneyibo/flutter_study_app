from model.models import Video
from service.base_service import BaseService, close_session
from flask import jsonify


class VideoService(BaseService):
    @close_session
    def get_all(self):
        return jsonify(self.query(Video).all())

    @close_session
    def get_by_id(self, video_id):
        res = self.query(Video).filter(Video.id == video_id).first()
        return jsonify(res)
