// Set the end date for the timer
// To create a countdown timer using Javascript, we first need to declare a variable that holds the date and time that we want our countdown timer to run down to. We create a Date object and then call the getTime() function on this object. The getTime() method makes the countDownDate variable hold the milliseconds since Jan 1, 1970, 00:00:00.000 GMT.

// 1
// var countDownDate = new Date("Jul 25, 2021 16:37:52").getTime();
// Make the timer function update every second
// Next, we make a var myfunc() function​ and make it run every second using the setInterval() method.

// 1234
var myfunc = setInterval(function() {
// code goes here
}, 1000)

// Calculate the remaining time in days, hours, minutes, and seconds
// Then, we calculate the time difference (in milliseconds​) between our current date and end date. Once this difference has been​ found, we ​convert the milliseconds into days, hours, minutes, and seconds.

// 1234567
var now = new Date().getTime();
var timeleft = countDownDate - now;
    
var days = Math.floor(timeleft / (1000 * 60 * 60 * 24));
var hours = Math.floor((timeleft % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
var minutes = Math.floor((timeleft % (1000 * 60 * 60)) / (1000 * 60));
var seconds = Math.floor((timeleft % (1000 * 60)) / 1000);
// ​Display the output to users
// Display the values for the days, hours, minutes, and seconds (that we calculated) to the users through HTML. The following code replaces HTML elements, that have their own respective IDs, with the appropriate values.

// 1234
document.getElementById("days").innerHTML = days + "d "
document.getElementById("hours").innerHTML = hours + "h " 
document.getElementById("mins").innerHTML = minutes + "m " 
document.getElementById("secs").innerHTML = seconds + "s"
// Display a message when the timer is over
// We also need to take appropriate action when the countdown is over. The following code clears the values of days, hours, minutes, and seconds and displays a heading when the timer is up. It also stops executing myfunc using the clearInterval method.

// 12345678
if (timeleft < 0) {
    clearInterval(myfunc);
    document.getElementById("days").innerHTML = ""
    document.getElementById("hours").innerHTML = "" 
    document.getElementById("mins").innerHTML = ""
    document.getElementById("secs").innerHTML = ""
    document.getElementById("end").innerHTML = "TIME UP!!";
}
// Implementation
// The full code, used to implement a countdown timer in Javascript,​ is given below: