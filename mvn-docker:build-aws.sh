#mvn docker:build -pl collectors/cloud/aws  -am |& tee mvn-docker:build-aws.log

mvn docker:build --projects collectors/cloud/aws  --also-make  |& tee -a mvn-docker:build-aws.log
