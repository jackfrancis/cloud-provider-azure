# syntax=docker/dockerfile:1

# Copyright 2019 The Kubernetes Authors.
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

FROM mcr.microsoft.com/oss/go/microsoft/golang:1.24-bookworm@sha256:b8ef0958d2128e1095fb673e7305d97e47d764ac4fe5d0b8bcef69abfcdfa9f1

WORKDIR /go/src/sigs.k8s.io/cloud-provider-azure

COPY . .

RUN go get github.com/onsi/ginkgo/ginkgo \
  && go get github.com/onsi/gomega/... \
  && go mod tidy
