Date.prototype.getStartOfDay = function() {
  this.setHours(0, 0, 0, 0)
  return this
}

Date.prototype.getStartOfWeek = function() {
  if (this.getDay()) {
    this.setHours(-Math.abs(this.getDay() - 1) * 24, 0, 0, 0)
  } else {
    this.setHours(-6 * 24, 0, 0, 0)
  }
  return this
}

Date.prototype.getStartOfMonth = function() {
  if (this.getDate()) {
    this.setHours(-Math.abs(this.getDate() - 1) * 24, 0, 0, 0)
  } else {
    this.setHours(0, 0, 0, 0)
  }
  return this
}

Date.prototype.getStartOfYear = function() {
  if (this.getDayOfYear()) {
    this.setHours(-Math.abs(this.getDayOfYear() - 1) * 24, 0, 0, 0)
  } else {
    this.setHours(0, 0, 0, 0)
  }
  return this
}

Date.prototype.getDayOfYear = function() {
  var date = this.clone(this)
  date.setMonth(0, 0)
  return Math.round((this - date) / 8.64e7)
}

Date.prototype.clone = function() {
  return new Date(this.getTime())
}

var date = new Date(556095600444)

var timeperiods = {
  "year": date.clone().getStartOfYear().toISOString(),
  "month": date.clone().getStartOfMonth().toISOString(),
  "week": date.clone().getStartOfWeek().toISOString(),
  "day": date.clone().getStartOfDay().toISOString()
}