#  (C) 2002-2009 - CHAI 3D
#  All Rights Reserved.
#
#  $Author: seb $
#  $Date: 2009-06-22 02:21:41 +0200 (Mon, 22 Jun 2009) $
#  $Rev: 285 $


#! /bin/sh

# start with a clean slate
make clean

# produce debug version
make CFG=debug

# produce release version
make

# produce documentation
pushd doc/resources/doxygen
doxygen Doxyfile
popd

# remove all temporary resources
rm -rf obj
