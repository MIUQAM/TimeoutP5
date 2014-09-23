// Base code from: 
// Learning Processing
// Daniel Shiffman
// http://www.learningprocessing.com
// Example 10-5: Object-oriented timer

// Modified by : Marc-Antoine Brodeur
// Method isStarted + variable started + method ellapsedTime
// How to use:
// Timer myTimer = new Timer(500);      500 is the timing in milliseconds
// To start de timer : myTimer.start();
// To check if timer is finished : if(myTimer.isFinished()) { /* Your actions here */ }
// myTimer.isStarted() can be useful to check if the timer is already running so you don't start it again before it ends.
// myTimer.getEllapsedTime() returns the time in milliseconds from when it started and the current time if the timer is running.

class Timer {
 
  int savedTime; // When Timer started
  int totalTime; // How long Timer should last
  boolean started = false;
  boolean finished = false;
  
  Timer(int tempTotalTime) {
    this.totalTime = tempTotalTime;
  }
  
  // Starting the timer
  void start() {
    // When the timer starts it stores the current time in milliseconds.
    this.savedTime = millis();
    this.started = true;
  }
  
  // The function isFinished() returns true if totalTime has passed. 
  // The work of the timer is farmed out to this method.
  boolean isFinished() { 
    // Check how much time has passed
    int passedTime = millis() - this.savedTime;
    if (passedTime > this.totalTime && this.started) {
      this.finished = true;
    } else {
      this.finished = false;
    }

    return this.finished;
  }

  // The function isStarted() returns true if the timer started.
  boolean isStarted() { 
    return this.started;
  }

  // The function getEllapsedTime() returns the time in milliseconds from when it started and the current time if the timer is running.
  float getEllapsedTime() {
    if(this.started && !this.finished)
      return millis() - this.savedTime;
    else
      return 0.0;
  }

  // The function getNormalizedEllapsedTime() returns the time from when it started and the current time if the timer is running, normalized in values from 0 to 1
  float getNormalizedEllapsedTime() {
    return norm(this.getEllapsedTime(), 0, this.totalTime);
  }
}