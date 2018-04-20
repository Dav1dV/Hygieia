#!/bin/bash

if [ "$SKIP_PROPERTIES_BUILDER" = true ]; then
  echo "Skipping properties builder"
  echo "`cat $PROP_FILE`"
  exit 0
fi


cat > $PROP_FILE <<EOF
dbname=${MONGODB_DATABASE:-dashboarddb}
dbhost=${MONGODB_HOST:-db}
dbport=${MONGODB_PORT:-27017}
dbusername=${MONGODB_USERNAME:-dashboarduser}
dbpassword=${MONGODB_PASSWORD:-dbpassword}

aws.cron=${AWS_CRON:-0 */5 * * * *}

aws.proxyHost=${AWS_PROXY_HOST}
aws.proxyPort=${AWS_PROXY_PORT}
aws.nonProxy=${AWS_NON_PROXY}

aws.profile=${AWS_PROFILE}

EOF


# aws.validTagKey[]

# Determine how may AWS resource tag keys are specified in the environment
max=$(wc -w <<< "${!AWS_VALID_TAG_KEY*}")

if [ $max -le 0 ]
then
cat >> $PROP_FILE <<EOF
aws.validTagKey=
EOF

else
        # Loop through the AWS resources tag keys  &  output the corresponding configuration
        i=0
        while [ $i -lt $max ]
        do
                if [ $i -eq 0 ]
                then
                        validTagKey="AWS_VALID_TAG_KEY"
                else
                        validTagKey="AWS_VALID_TAG_KEY$i"
                fi

cat >> $PROP_FILE <<EOF
aws.validTagKey[${i}]=${!validTagKey}
EOF

                i=$(($i+1))
        done
fi


echo "

===========================================
Properties file created `date`:  $PROP_FILE
Note: passwords hidden
===========================================
`cat $PROP_FILE |egrep -vi password`
"

exit 0
