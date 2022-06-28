
from deephaven_server import Server

def start_dh(port=8080, jvm_args=["-Xmx4g"]):
    s = Server(port=port, jvm_args=jvm_args)
    s.start()
    globals()["__server"] = s


from deephaven import time_table
from deephaven._ugp import ugp_shared_lock

def example_query():
    with ugp_shared_lock():
        t = time_table("00:00:01").update("A = i%2==0 ? `A` : `B`")
        t_last = t.last_by("A")
        t_join = t.natural_join(t_last, on="A", joins=["LastTime=Timestamp"])

    return t, t_last, t_join

