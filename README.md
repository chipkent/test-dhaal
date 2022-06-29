# test-dhaal
Test Deephaven as a python library

## Run via docker

```bash
docker pull ghcr.io/chipkent/test-dhaal:main
docker run -it -p 10000:8080 ghcr.io/chipkent/test-dhaal:main
```

This publishes container port 8080 to the localhost port 10000 for creating the Deephaven server.

## Use to build custom Docker images

```
FROM ghcr.io/chipkent/test-dhaal:main
```

## Local Build

Images are automatically built via GitHub actions.  These images should be used.

If you insist on building locally:

```bash
docker build -t test-dhaal .
```

To run:

```bash
docker run -it -p 10000:8080 test-dhaal:main
```

This publishes container port 8080 to the localhost port 10000 for creating the Deephaven server.


## Example script

```python
from deephaven_server import Server
s = Server(port=8080, jvm_args=["-Xmx4g"])
s.start()

# UGP lock must be held to execute many query operations

from deephaven import time_table
from deephaven import ugp

with ugp.shared_lock():
    t = time_table("00:00:01").update("A = i%2==0 ? `A` : `B`")
    t_last = t.last_by("A")
    t_join = t.natural_join(t_last, on="A", joins=["LastTime=Timestamp"])

print(t_join)
```

It is also possible to use autolocking for UGP when working interactively on the command line.
Autolocking automatically acquires UGP locks for each operation as it is performed.
In general, explicit locking is preferred over autolocking, but autolocking is more convenient
when working at the command prompt.

```python
from deephaven_server import Server
s = Server(port=8080, jvm_args=["-Xmx4g"])
s.start()

# UGP lock is automatically acquired for each query operation
from deephave import ugp
ugp.auto_locking = True


from deephaven import time_table

t = time_table("00:00:01").update("A = i%2==0 ? `A` : `B`")
t_last = t.last_by("A")
t_join = t.natural_join(t_last, on="A", joins=["LastTime=Timestamp"])

print(t_join)
```


You can connect to the Deephaven IDE by going to [http://localhost:10000/ide/](http://localhost:10000/ide/) in your local web browser.






