
import os
print(f'JAVA_HOME={os.environ["JAVA_HOME"]}')

from test_dhaal.setup import start_dh

start_dh()

from test_dhaal.exec import example_query

t, t_last, t_join = example_query()