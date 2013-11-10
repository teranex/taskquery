#!/usr/bin/env ruby

DEFAULT_REPORT = 'all'

command = ARGV.join(' ')

def get_key_from_cmd(key, cmd)
  regex = /#{key}:(\S+)/
  match = regex.match(cmd)
  if match
    return cmd.sub(regex, ''), match[1]
  end
  return cmd, nil
end

command, columns = get_key_from_cmd('columns', command)
command, sort = get_key_from_cmd('sort', command)
command, labels = get_key_from_cmd('labels', command)
command, report = get_key_from_cmd('report', command)

report = DEFAULT_REPORT if report.nil?

new_cmd = ""
new_cmd += "rc.report.#{report}.columns=#{columns} " unless columns.nil?
new_cmd += "rc.report.#{report}.labels=#{labels} " unless labels.nil?
if labels.nil? and !columns.nil?
  new_cmd += "rc.report.#{report}.labels=#{columns} "
end
new_cmd += "rc.report.#{report}.sort=#{sort} " unless sort.nil?
new_cmd += " #{command} #{report}"

puts new_cmd
