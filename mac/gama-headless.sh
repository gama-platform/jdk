#!/bin/bash
memory=4096m

for arg do
  shift
  case $arg in
    -m) 
    memory="${1}" 
    shift 
    ;;
    *) 
    set -- "$@" "$arg" 
    ;;
  esac
done

echo "******************************************************************"
echo "* GAMA version 1.81.                                             *"
echo "* http://gama-platform.org                                       *"
echo "* (c) 2007-2020 UMI 209 UMMISCO IRD/SU & Partners                *"
echo "******************************************************************"
passWork=.work$RANDOM

if ! $( dirname "${BASH_SOURCE[0]}" )/../jdk/bin/java -cp $( dirname "${BASH_SOURCE[0]}" )/../Eclipse/plugins/org.eclipse.equinox.launcher*.jar -Xms512m -Xmx$memory -Djava.awt.headless=true org.eclipse.core.launcher.Main  -application msi.gama.headless.id4 -data $passWork "$@"; then
    echo "Error in you command, here's the log :"
    cat $( dirname "${BASH_SOURCE[0]}" )/$passWork/.metadata/.log
fi
