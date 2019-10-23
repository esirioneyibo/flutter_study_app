from common.flutter_study_error import DBError
from model.models import db_session


def get_session():
    session = None
    status = None
    try:
        session = db_session()
        status = True
    except Exception as e:
        print(e.message)
        session = None
        status = False
    finally:
        return session, status


def close_session(fn):
    def inner(self, *args, **kwargs):
        try:
            result = fn(self, *args, **kwargs)
            self.session.commit()
            return result
        except Exception as e:
            print("DB ERROR" + str(e))
            self.session.rollback()
            raise DBError(e)
        finally:
            self.session.close()

    return inner


# service 基础类
class BaseService(object):
    def __init__(self):
        try:
            self.session = db_session()
            self.query = self.session.query
        except Exception as e:
            print(e.message)

    @close_session
    def add_model(self, model_bean, **kwargs):
        for key in model_bean.__table__.columns.keys():
            if key in kwargs:
                setattr(model_bean, key, kwargs.get(key))

        self.session.add(model_bean)
