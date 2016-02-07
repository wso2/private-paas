#!/bin/bash
# --------------------------------------------------------------
#
# Licensed to the Apache Software Foundation (ASF) under one
# or more contributor license agreements.  See the NOTICE file
# distributed with this work for additional information
# regarding copyright ownership.  The ASF licenses this file
# to you under the Apache License, Version 2.0 (the
# "License"); you may not use this file except in compliance
# with the License.  You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing,
# software distributed under the License is distributed on an
# "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
# KIND, either express or implied.  See the License for the
# specific language governing permissions and limitations
# under the License.
#
# --------------------------------------------------------------
#
var_base_url=https://localhost:8443/
var_username="admin"
var_password="admin"
echo "Undeploying application..."
curl -X POST -H "Content-Type: application/json" -k -v -u ${var_username}:${var_password} ${var_base_url}api/applications/PHP/undeploy
sleep 10
echo "Deleting application..."
curl -X DELETE -H "Content-Type: application/json" -k -v -u ${var_username}:${var_password} ${var_base_url}api/applications/PHP
echo "Removing cartridges..."
curl -X DELETE -H "Content-Type: application/json" -k -v -u ${var_username}:${var_password} ${var_base_url}api/cartridges/php
echo "Removing autoscale policies..."
curl -X DELETE -H "Content-Type: application/json" -k -v -u ${var_username}:${var_password} ${var_base_url}api/autoscalingPolicies/simpleAutoscalePolicy
echo "Removing deployment policies..."
curl -X DELETE -H "Content-Type: application/json" -k -v -u ${var_username}:${var_password} ${var_base_url}api/deploymentPolicies/economyDeploymentPolicy
echo "Removing application policies..."
curl -X DELETE -H "Content-Type: application/json" -k -v -u ${var_username}:${var_password} ${var_base_url}api/applicationPolicies/application-policy-economyDeploymentPolicy
echo "Removing network partitions..."

curl -X DELETE -H "Content-Type: application/json" -k -v -u ${var_username}:${var_password} ${var_base_url}api/networkPartitions/os2