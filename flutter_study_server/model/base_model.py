from sqlalchemy.ext.declarative import declarative_base

_Base = declarative_base()


class BaseModel(_Base):
    __abstract__ = True

    def keys(self):
        return [value[0] for value in self._sa_instance_state.attrs.items()]

    def __getitem__(self, item):
        return getattr(self, item)
