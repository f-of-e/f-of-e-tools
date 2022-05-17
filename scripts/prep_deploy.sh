#!/bin/sh

SCRIPT=$(readlink -f "$0")
SCRIPTPATH=$(dirname "$SCRIPT")

$SCRIPTPATH/prepare.sh $1
$SCRIPTPATH/deploy.sh $1

