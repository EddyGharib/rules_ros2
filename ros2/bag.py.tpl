import os
import sys

# Load C++ extension modules (rosbag2_py *.so) and their dlopen'd pluginlib
# plugins into the GLOBAL symbol scope. Required under Clang/libc++, whose
# dynamic_cast compares std::type_info by address: with the default RTLD_LOCAL,
# the plugin's and consumer's typeinfo for the plugin base class are not unified
# across the dlopen boundary, so class_loader's dynamic_cast in createInstance
# fails ("Could not create instance of type ..."). libstdc++ (GCC) compared by
# string and so tolerated this. Setting RTLD_GLOBAL here (before importing the
# extension modules) unifies the typeinfo.
sys.setdlopenflags(os.RTLD_GLOBAL | os.RTLD_LAZY)

import ros2.ros2_cmd
import ros2bag.verb.convert
import ros2bag.verb.info
import ros2bag.verb.list
import ros2bag.verb.play
import ros2bag.verb.record
import ros2bag.verb.reindex
import ros2cli.cli

{ament_setup}

COMMAND_EXTENSIONS = {
    'convert': ros2bag.verb.convert.ConvertVerb(),
    'info': ros2bag.verb.info.InfoVerb(),
    'list': ros2bag.verb.list.ListVerb(),
    'play': ros2bag.verb.play.PlayVerb(),
    'record': ros2bag.verb.record.RecordVerb(),
    'reindex': ros2bag.verb.reindex.ReindexVerb(),
}

extension = ros2.ros2_cmd.Ros2CommandExtension(COMMAND_EXTENSIONS)
sys.exit(ros2cli.cli.main(extension=extension))
