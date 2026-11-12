# Copyright 2021 Milan Vukov
# Copyright 2024 idealworks GmbH
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
"""Re-exports @rules_ros2_interfaces//ros2:interfaces.bzl.

The implementation lives in rules_ros2_interfaces so that low-level ROS 2 modules
(rcl_interfaces, rmw_dds_common, ...) can generate interfaces without depending on
this module, which depends on ros2cli. See that module's README.
"""

load(
    "@rules_ros2_interfaces//ros2:interfaces.bzl",
    _RosInterfaceInfo = "RosInterfaceInfo",
    _IdlAdapterInfo = "IdlAdapterInfo",
    _TypeDescriptionInfo = "TypeDescriptionInfo",
    _CGeneratorInfo = "CGeneratorInfo",
    _CppGeneratorInfo = "CppGeneratorInfo",
    _PyGeneratorInfo = "PyGeneratorInfo",
    _idl_adapter_aspect = "idl_adapter_aspect",
    _type_description_aspect = "type_description_aspect",
    _c_generator_aspect = "c_generator_aspect",
    _cpp_generator_aspect = "cpp_generator_aspect",
    _py_generator_aspect = "py_generator_aspect",
    _py_generator_rule = "py_generator_rule",
    _ros2_interface_library_rule = "ros2_interface_library_rule",
    _ros2_c_interface_library = "ros2_c_interface_library",
    _ros2_cpp_interface_library = "ros2_cpp_interface_library",
    _ros2_py_interface_library = "ros2_py_interface_library",
    _ros2_interface_library = "ros2_interface_library",
)

RosInterfaceInfo = _RosInterfaceInfo
IdlAdapterInfo = _IdlAdapterInfo
TypeDescriptionInfo = _TypeDescriptionInfo
CGeneratorInfo = _CGeneratorInfo
CppGeneratorInfo = _CppGeneratorInfo
PyGeneratorInfo = _PyGeneratorInfo
idl_adapter_aspect = _idl_adapter_aspect
type_description_aspect = _type_description_aspect
c_generator_aspect = _c_generator_aspect
cpp_generator_aspect = _cpp_generator_aspect
py_generator_aspect = _py_generator_aspect
py_generator_rule = _py_generator_rule
ros2_interface_library_rule = _ros2_interface_library_rule
ros2_c_interface_library = _ros2_c_interface_library
ros2_cpp_interface_library = _ros2_cpp_interface_library
ros2_py_interface_library = _ros2_py_interface_library
ros2_interface_library = _ros2_interface_library
