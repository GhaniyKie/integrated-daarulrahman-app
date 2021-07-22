// Open SideNav
function openSideNav(id) {
    if (id === "homeSideNav") {
        document.getElementById(id).style.width = "100%";
    } else if (id === "dashSideNav") {
        document.getElementById(id).style.width = "25%";
    }
}

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