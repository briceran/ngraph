# ******************************************************************************
# Copyright 2017-2018 Intel Corporation
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
# ******************************************************************************

function(NGRAPH_GET_CURRENT_HASH)
    execute_process(
        COMMAND ${GIT_EXECUTABLE} rev-parse --verify HEAD
        RESULT_VARIABLE result
        OUTPUT_VARIABLE HASH)
    set(NGRAPH_CURRENT_HASH ${HASH} PARENT_SCOPE)
endfunction()

function(NGRAPH_GET_TAG_OF_CURRENT_HASH)
    execute_process(
        COMMAND ${GIT_EXECUTABLE} ls-remote --tags
        RESULT_VARIABLE RESULT
        OUTPUT_VARIABLE TAG_LIST)
    NGRAPH_GET_CURRENT_HASH()
    # set(NGRAPH_CURRENT_HASH 739930197709314d0b54aea72ae0f4c93d34600e)

    string(REGEX MATCH "${NGRAPH_CURRENT_HASH}\t[^\r\n]*" TAG ${TAG_LIST})
    string(REGEX REPLACE "${NGRAPH_CURRENT_HASH}\trefs/tags/" "" FINAL_TAG ${TAG})
    set(NGRAPH_CURRENT_RELEASE_TAG ${FINAL_TAG} PARENT_SCOPE)
endfunction()

