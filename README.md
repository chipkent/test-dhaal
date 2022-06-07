# test-dhaal
Test Deephaven as a python library

## Build

To build run:

```bash
./build.sh
```

## Run

To run:

```bash
./run.sh
```

This publishes port 8080 to the localhost for creating the Deephaven server.

## Example script

```python
from deephaven_server import Server
s = Server(8080)
s.start()

# add your code here
```

You can connect to the Deephaven IDE by going to [http://localhost:10000/ide/](http://localhost:10000/ide/) in your local web browser.






