#!/bin/bash

CONTENT=content
for file in `ls src | grep -e "head$" | sed -e "s/.head//g"`
do
    _output=${CONTENT}/${file}.md
    cat src/${file}.head > ${_output}
    cat src/${file}.md >> ${_output}
done

find ./assets/img -type f | grep .uml$ | xargs -Ixxx plantuml xxx
jbake -b . /var/www/rhincodon.jp

