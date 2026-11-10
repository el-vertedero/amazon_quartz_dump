#!/vendor/bin/sh
#
# Copyright 2023 Amazon.com, Inc. or its affiliates. All Rights Reserved.
#

# Executes the amzn_dha_tool self-test
amzn_dha_tool -t > /dev/null 2>&1

# Check return status and setprop accordingly
if [ $? -eq 0 ]; then
    setprop ro.vendor.amzn_dha.self_test success
else
    setprop ro.vendor.amzn_dha.self_test fail
fi
