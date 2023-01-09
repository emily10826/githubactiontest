#!/bin/bash

MODULE_DIR='uploading_custom_modules/helm-charts/filebeat/configs/custom_mods'
for dir in $MODULE_DIR/*/*; do
    manifest_check=$(find $dir -name "manifest.yml" -type f | wc -l)
    log_check=$(find $dir -mindepth 1 -name "*.log" -type f | wc -l)
    readme_check=$(find $dir -maxdepth 1 -name "README.md" -type f | wc -l)

    if [[ $manifest_check -eq 1 ]]; then
        # echo ::set-output name=manifest-check-output::$pass
        :
    else
        echo ::warning ::"Missing manifest.yml in $dir."
    fi

    if [[ $log_check -ge 3 ]]; then
        :
    else
        echo ::warning ::"Missing at least 3 log files in $dir."
    fi 

    if [[ $readme_check -eq 1 ]]; then
        :
    else
        echo ::warning ::"Missing README.md in $dir."
    fi
    
done
