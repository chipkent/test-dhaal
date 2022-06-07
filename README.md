# test-dhaal
Test Deephaven as a python library

## Build

To build:

```bash
./build.sh
```

## Run

To run:

```bash
./run.sh
```

This publishes container port 8080 to the localhost port 10000 for creating the Deephaven server.

## Example script

```python
from deephaven_server import Server; s = Server(8080); s.start()

# UGP lock must be held to execute many query operations

from deephaven._ugp import ugp_shared_lock

with ugp_shared_lock():
    t = time_table("00:00:01").update("A = i%2==0 ? `A` : `B`")
    t_last = t.last_by("A")
    t_join = t.natural_join(t_last, on="A", joins=["LastTime=Timestamp"])

print(t_join)
```

You can connect to the Deephaven IDE by going to [http://localhost:10000/ide/](http://localhost:10000/ide/) in your local web browser.






