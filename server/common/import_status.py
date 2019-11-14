from config import messages, status


def import_status(msg_key, sta_key, data=None):
    return {"data": data, "message": getattr(messages, msg_key), "status_code": getattr(status, sta_key, 'ok')}
