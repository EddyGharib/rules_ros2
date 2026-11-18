""" Defines the ROS 2 C++ test macro.

Plain C/C++ libraries and binaries use cc_library/cc_binary directly.
"""

load("@com_github_mvukov_rules_ros2//ros2:ament.bzl", "sh_launcher", "split_kwargs")
load("@com_github_mvukov_rules_ros2//ros2:cc_opts.bzl", "CPP_COPTS")
load("@rules_cc//cc:defs.bzl", "cc_binary")
load("@rules_shell//shell:sh_test.bzl", "sh_test")

def ros2_cpp_test(name, ros2_package_name = None, idl_deps = None, **kwargs):
    """ Defines a ROS 2 C++ test.

    Builds the test as a cc_binary and runs it through a launcher which:
        * Sets AMENT_PREFIX_PATH to point to a generated ament file tree
        * Defaults ROS_HOME and ROS_LOG_DIR to $TEST_UNDECLARED_OUTPUTS_DIR (if set,
          otherwise to $TEST_TMPDIR, see https://bazel.build/reference/test-encyclopedia#initial-conditions)

    Args:
        name: A unique target name.
        ros2_package_name: If given, defines a ROS package name for the target.
            Otherwise, the test's binary name is used as the package name.
        idl_deps: Additional IDL deps that are used as runtime plugins.
        **kwargs: https://bazel.build/reference/be/common-definitions#common-attributes-tests
    """
    launcher_target_kwargs, binary_kwargs = split_kwargs(**kwargs)
    target_impl = name + "_impl"
    cc_binary(
        name = target_impl,
        copts = CPP_COPTS + binary_kwargs.pop("copts", []),
        local_defines = [
            "ROS_PACKAGE_NAME=\\\"{}\\\"".format(ros2_package_name or target_impl),
        ] + binary_kwargs.pop("local_defines", []),
        tags = ["manual"],
        **binary_kwargs
    )

    launcher = "{}_launch".format(name)
    sh_launcher(
        launcher,
        deps = [target_impl],
        template = "@com_github_mvukov_rules_ros2//ros2:launch.sh.tpl",
        substitutions = {
            "{entry_point}": "$(rootpath {})".format(target_impl),
        },
        tags = ["manual"],
        data = [target_impl],
        idl_deps = idl_deps,
        testonly = True,
    )

    sh_test(
        name = name,
        srcs = [launcher],
        data = [target_impl],
        **launcher_target_kwargs
    )
