from flask.json import JSONEncoder as _JSONEncoder


class JSONEncoder(_JSONEncoder):
    """重写对象序列化, 当默认jsonify无法序列化对象的时候将调用这里的default"""

    def default(self, obj):
        if hasattr(obj, 'keys') and hasattr(obj, '__getitem__'):
            return dict(obj)
        raise TypeError(repr(obj) + " is not JSON serializable")
