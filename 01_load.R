# Copyright 2019 Province of British Columbia
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and limitations under the License.

source("header.R")

#Read WMU raster from the GB_Data directory - WMUs are from the 2015 CE grizzly bear data set - validated by Tony Hamilton
WMUr<-raster(file.path(StrataDir,"WMUr.tif"))
WMUr_NonHab<-raster(file.path(StrataDir,"WMUr_NonHab.tif"))
WMU<-st_read(file.path(GBspatialDir,'WMU.shp'))

GBPUr<-raster(file.path(StrataDir,"GBPUr.tif"))
GBPU<-st_read(file.path(GBspatialDir,'GBPU.shp'))

#Read in CI Data
CI_Samples<-st_read(file.path(DataDir,'CI_data/SkeenaESI_GBPU_CI_post94.shp'))

#CI_Samples[is.na(CI_Samples)] <- 0
