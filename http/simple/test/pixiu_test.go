/*
 * Licensed to the Apache Software Foundation (ASF) under one or more
 * contributor license agreements.  See the NOTICE file distributed with
 * this work for additional information regarding copyright ownership.
 * The ASF licenses this file to You under the Apache License, Version 2.0
 * (the "License"); you may not use this file except in compliance with
 * the License.  You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package test

import (
	"io"
	"net/http"
	"strings"
	"testing"
	"time"
)

import (
	"github.com/apache/dubbo-go-pixiu/pkg/common/constant"

	"github.com/stretchr/testify/assert"
)

func TestPost(t *testing.T) {
	url := "http://localhost:8888/user/"
	data := "{\"id\":\"0003\",\"code\":3,\"name\":\"dubbogo\",\"age\":99}"
	client := &http.Client{Timeout: 5 * time.Second}
	req, err := http.NewRequest("POST", url, strings.NewReader(data))
	assert.NoError(t, err)
	req.Header.Add("Origin", "api.dubbo.com")
	req.Header.Add("Content-Type", "application/json")
	resp, err := client.Do(req)
	assert.NoError(t, err)
	assert.NotNil(t, resp)
	assert.Equal(t, 200, resp.StatusCode)
	s, _ := io.ReadAll(resp.Body)
	assert.True(t, strings.Contains(string(s), "dubbogo"))
	ao := resp.Header.Get(constant.HeaderKeyAccessControlAllowOrigin)
	assert.Equal(t, "api.dubbo.com", ao)
}

func TestGET1(t *testing.T) {
	url := "http://localhost:8888/user/tc"
	client := &http.Client{Timeout: 5 * time.Second}
	req, err := http.NewRequest("GET", url, nil)
	assert.NoError(t, err)
	req.Header.Add("Origin", "api.dubbo.com")
	req.Header.Add("Content-Type", "application/json")
	resp, err := client.Do(req)
	assert.NoError(t, err)
	assert.NotNil(t, resp)
	assert.Equal(t, 200, resp.StatusCode)
	s, _ := io.ReadAll(resp.Body)
	assert.True(t, strings.Contains(string(s), "0001"))
	ao := resp.Header.Get(constant.HeaderKeyAccessControlAllowOrigin)
	assert.Equal(t, "api.dubbo.com", ao)
}
