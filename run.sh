#!/bin/bash

### run the two views version ###
dataPath=/data/two_views/images/REW_worktable/
resultsPathTwoViews=/results/two_views/

# make sure result path exists
mkdir -p $resultsPathTwoViews

cd two_views
matlab -nodisplay -r \
    "main('$dataPath', '$resultsPathTwoViews'); main_equi('$dataPath', '$resultsPathTwoViews')"
cd ..

### run the multiple views demos ###
resultsPathMultiViewsPersp=/results/multi_views/persp
resultsPathMultiViewsEqui=/results/multi_views/equi

# make sure result paths exist
mkdir -p $resultsPathMultiViewsPersp
mkdir -p $resultsPathMultiViewsEqui

cd multiple_views
matlab -nodisplay -r \
    "main_ANAP_roundabout('$resultsPathMultiViewsPersp'); main_REW_palace('$resultsPathMultiViewsEqui')"