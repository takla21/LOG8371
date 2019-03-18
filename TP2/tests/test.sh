#!/bin/bash

bayes_net () {
	curl --silent --output /dev/null -X POST "http://172.17.0.4:8080/algorithm/BayesNet" -H "accept: text/uri-list" -H "Content-Type: multipart/form-data" -F "estimator=SimpleEstimator" -F "estimatorParams=0.5" -F "searchAlgorithm=local.K2" -F "useADTree=" -F "validationNum=10" -F "searchParams=-P 1 -S BAYES" -F "datasetUri=" -F "validation=CrossValidation" -F "file=@breast-cancer.arff" 
}

decision_stump () {
	curl --silent --output /dev/null -X POST "http://172.17.0.4:8080/algorithm/DecisionStump" -H "accept: text/uri-list" -H "Content-Type: multipart/form-data" -F "datasetUri=" -F "validation=CrossValidation" -F "validationNum=10" -F "file=@breast-cancer.arff"
}

simple_k_means () {
	curl --silent --output /dev/null -X POST "http://172.17.0.4:8080/cluster/SimpleKMeans" -H "accept: text/x-arff" -H "Content-Type: multipart/form-data" -F "initializationMethod=" -F "numExecutionSlots=" -F "canopyPeriodicPruningRate=" -F "dontReplaceMissingValues=" -F "canopyT1=" -F "canopyT2=" -F "fastDistanceCalc=" -F "distanceFunction=" -F "canopyMaxNumCanopiesToHoldInMemory=" -F "reduceNumberOfDistanceCalcsViaCanopies=" -F "seed=" -F "datasetUri=" -F "maxIterations=" -F "canopyMinimumCanopyDensity=" -F "preserveInstancesOrder=" -F "file=@breast-cancer.arff" -F "displayStdDevs=" -F "numClusters="
}

START=1
END=$1
echo 'start'
for i in $(seq $START $END)
do
    case $2 in
	'b')
		bayes_net
		;;
	'd')
		decision_stump
		;;
	'k')
		simple_k_means
		;;
	esac
done
echo All done