# An addon for sshkit

## Install and require 
Install 
```
gem install sshkit-addon
```
Use
```
require 'sshkit-addon'
```

## Define hosts
define the sshkit host with hash structure. then define tasks by choosing the host
```
cap3 = CapBase.new({
  :core1 => { :host => "192.168.5.21", :user => "core", :key => %q(mykey.openssh) },
  :core2 => { :host => "192.168.5.22", :user => "core", :password => 'xxxxx' },
  :core3 => { :host => "192.168.5.22", :user => "core", :password => 'xxxxx' },
})
servers = cap3.servers

desc "run command"
task :run_command, [:cmd] do |t, args|
    cmd = args.cmd
    on servers do |host|
      execute cmd
    end
end

desc "run command on a specific host"
task :run_command_on, [:host_key, :cmd] do |t, args|
    cmd = args.cmd
    on cap3.servers_by_hash[args.host_key] do |host|
      execute cmd
    end
end

```
## Backend helper
upload a string to remote file
```
  put %Q(configuration strings), file="/tmp/config.txt"
  execute %Q(cat #{file})
```

## A shell command constructor
Join the lines by default with " && ", excluding the comment
```
    cmds = ShellCommandConstructor.construct_command %Q{
       # comment line
       hostname
       id
    }
    execute cmds
```


## format
Basically a clone of the sshkit pretty format. Just update the command output with hostname prefixed
