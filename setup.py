
import setuptools

with open("README.md", "r", encoding="utf-8") as fh:
    long_description = fh.read()

version = "0.0.1"

setuptools.setup(
    name="test_dhaal",
    version=version,
    author="David R. (Chip) Kent IV",
    author_email="chipkent@deephaven.io",
    description="Test Deephaven as a Library Python integration",
    long_description=long_description,
    long_description_content_type="text/markdown",
    url="https://github.com/chipkent/test-dhaal",
    project_urls={
        "GitHub": "https://github.com/chipkent/test-dhaal",
    },
    classifiers=[
        "Programming Language :: Python :: 3",
        "License :: OSI Approved :: Apache Software License",
        "Operating System :: OS Independent",
        "Intended Audience :: Developers",
        "Intended Audience :: End Users/Desktop",
        "Intended Audience :: Financial and Insurance Industry",
        "Topic :: Database :: Database Engines/Servers",
        "Topic :: Office/Business :: Financial :: Investment",
        "Topic :: Software Development :: Libraries :: Python Modules",
    ],
    package_dir={"": "src"},
    packages=setuptools.find_packages(where="src"),
    python_requires=">=3.7",
    install_requires=[
        "deephaven-server==0.14.0",
    ],
)
