#!/bin/bash
sqlldr control=$HOME/TEST_MRCH_STG.ctl userid=scott/tiger errors=9999999 log=$HOME/TEST_MRCH_STG.log
