require "sshkit"
require "sshkit/dsl"
include SSHKit::DSL

require File.dirname(__FILE__) + "/sshkit_monkey_patch"

class CapBase
	attr_reader :servers, :servers_by_hash
	def initialize server_hash
		@servers = []
		@servers_by_hash = {}

		server_hash.each do |name, hash|
			args = [:host,:user,:port,:password].each_with_object({}) do |key, h|
				if key == :host
					h[:hostname] = hash[key]
				else
					h[key] = hash[key] if hash.has_key? key
				end
			end

			# host = SSHKit::Host.new :hostname => hash[:host], :user => hash[:user], :password => hash[:password]
			host = SSHKit::Host.new args
			host.key = hash[:key] if hash.has_key? :key #use ssh private key file

			host.properties.options = hash

			@servers.push host

			@servers_by_hash[name] = host
		end
	end
end
