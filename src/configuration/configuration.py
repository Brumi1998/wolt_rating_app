from pydantic import BaseSettings


class Configuration(BaseSettings):
    OK_RESPONSE: int = 200
    ERROR_RESPONSE: int = 400


config: Configuration = Configuration()
