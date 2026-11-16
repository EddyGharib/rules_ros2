# Copyright 2022 Milan Vukov
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
"""Re-exports @rules_ros2_plugins//ros2:plugin.bzl.

The implementation lives in rules_ros2_plugins so that packages which only build pluginlib
plugins do not depend on this module (and through it on ros2cli). See that module's README.
"""

load(
    "@rules_ros2_plugins//ros2:plugin.bzl",
    _ros2_plugin = "ros2_plugin",
    _ros2_plugin_rule = "ros2_plugin_rule",
)

ros2_plugin = _ros2_plugin
ros2_plugin_rule = _ros2_plugin_rule
