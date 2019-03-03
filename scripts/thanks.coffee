# Commands:
#   The robot.hear /thanks/ callback is called anytime a message’s text matches. For example:
#   thanks
#   Many thanks!

module.exports = (robot) ->
  robot.hear /thanks(.*)/i, (msg) ->
    msg.send "You're welcome!"
