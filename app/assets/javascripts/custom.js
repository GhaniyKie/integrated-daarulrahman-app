// Open SideNav
function openSideNav(id) {
    if (id === "homeSideNav") {
        document.getElementById(id).style.width = "100%";
    } else if (id === "dashSideNav") {
        if(window.screen.width * window.devicePixelRatio < 1280) {
            document.getElementById(id).style.width = "85vw";
        } else {
            document.getElementById(id).style.width = "25vw";
        }

    }
}

// function getResolution() {
    // alert("Your screen resolution is: " + window.screen.width * window.devicePixelRatio + "x" + window.screen.height * window.devicePixelRatio);
//     alert("Your screen resolution is: " + screen.width + "x" + screen.height);
// }

// Close SideNav
function closeSideNav(id) {
    document.getElementById(id).style.width = "0";
}

// Password Visibility Toggle
function togglePassword(formPasswordID, toggleID) {
    const passwordID = document.getElementById(formPasswordID);
    const toggle = document.getElementById(toggleID);

    const type = passwordID.getAttribute('type') === "password" ? "text" : "password"
    passwordID.setAttribute('type', type);

    toggle.classList.toggle('bi-eye');    
}

function togglePasswordConfirm(formPasswordID, toggleID) {
    const passwordID = document.getElementById(formPasswordID);
    const toggle = document.getElementById(toggleID);

    const type = passwordID.getAttribute('type') === "password" ? "text" : "password"
    passwordID.setAttribute('type', type);

    toggle.classList.toggle('bi-eye');    
}

// OPEN AND CLOSE ELEMENT
function openCloseElement(elementId) {
    const id = document.getElementById(elementId);
    id.style.display = id.style.display === "none" ? "block" : "none";
}