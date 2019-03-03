module.exports = (robot) ->
  robot.hear /thanks(.*)/i, (msg) ->
    msg.send "You're welcome!"
