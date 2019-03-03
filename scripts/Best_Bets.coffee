# Commands:
#   essbot BB_Create <name> <url> <Partial Keyword(s)>
# Examples:
#   essbot BB_Create Google http://www.google.com search
#   essbot BB_Create Google http://www.google.com search,google,seo,marketing,glge

module.exports = (robot) ->
  robot.respond /BB_Create (.*) (.*) (.*)$/i, (msg) ->
    name = msg.match[1]
    url = msg.match[2]
    PartialKW = msg.match[3]
    msg.send "Your BestBets request is: #{name} #{url} #{PartialKW}"

    @exec = require('child_process').exec
    command = "printf \"$(shuf -i 850-1000 -n 1)|BB:#{name}|#{name}|#{url}?BB=1|Global|3|#{PartialKW}||||Houston||||||||,,,,,\n\" >> /home/ubuntu/git/simple_test_repo/BBList_Import.csv && sh /home/ubuntu/BB_hubot.sh create"

    @exec command, (error, stdout, stderr) ->
      msg.send error
      msg.send stdout
      msg.send stderr
