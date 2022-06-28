
from deephaven_server import Server

def start_dh(port=8080, jvm_args=["-Xmx4g"]):
    s = Server(port=port, jvm_args=jvm_args)
    s.start()
    globals()["__server"] = s


