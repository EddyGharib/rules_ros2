"""Re-exports @rules_ros2_interfaces//ros2:cc_opts.bzl."""

load("@rules_ros2_interfaces//ros2:cc_opts.bzl", _CPP_COPTS = "CPP_COPTS", _C_COPTS = "C_COPTS")

C_COPTS = _C_COPTS
CPP_COPTS = _CPP_COPTS
