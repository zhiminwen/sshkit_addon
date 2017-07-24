#take out the support of ssh gateway as the upload/download is not really supported
require File.dirname(__FILE__) + "/sshkit_my_formatter"
SSHKit.config.use_format :myformatter

module SSHKit; module Backend; class Netssh
    def put strings, remote, options = {}
        local = StringIO.new strings
        upload! local, remote, options
    end

    def su_run user, cmd
      execute %Q(su - #{user} -c "#{cmd}")
    end
    alias_method :su_execute, :su_run

    def sudo cmd
        SSHKit::Backend::Netssh.config.pty = true
        # p host
        password = host.password
        execute %Q( echo #{password} | sudo -kS bash -c "#{cmd}" )

        # execute %Q(sudo bash -c "#{cmd}"), interaction_handler: {
        #     /\(yes\/no\)/i => "yes\n",
        #     /[sudo] password/i => "#{password}\n",
        # }

    end

end;end;end

SSHKit.config.output_verbosity = SSHKit::Logger::DEBUG
