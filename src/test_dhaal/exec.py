from deephaven import time_table
from deephaven._ugp import ugp_shared_lock

def example_query():
    with ugp_shared_lock():
        t = time_table("00:00:01").update("A = i%2==0 ? `A` : `B`")
        t_last = t.last_by("A")
        t_join = t.natural_join(t_last, on="A", joins=["LastTime=Timestamp"])

    return t, t_last, t_join
