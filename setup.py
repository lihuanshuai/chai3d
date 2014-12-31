#!/usr/bin/env python
# -*- coding: utf-8 -*-

from setuptools import setup
from distutils.core import Extension
from Cython.Distutils import build_ext

from pychai3d import __version__

with open('README.md') as long_description_file:
    long_description = long_description_file.read()

ext_modules = [
    Extension(
        name='_pychai3d', 
        sources=['pychai3d/_pychai3d.pyx'],
        language='c++',
        extra_objects=['lib/lin-x86_64/libchai3d.a']
    ),
]

setup(
    name='pychai3d',
    version=__version__,
    description='Python Wrapper for CHAI3D',
    long_description=long_description,
    author='Li Huanshuai',
    author_email='lihuanshuaiplus AT qq DOT com',
    url='https://github.com/lihuanshuai/chai3d',
    packages=['pychai3d'],
    ext_modules=ext_modules,
    license='GPLv2',
    keywords=['chai3d', 'haptics', 'visualization', 'simulation'],
    cmdclass={'build_ext': build_ext},
)
