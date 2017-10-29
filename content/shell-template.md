title=シェルスクリプトのテンプレートファイル
date=2017-10-29
type=post
tags=blog
status=published
~~~~~~

シェルスクリプトを作成するときのテンプレートファイル。


```
#!/bin/bash

##################
## program name ##
##################

PROGRAMNAME=`basename $0`

#############
## version ##
#############

VERSION="1.0"

###########
## usage ##
###########

function usage() {
cat <<_EOT_
Version:
  $VERSION
Usage:
  $PROGRAMNAME -a ARG -b [ARG] -c
Options:
  -a    aaaaa
  -b    bbbbb
  -c    ccccc
_EOT_
exit 1
}

#############
## options ##
#############

# key  : string of option
# value: num of actual argument.
declare -A OPTS_=(
["-a"]=1
["-b"]=1
["-c"]=0
)

######################
## options function ##
######################

FUNC_OPT_PREFIX="opt"

function opt-a() {
if [[ -z "$2" ]] || [[ "$2" =~ ^-+ ]]; then
  echo "$PROGNAME: option requires an argument $1" 1>&2
  return
fi
ARG_A="$2"
echo "exec option -a $ARG_A "
}

function opt-b() {
if [[ -z "$2" ]] || [[ "$2" =~ ^-+ ]]; then
  OPTS_[$opt]=$((${OPTS_[$opt]} - 1))
  echo "exec option -b no arg. "
  return
fi
ARG_B="$2"
echo "exec option -b $ARG_B "
}

function opt-c() {
echo "exec option -c."
}

#####################
## options checker ##
#####################

function options_checker() {
# no args
if [ $# -eq 0 ]; then
  usage
  exit 1
fi
# --,-
for _arg_cmd in "$@"
do
  case "$_arg_cmd" in
    '--'|'-' )
      echo "Caution:" 1>&2
      echo "  Please attach string. ex.: -h, --help." 1>&2
      usage
      exit 1
      ;;
  esac
done
# illegal option
for _arg_cmd in "$@"
do
  case "$_arg_cmd" in
    -*)
      for opt in "${!OPTS_[@]}"
      do
        if [ "$_arg_cmd" = "${opt}" ]; then
          continue 2
        fi
      done
      echo "Caution:" 1>&2
      echo "  $PROGRAMNAME: illegal option $_arg_cmd" 1>&2
      usage
      exit 1
      ;;
  esac
done
}

#####################
## options handler ##
#####################

function options_handler() {

declare -i argc=0
declare -a argv=()

for _arg_cmd in "$@"
do
  case "$_arg_cmd" in
    -*)
      for opt in "${!OPTS_[@]}"
      do
        if [ "$_arg_cmd" = "${opt}" ]; then
          $FUNC_OPT_PREFIX$opt $@
          shift $((${OPTS_[$opt]} + 1))
          continue 2
        fi
      done
      ;;
    *)
      if [[ ! -z "$1" ]] && [[ ! "$1" =~ ^-+ ]]; then
        ((++argc))
        argv+=( "$1" )
        shift 1
      fi
      ;;
  esac
done
}

##########
## main ##
##########

options_checker $@
options_handler $@
```
