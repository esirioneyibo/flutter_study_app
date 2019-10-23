import os
import sys

from sqlalchemy import Column, Integer, String
from sqlalchemy import create_engine
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import sessionmaker
from config import db_config as cfg
from config.config import sql_echo
from model.base_model import BaseModel

sys.path.append(os.path.dirname(os.getcwd()))

DB_PARAMS = "{0}://{1}:{2}@{3}/{4}?charset={5}".format(cfg.sqlenginename,
                                                       cfg.username,
                                                       cfg.password,
                                                       cfg.host,
                                                       cfg.database,
                                                       cfg.charset
                                                       )
mysql_engine = create_engine(DB_PARAMS, echo=sql_echo)

db_session = sessionmaker(bind=mysql_engine)


class Video(BaseModel):
    __tablename__ = "videos"
    id = Column(String(64), primary_key=True)
    cover = Column(String(14), nullable=False)  # 封面
    title = Column(String(32), nullable=False)  # 标题
    url = Column(String(64))  # 链接
    voteCount = Column(Integer)  # 点赞数量
    commentCount = Column(Integer)  # 评论数量
    tag = Column(String(64))  # 标签

    def from_json(self):
        return Video(
            id=self.id,
            cover=self.cover,
            title=self.title,
            url=self.url,
            voteCount=self.voteCount,
            commentCount=self.commentCount,
            tag=self.tag,
        )

    def to_json(self):
        return {
            'id': self.id,
            'cover': self.cover,
            'title': self.title,
            'url': self.url,
            'voteCount': self.voteCount,
            'commentCount': self.commentCount,
            'tag': self.tag,
        }


BaseModel.metadata.create_all(mysql_engine)
