#!/bin/bash
DATE=`date +%Y-%m-%d_%H:%M:%S`
adb shell dumpsys gfxinfo com.eg.android.AlipayGphone > dump_gfxinfo_${DATE}.txt
echo "success, output: dump_gfxinfo_${DATE}.txt"
