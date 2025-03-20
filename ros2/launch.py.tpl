import os
import sys

from ros2cli import cli
from ros2launch.command import launch

{ament_setup}

LAUNCH_FILE = '{launch_file}'

# If we are running from a packaged environement the binary may be
# at a different location from the CWD launched in bazel
# this check would move CWD to where it should be
if os.path.exists("{rule_name}.runfiles/_main/"):
  os.chdir("{rule_name}.runfiles/_main/")

# The package name is intentionally undefined such that ros2launch picks up
# the given launch file.
argv = [LAUNCH_FILE] + sys.argv[1:]

extension = launch.LaunchCommand()
sys.exit(cli.main(argv=argv, extension=extension))
