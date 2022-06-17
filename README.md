# test-dhaal
Test Deephaven as a python library

## Run via docker

```bash
docker pull ghcr.io/chipkent/test-dhaal:main
```

## Use to build Docker images

```
FROM ghcr.io/chipkent/test-dhaal:main
```

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
from deephaven_server import Server
s = Server(port=8080, jvm_args=["-Xmx4g"])
s.start()

# UGP lock must be held to execute many query operations

from deephaven import time_table
from deephaven._ugp import ugp_shared_lock

with ugp_shared_lock():
    t = time_table("00:00:01").update("A = i%2==0 ? `A` : `B`")
    t_last = t.last_by("A")
    t_join = t.natural_join(t_last, on="A", joins=["LastTime=Timestamp"])

print(t_join)
```

You can connect to the Deephaven IDE by going to [http://localhost:10000/ide/](http://localhost:10000/ide/) in your local web browser.






