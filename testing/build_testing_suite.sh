# Copyright 2020 Samuel Odell Scott

#!/bin/bash

deploy_file=deploy_testing_suite.sh
deployment_source=deployment_files.txt

# add initial components
echo '#!/bin/bash' > $deploy_file
for component in testing_suite_component_*; do
    echo
    echo '####' $component '####'
    cat $component
done >> $deploy_file

# add the testing scripts and licenses to be written to testing directory
echo >> $deploy_file
echo '####' testing scripts and licenses '####' >> $deploy_file
while IFS="" read -r line
do
    if [ -n "$line" ]; then
        echo
        echo "base64 -di $line > $line <<'EOF'"
        base64 $line
        echo EOF
    fi
done < $deployment_source >> $deploy_file

for ps in testing_suite_ps_*; do
    echo
    echo '####' $ps '####'
    cat $ps
done >> $deploy_file
