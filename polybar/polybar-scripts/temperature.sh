#!/usr/bin/sh

sensors | awk '/\+/{print $2}' | tr -d '+=' | tail -n1 | awk '{print "+"$0"°C"}'
