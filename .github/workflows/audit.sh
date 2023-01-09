#!/bin/bash

MODULE_DIR='uploading_custom_modules/helm-charts/filebeat/configs/custom_mods'
for dir in $MODULE_DIR/*/*; do
    manifest_check=$(find $dir -name "manifest.yml" -type f | wc -l)
    log_check=$(find $dir -mindepth 1 -name "*.log" -type f | wc -l)
    readme_check=$(find $dir -mindepth 1 -name "README.md" -type f | wc -l)

    # if [[ $manifest_check -eq 1 ]] && [[ $log_check -ge 3 ]] && [[ $readme_check -eq 1 ]]; then
    #     echo "ok"
    # else
    #     echo "Please ensure all module requirements are satisfied in $dir."
    # fi

    if [[ $manifest_check -eq 1 ]]; then
        echo ::set-output name=manifest-check-output::"$pass"
    else
        echo ::set-output name=manifest-check-output::"$fail"
    fi
    
done
