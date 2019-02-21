module.exports = (robot) ->
  robot.respond /show calendar/i, (res) ->
    res.send "Today date is " + new Date()
