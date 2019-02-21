# Description:
#   <Pet clinic health check script>
#
# Dependencies:
#   "<module name>": "<module version>"
#
# Configuration:
#   LIST_OF_ENV_VARS_TO_SET
#
# Commands:
#   hubot <trigger> - <what the respond trigger does>
#   <trigger> - <what the hear trigger does>
#
# Notes:
#   <optional notes required for the script>
#

module.exports = (robot) ->
  robot.hear /check/i, (msg) ->
    msg.send "Checking Health of petclinic"
    robot.http("http://petclinic-url.com")
      .get() (err, res, body) ->
        if err
          msg.send "Encountered an error :( #{err}"
          return
        if res.statusCode isnt 200
            msg.send "Request didn't come back HTTP 200 :("
            return
        if res.statusCode is 200
            msg.send "I am OK"

  robot.hear /disk usage|use|space/i, (msg) ->
     @exec = require('child_process').exec
     command = "df -h "
     msg.send "Disk free space : "
     @exec command, (error, stdout, stderr) ->
        if error
           msg.send "Encountered an error :( #{error}"
           return
        msg.send stdout

  robot.hear /thanks(.*)/i, (msg) ->
    msg.send "You're welcome!"

  robot.hear /sorry(.*)/i, (msg) ->
    msg.send "No problem!!!"

  robot.respond /(status|how are you)(.*)/i, (msg) ->
   msg.send "Beautiful!!"
