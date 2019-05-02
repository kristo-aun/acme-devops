#!/usr/bin/env bash

templateFile=$1
outFile=$2

perl -p -e 's/\$\{([^}]+)\}/defined $ENV{$1} ? $ENV{$1} : ""/eg' $templateFile > $outFile

# bug: escapes escape character
#perl -pe 's;(\\*)(\$([a-zA-Z_][a-zA-Z_0-9]*)|\$\{([a-zA-Z_][a-zA-Z_0-9]*)\})?;substr($1,0,int(length($1)/2)).($2&&length($1)%2?$2:$ENV{$3||$4});eg' $templateFile > $outFile

echo "Creating Helm config file...Done"
