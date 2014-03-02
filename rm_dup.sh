#!/bin/bash
# Copyright (c) 2011 Anders Sundman <anders@4zm.org>
#
# This file is part of SLURP.
# 
# SLURP is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# SLURP is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with SLURP.  If not, see <http://www.gnu.org/licenses/>.

# Delete duplicate *.card files from the current directory

# Move the unique ones to a tmp stash
TMPDIR=`mktemp -d`
for f in `md5sum *.card | sort -k1,1 -u | cut -d' ' -f3 | sort` ; do
  mv $f $TMPDIR
done

# Get rid of the non unique
rm -f *.card

# Move the good ones back
mv ${TMPDIR}/*.card .