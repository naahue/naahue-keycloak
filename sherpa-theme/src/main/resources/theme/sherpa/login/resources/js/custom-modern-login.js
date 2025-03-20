// custom-login.js

(function initTheme() {
    console.log("internal modern theme");

    function enableInactivityMonitoring() {

        let idleSinceTimestamp = Date.now();

        const maxIdleMinutesBeforeAutoReload = 29;
        const autoReloadInactivityThresholdMillis = maxIdleMinutesBeforeAutoReload * 60 * 1000

        var hidden, visibilityChange;
        if (typeof document.hidden !== "undefined") { // Opera 12.10 and Firefox 18 and later support
            hidden = "hidden";
            visibilityChange = "visibilitychange";
        } else if (typeof document.msHidden !== "undefined") {
            hidden = "msHidden";
            visibilityChange = "msvisibilitychange";
        } else if (typeof document.webkitHidden !== "undefined") {
            hidden = "webkitHidden";
            visibilityChange = "webkitvisibilitychange";
        }

        function handleVisibilityChange() {
            const now = Date.now();
            if (document[hidden]) {
                idleSinceTimestamp = now;
            } else {
                if (now > idleSinceTimestamp + autoReloadInactivityThresholdMillis) {
                    location.reload();
                }
            }
        }

        if (typeof document.addEventListener === "undefined" || hidden === undefined) {
            console.log("This demo requires a browser, such as Google Chrome or Firefox, that supports the Page Visibility API.");
        } else {
            // Handle page visibility change
            document.addEventListener(visibilityChange, handleVisibilityChange, false);
        }
    }

    function onDomContentLoaded() {
        enableInactivityMonitoring();
    }

    document.addEventListener('DOMContentLoaded', evt => onDomContentLoaded());
})();


/*
function handleVisibilityChange(event) {

    if (document[hidden]) {
        return;
    }

    fetch("/bff/auth/check-session", {credentials: 'include', redirect: 'follow'})
        .then(function (response) {
            if (!response.ok && response.status == 401) {
                window.location.reload();
                return;
            }

            if (response.redirected) {
                window.location.href = response.url;
                return;
            }
        });
}
*/