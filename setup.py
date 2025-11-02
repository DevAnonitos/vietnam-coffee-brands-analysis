from pathlib import Path

from setuptools import find_packages, setup

this_directory = Path(__file__).parent
long_description = (this_directory / "README.md").read_text(encoding="utf-8")


def parse_requirements(filename):
    with open(filename, encoding="utf-8") as f:
        lines = f.read().splitlines()
        return [line.strip() for line in lines if line and not line.startswith("#")]


install_requires = parse_requirements("requirements.txt")

setup(
    include_package_data=True,
    python_requires=">=3.10",
    install_requires=install_requires,
    packages=find_packages(exclude=("tests*", "notebooks*", "examples*")),
    license="MIT",
    classifiers=[
        "Programming Language :: Python :: 3.12",
        "License :: OSI Approved :: MIT License",
        "Operating System :: OS Independent",
        "Intended Audience :: Science/Research",
        "Topic :: Scientific/Engineering :: Artificial Intelligence",
    ],
    keywords="data-science machine-learning analytics visualization",
)
