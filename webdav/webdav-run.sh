#!/bin/bash
echo "Running 🍻"

cd
mkdir -p webdav-files
dufs -A -a ${WEBDAVUSER}:${WEBDAVPASS}@/:rw --auth-method=basic webdav-files

echo "Done 🍻"
