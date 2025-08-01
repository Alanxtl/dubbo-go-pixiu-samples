#
#  Licensed to the Apache Software Foundation (ASF) under one or more
#  contributor license agreements.  See the NOTICE file distributed with
#  this work for additional information regarding copyright ownership.
#  The ASF licenses this file to You under the Apache License, Version 2.0
#  (the "License"); you may not use this file except in compliance with
#  the License.  You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
#  limitations under the License.

array=("dubbogo/simple/body")
array+=("dubbogo/simple/jaeger")
array+=("dubbogo/simple/mix")
array+=("dubbogo/simple/proxy")
array+=("dubbogo/simple/query")
array+=("dubbogo/simple/uri")
array+=("dubbogo/simple/resolve")
array+=("dubbogo/simple/zookeeper")
array+=("dubbogo/simple/nacos")
array+=("dubbogo/simple/triple")
array+=("dubbogo/simple/direct")
array+=("dubbogo/simple/prometheus")

#
##http
array+=("http/grpc")
array+=("http/simple")
## grpc proxy
array+=("grpc/deprecated")

for((i=0;i<${#array[*]};i++))
do
	sh ./integrate_test.sh ${array[i]}
	result=$?
	if [ $result -gt 0 ]; then
    exit $result
	fi
done
