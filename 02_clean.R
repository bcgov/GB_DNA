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

#Pull out Babine and Cranberry
BabCranGBPU<-GBPU[GBPU$POPUL %in% c('Babine','Cranberry'),]

pts_in<-CI_Samples[(over(CI_Samples,BabCranGBPU)),]

tt<-st_within(CI_Samples,BabCranGBPU)

tt2<-st_join(BabCranGBPU,CI_Samples)

tt4<-st_join(CI_Samples, BabCranGBPU, join = st_within)

pts<-CI_Samples
polys<-BabCranGBPU

pi <- st_contains(polys,pts, sparse = F) %>%
  as.data.frame() %>%
  mutate(polys = polys$ID) %>%
  dplyr::select(dim(pi)[2],1:dim(pi)[1])

#row1 - Cranberry, row2 - Babine
#True or Fals if present

colnames(pi)[2:dim(pi)[2]] = levels(pts$ID)


