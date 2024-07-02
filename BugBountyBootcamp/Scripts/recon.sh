#!/bin/bash

# I've placed multiple iterations of this scrips below, separated by comments.
# You will need to break these apart to use them.
# Don't forget the shebang (#!/bin/bash) for the interpreter in your script

# Very Basic:

#!/bin/bash
echo "Creating directory $1_recon."
mkdir $1_recon
nmap $1 >$1_recond/nmap
echo "The results of nmap scan are stored in $1_recon/nmap."
dirsearch -u $1 -e php --simple-report=$1_recon/dirsearch
echo "The results of dirsearch scan are stored in $1_recon/dirsearch."

# Very Basic With Variables:

#!/bin/bash
PATH_TO_DIRSEARCH="/Path/to/Dirsearch"
DOMAIN=$1
DIRECTORY=${DOMAIN}_recon
echo "Creating directory $DIRECTORY."
mkdir $DIRECTORY
nmap $DOMAIN >$DIRECTORY/nmap
echo "The results of nmap scan are stored in $DIRECTORY/nmap"
$PATH_TO_DIRSEARCH/dirsearch.py -u $DOMAIN -e php -simple-report=$DIRECTORY/dirsearch
echo "The results of dirsearch scan are stored in $DIRECTORY/dirsearch"

# Very Basic with Command substitution $(date):

#!/bin/bash
PATH_TO_DIRSEARCH="/Path/to/Dirsearch"
TODAY=$(date)
echo "This scan was created on $TODAY"
DOMAIN=$1
DIRECTORY=${DOMAIN}_recon
echo "Creating directory $DIRECTORY."
mkdir $DIRECTORY
nmap $DOMAIN >$DIRECTORY/nmap
echo "The results of nmap scan are stored in $DIRECTORY/nmap"
$PATH_TO_DIRSEARCH/dirsearch.py -u $DOMAIN -e php -simple-report=$DIRECTORY/dirsearch
echo "The results of dirsearch scan are stored in $DIRECTORY/dirsearch"

# Adding options to choose the tools to run:
# Using if/fi to create conditionals
#
# Structure:
# if [ condition 1 ]
# then
#   # Do if condition 1 is satisfied
# elif [ condition 2 ]
# then
#   # Do is condition 2 is satisfied, and condition 1 is not satisfied
# else
#   # Do something else if neither condition is satisfied
# fi

#!/bin/bash
PATH_TO_DIRSEARCH="/Path/to/Dirsearch"
TODAY=$(date)
echo "This scan was created on $TODAY"
DOMAIN=$1
DIRECTORY=${DOMAIN}_recon
echo "Creating directory $DIRECTORY."
mkdir $DIRECTORY
if [ $2 == "nmap-only" ]; then
  nmap $DOMAIN >$DIRECTORY/nmap
  echo "The results of nmap scan are stored in $DIRECTORY/nmap."
elif [ $2 == "dirsearch-only" ]; then
  $PATH_TO_DIRSEARCH/dirsearch.py -u $DOMAIN -e php -simple-report=$DIRECTORY/dirsearch
  echo "The results of dirsearch scan are stored in $DIRECTORY/dirsearch."
else
  nmap $DOMAIN >$DIRECTORY/nmap
  echo "The results of nmap are stored in $DIRECTORY/nmap."
  $PATH_TO_DIRSEARCH/dirsearch.py -u $DOMAIN -e php --simple-report=$DIRECTORY/dirsearch
  echo "The results of dirsearch are stored in $DIRECTORY/dirsearch."
fi

# Using Bash "case statements" to simply conditionals by matching serveral variables against one variable
#
# Structure:
# case $VARIABLE_NAME in
#   case1)
#     Do something
#     ;;
#   case2)
#     Do something
#     ;;
#   caseN)
#     Do something
#     ;;
#   *)
#     Default case, this case is executed if no other case matches.
#     ;;
# esac

#!/bin/bash
PATH_TO_DIRSEARCH="/Path/to/Dirsearch"
TODAY=$(date)
echo "This scan was created on $TODAY"
DOMAIN=$1
DIRECTORY=${DOMAIN}_recon
echo "Creating directory $DIRECTORY."
mkdir $DIRECTORY
case $2 in
nmap-only)
  nmap $DOMAIN >$DIRECTORY/nmap
  echo "nmap scan stored in $DIRECTORY/nmap"
  ;;
dirsearch-only)
  $PATH_TO_DIRSEARCH/dirsearch.py -u $DOMAIN -e php --simple-report=$DIRECTORY/dirsearch
  echo "dirsearch stored in $DIRECTORY/dirsearch"
  ;;
crt-only)
  curl "https://crt.sh/?q=$DOMAIN&output=json" -o $DIRECTORY/crt
  echo "cert parsing stored in $DIRECTORY/crt"
  ;;
*)
  nmap $DOMAIN >$DIRECTORY/nmap
  echo "nmap scan stored in $DIRECTORY/nmap."
  $PATH_TO_DIRSEARCH/dirsearch.py -u $DOMAIN -e php --simple-report=$DIRECTORY/dirsearch
  echo "dirsearch scan stored in $DIRECTORY/dirsearch."
  curl "https://crt.sh/?q=$DOMAIN&output=json" -o $DIRECTORY/crt
  echo "cert parsing stored in $DIRECTORY/crt."
  ;;
esac

# Using functions to further simplify the script
#
# Structure:
# FUNCTION_NAME()
# {
#   DO_SOMETHING
# }
#
# Once you've declared a variable in bash, it is global (except input variables)
# Input variables must be stored in a (global) variable to be used in a function.
# ex.: You can't use "nmap $1 > DIRECTORY/nmap". You have to store $1 in DOMAIN=$1 then "nmap $DOMAIN > DIRECTORY/nmap"
# In "nmap $1 > DIRECTORY/nmap", the $1 refers to the first argument that nmap is called with, but we didn't call nmap with an argument,
# so in this example $1 is empty and nmap won't work.

#!/bin/bash
PATH_TO_DIRSEARCH="/Path/to/Dirsearch"
TODAY=$(date)
echo "This scan was created on $TODAY"
DOMAIN=$1
DIRECTORY=${DOMAIN}_recon
echo "Creating directory $DIRECTORY."
mkdir $DIRECTORY
nmap_scan() {
  nmap $DOMAIN >$DIRECTORY/nmap
  echo "The results of nmap scan are stored in $DIRECTORY/nmap"
}
dirsearch_scan() {
  $PATH_TO_DIRSEARCH/dirsearch.py -u $DOMAIN -e php --simple-report=$DIRECTORY/dirsearch
  echo "The results of dirsearch scan are stored in $DIRECTORY/dirsearch."
}
crt_scan() {
  curl "https://crt.sh/?q=$DOMAIN&output=json" -o $DIRECTORY/crt
  echo "The results of cert parsing are stored in $DIRECTORY/crt."
}
case $2 in
nmap-only)
  nmap_scan
  ;;
dirsearch-only)
  dirsearch_scan
  ;;
crt-only)
  crt_scan
  ;;
*)
  nmap_scan
  dirsearch_scan
  crt_scan
  ;;
esac

# Combining the script with the functionality to output files into one master report:

#!/bin/bash
PATH_TO_DIRSEARCH="/Path/to/Dirsearch"
TODAY=$(date)
echo "This scan was created on $TODAY"
DOMAIN=$1
DIRECTORY=${DOMAIN}_recon
echo "Creating directory $DIRECTORY."
mkdir $DIRECTORY
nmap_scan() {
  nmap $DOMAIN >$DIRECTORY/nmap
  echo "The results of nmap scan are stored in $DIRECTORY/nmap"
}
dirsearch_scan() {
  $PATH_TO_DIRSEARCH/dirsearch.py -u $DOMAIN -e php --simple-report=$DIRECTORY/dirsearch
  echo "The results of dirsearch scan are stored in $DIRECTORY/dirsearch."
}
crt_scan() {
  curl "https://crt.sh/?q=$DOMAIN&output=json" -o $DIRECTORY/crt
  echo "The results of cert parsing are stored in $DIRECTORY/crt."
}
case $2 in
nmap-only)
  nmap_scan
  ;;
dirsearch-only)
  dirsearch_scan
  ;;
crt-only)
  crt_scan
  ;;
*)
  nmap_scan
  dirsearch_scan
  crt_scan
  ;;
esac
#Below is the reporting section:
echo "Generating recon report from output files..."
TODAY=$(date)
echo "This scan was created on $TODAY" >$DIRECTORY/report
echo "Results for Nmap:" >>$DIRECTORY/report
grep -E "^\s*\S+\s+\S+\s+\S+\s*$" $DIRECTORY/nmap >>$DIRECTORY/report
echo "Results for Dirsearch:" >>$DIRECTORY/report
cat $DIRECTORY/dirsearch >>$DIRECTORY/report
echo "Results for crt.sh:" >>$DIRECTORY/report
jq -r ".[] .name_value" $DIRECTORY/crt >>$DIRECTORY/report

# Adding multi-domain scanning functionality:
# This script is slightly augmented from the previous.

#!/bin/bash
PATH_TO_DIRSEARCH="/Path/to/Dirsearch"
nmap_scan() {
  nmap $DOMAIN >$DIRECTORY/nmap
  echo "The results of nmap scan are stored in $DIRECTORY/nmap"
}
dirsearch_scan() {
  $PATH_TO_DIRSEARCH/dirsearch.py -u $DOMAIN -e php --simple-report=$DIRECTORY/dirsearch
  echo "The results of dirsearch scan are stored in $DIRECTORY/dirsearch."
}
crt_scan() {
  curl "https://crt.sh/?q=$DOMAIN&output=json" -o $DIRECTORY/crt
  echo "The results of cert parsing are stored in $DIRECTORY/crt."
}
getopts "m:" OPTION
MODE=$OPTARG

for i in "${@:$OPTIND:$#}"; do
  DOMAIN=$i
  DIRECTORY=${DOMAIN}_recon
  echo "Creating directory $DIRECTORY."
  mkdir $DIRECTORY

  case $MODE in
  nmap-only)
    nmap_scan
    ;;
  dirsearch-only)
    dirsearch_scan
    ;;
  crt-only)
    crt_scan
    ;;
  *)
    nmap_scan
    dirsearch_scan
    crt_scan
    ;;
  esac
  #Below is the reporting section:
  echo "Generating recon report from output files..."
  TODAY=$(date)
  echo "This scan was created on $TODAY" >$DIRECTORY/report
  if [ -f $DIRECTORY/nmap ]; then # The [ -f foo ] are used to test a condition and return true or false.
    echo "Results for Nmap:" >>$DIRECTORY/report
    grep -E "^\s*\S+\s+\S+\s+\S+\s*$" $DIRECTORY/nmap >>$DIRECTORY/report
  fi
  if [ -f $DIRECTORY/dirsearch ]; then
    echo "Results for Dirsearch:" >>$DIRECTORY/report
    cat $DIRECTORY/dirsearch >>$DIRECTORY/report
  fi
  if [ -f $DIRECTORY/crt ]; then
    echo "Results for crt.sh:" >>$DIRECTORY/report
    jq -r ".[] .name_value" $DIRECTORY/crt >>$DIRECTORY/report
  fi
done

# A variation of the script utilizing a function library:

#!/bin/bash
source ./scan.lib
PATH_TO_DIRSEARCH="/Path/to/dirsearch"
getopts "m:" OPTION
MODE=$OPTARG
for i in "${@:$OPTIND:$#}"; do
  DOMAIN=$i
  DIRECTORY=${DOMAIN}_recon
  echo "Creating directory $DIRECTORY."
  mkdir $DIRECTORY

  case $MODE in
  nmap-only)
    nmap_scan
    ;;
  dirsearch-only)
    dirsearch_scan
    ;;
  crt-only)
    crt_scan
    ;;
  *)
    nmap_scan
    dirsearch_scan
    crt_scan
    ;;
  esac
  echo "Generating recon report for $DOMAIN..."
  TODAY=$(date)
  echo "This scan was created on $TODAY" >$DIRECTORY/report
  if [ -f $DIRECTORY/nmap ]; then
    echo "Reults for Nmap:" >>$DIRECTORY/report
    grep -E "^\s*\S+\s+\S+\s+\S+\s*$" $DIRECTORY/nmap >>$DIRECTORY/report
  fi
  if [ -f $DIRECTORY/dirsearch ]; then
    echo "Results of Dirsearch:" >>$DIRECTORY/report
    cat $DIRECTORY/dirsearch >>$DIRECTORY/report
  fi
  if [ -f $DIRECTORY/crt ]; then
    echo "Results of crt.sh:" >>$DIRECTORY/report
    jq -r ".[] | .name_value" $DIRECTORY/crt >>$DIRECTORY/report
  fi
done

# The final scripts, which includes all of the previous script functionality, plus an interactive mode:

#!/bin/bash
source ./scan.lib

while getopts "m:i" OPTION; do
  case $OPTION in
  m)
    MODE=$OPTARG
    ;;
  i)
    INTERACTIVE=true
    ;;
  esac
done

scan_domain() {
  DOMAIN=$1
  DIRECTORY=${DOMAIN}_recon
  echo "Creating directory $DIRECTORY."
  mkdir $DIRECTORY
  case $MODE in
  nmap-only)
    nmap_scan
    ;;
  dirsearch-only)
    dirsearch_scan
    ;;
  crt-only)
    crt_scan
    ;;
  *)
    nmap_scan
    dirsearch_scan
    crt_scan
    ;;
  esac
}
report_domain() {
  DOMAIN=$1
  DIRECTORY=${DOMAIN}_recon
  echo "Generating recon report for $DOMAIN..."
  TODAY=$(date)
  echo "This scan was created on $TODAY" >$DIRECTORY/report
  if [ -f $DIRECTORY/nmap ]; then
    echo "Reults for Nmap:" >>$DIRECTORY/report
    grep -E "^\s*\S+\s+\S+\s+\S+\s*$" $DIRECTORY/nmap >>$DIRECTORY/report
  fi
  if [ -f $DIRECTORY/dirsearch ]; then
    echo "Results of Dirsearch:" >>$DIRECTORY/report
    cat $DIRECTORY/dirsearch >>$DIRECTORY/report
  fi
  if [ -f $DIRECTORY/crt ]; then
    echo "Results of crt.sh:" >>$DIRECTORY/report
    jq -r ".[] | .name_value" $DIRECTORY/crt >>$DIRECTORY/report
  fi
}
if [ $INTERACTIVE ]; then
  INPUT="BLANK"
  while [ $INPUT != "quit" ]; do
    echo "Please enter a domain:"
    read INPUT
    if [ $INPUT != "quit" ]; then
      scan_domain $INPUT
      report_domain $INPUT
    fi
  done
else
  for i in "${@:$OPTIND:$#}"; do
    scan_domain $i
    report_domain $i
  done
fi
