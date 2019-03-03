# Commands:
# The robot.respond callback is only called for messages that are immediately preceded by the robot’s name or alias (essbot).
#   essbot Hey! <your-name>

module.exports = (robot) ->
  robot.respond /Hey! (.*)$/i, (msg) ->
    name = msg.match[1]
    msg.send "You're welcome! #{name}"
