# Copyright 2020 Samuel Odell Scott

#!/bin/bash

deploy_file=deploy_testing_suite.sh
deployment_source=deployment_files.txt
deployment_wgets=deployment_urls.txt

# deployment script is to be a bash script
echo '#!/bin/bash' > $deploy_file

# add components pre file extraction
for component in precomponent_*; do
    echo
    echo '####' $component '####'
    cat $component
done >> $deploy_file

# files to extract from the deployment script
# add the testing scripts and licenses to be written to testing directory
    echo >> $deploy_file
    echo '####' testing scripts and licenses '####' >> $deploy_file

if [ -f "$deployment_source" ]; then # deployment files to wrap into installer
    while IFS="" read -r line
    do
        if [ -n "$line" ]; then
            echo
            echo "base64 -di > $line <<'EOF'"
            base64 $line
            echo EOF
        fi
    done < $deployment_source >> $deploy_file
fi

if [ -f "$deployment_wgets" ]; then
    while IFS="" read -r line
    do
        if [ -n "$line" ]; then
            echo
            echo "wget $line"
        fi
    done < $deployment_wgets >> $deploy_file
fi

# add components post file extraction
for component in postcomponent_*; do
    echo
    echo '####' $component '####'
    cat $component
done >> $deploy_file
