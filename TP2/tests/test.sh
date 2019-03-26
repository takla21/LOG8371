#!/bin/bash

#--silent --output /dev/null

START=1
END=$1
echo 'start'
for i in $(seq $START $END)
do
    curl --silent --output /dev/nul -X POST "http://$2:8080/algorithm/NaiveBayes" -H "accept: text/uri-list" -H "Content-Type: multipart/form-data" -F "datasetUri=" -F "batchSize=100" -F "useKernelEstimator=0" -F "useSupervisedDiscretization=1" -F "validation=CrossValidation" -F "validationNum=10" -F "file=@contact-lenses.arff"
	curl --silent --output /dev/nul -X POST "http://$2:8080/algorithm/NaiveBayes" -H "accept: text/uri-list" -H "Content-Type: multipart/form-data" -F "datasetUri=" -F "batchSize=100" -F "useKernelEstimator=0" -F "useSupervisedDiscretization=1" -F "validation=CrossValidation" -F "validationNum=10" -F "file=@diabetes.arff"
	curl --silent --output /dev/nul -X POST "http://$2:8080/algorithm/NaiveBayes" -H "accept: text/uri-list" -H "Content-Type: multipart/form-data" -F "datasetUri=" -F "batchSize=100" -F "useKernelEstimator=0" -F "useSupervisedDiscretization=1" -F "validation=CrossValidation" -F "validationNum=10" -F "file=@breast-cancer.arff"
done
echo All done


#!/bin/bash

