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
        name='pychai3d.scenegraph', 
        sources=['pychai3d/scenegraph.pyx'],
        language='c++',
        include_dirs=['src/', 'modules/GEL/', 'modules/ODE/', 'external/ODE/include/'],
        define_macros=[('dDOUBLE', None), ('_LINUX', None)],
        library_dirs=['lib/lin-x86_64/', 'external/DHD/lib/lin-x86_64/', 'external/ODE/lib/lin-x86_64', '/usr/lib/'],
        libraries=['chai3d', 'dhd', 'ode', 'pthread', 'rt', 'pci', 'z', 'usb', 'GL', 'GLU', 'glut'],
        extra_compile_args=["-O3", "-W", "-Wno-deprecated", "-Wno-unused-parameter"],
        extra_link_args=["-O3"],
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
