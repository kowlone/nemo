/*! jQuery requestAnimationFrame - v0.1.2 - 2013-04-15
 * https://github.com/gnarf37/jquery-requestAnimationFrame
 * Copyright (c) 2013 Corey Frang; Licensed MIT */
(function (e) {
    function o() {
        t && (i(o), jQuery.fx.tick())
    }

    var t, n = 0, r = ["webkit", "moz"], i = window.requestAnimationFrame, s = window.cancelAnimationFrame;
    for (; n < r.length && !i; n++)i = window[r[n] + "RequestAnimationFrame"], s = s || window[r[n] + "CancelAnimationFrame"] || window[r[n] + "CancelRequestAnimationFrame"];
    i ? (window.requestAnimationFrame = i, window.cancelAnimationFrame = s, jQuery.fx.timer = function (e) {
        e() && jQuery.timers.push(e) && !t && (t = !0, o())
    }, jQuery.fx.stop = function () {
        t = !1
    }) : (window.requestAnimationFrame = function (e, t) {
        var r = (new Date).getTime(), i = Math.max(0, 16 - (r - n)), s = window.setTimeout(function () {
            e(r + i)
        }, i);
        return n = r + i, s
    }, window.cancelAnimationFrame = function (e) {
        clearTimeout(e)
    })
})(jQuery);