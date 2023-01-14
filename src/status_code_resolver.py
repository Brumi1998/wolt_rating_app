from configuration.configuration import config
import processor as p

class StatusCodeResolver:

    def resolve(self, event):
        try:
            self.switch_get_or_post(event)
            return config.OK_RESPONSE
        except BaseException:
            return config.ERROR_RESONSE

    def switch_get_or_post(self, event):
        if event:
            p.GetProcessor.process()
        else:
            p.PostProcessor.process()
