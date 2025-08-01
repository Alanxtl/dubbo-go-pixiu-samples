#
# Licensed to the Apache Software Foundation (ASF) under one
# or more contributor license agreements.  See the NOTICE file
# distributed with this work for additional information
# regarding copyright ownership.  The ASF licenses this file
# to you under the Apache License, Version 2.0 (the
# "License"); you may not use this file except in compliance
# with the License.  You may obtain a copy of the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing,
# software distributed under the License is distributed on an
# "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
# KIND, either express or implied.  See the License for the
# specific language governing permissions and limitations
# under the License.
#
ADDRESS="127.0.0.1:8881"

API1=$(curl -s -X GET ${ADDRESS}"/api/v1/test-dubbo/user/tc?age=99")
API2=$(curl -s -X PUT ${ADDRESS}"/api/v1/test-dubbo/user/tc" -d '{"id":"0001","code":1,"name":"tc","age":66}' --header "Content-Type: application/json")
API3=$(curl -s -X PUT ${ADDRESS}"/api/v1/test-dubbo/user?name=tc" -d '{"id":"0001","code":1,"name":"tc","age":55}' --header "Content-Type: application/json")

ARRAY_API=(${API1} ${API2} ${API3})

for element in ${ARRAY_API[@]}
do
echo ${element}
done