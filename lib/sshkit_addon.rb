require "sshkit"
require "sshkit/dsl"
include SSHKit::DSL

require File.dirname(__FILE__) + "/addon/sshkit_monkey_patch"
require File.dirname(__FILE__) + "/addon/cap_base"
require File.dirname(__FILE__) + "/addon/shell_command_constructor"


