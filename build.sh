#!/bin/bash

SITE=/var/www/rhincodon.jp

mkdocs build
rm -rf ${SITE}/*
mv site/* ${SITE}/