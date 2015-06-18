/*
 ** Unobtrusive validation support library for jQuery and jQuery Validate
 ** Copyright (C) Microsoft Corporation. All rights reserved.
 */
(function (a) {
    var d = a.validator, b, f = "unobtrusiveValidation";

    function c(a, b, c) {
        a.rules[b] = c;
        if (a.message) a.messages[b] = a.message
    }

    function i(a) {
        return a.replace(/^\s+|\s+$/g, "").split(/\s*,\s*/g)
    }

    function g(a) {
        return a.substr(0, a.lastIndexOf(".") + 1)
    }

    function e(a, b) {
        if (a.indexOf("*.") === 0) a = a.replace("*.", b);
        return a
    }

    function l(c, d) {
        var b = a(this).find("[data-valmsg-for='" + d[0].name + "']"), e = a.parseJSON(b.attr("data-valmsg-replace")) !== false;
        b.removeClass("field-validation-valid").addClass("field-validation-error");
        c.data("unobtrusiveContainer", b);
        if (e) {
            b.empty();
            c.removeClass("input-validation-error").appendTo(b)
        } else c.hide()
    }

    function k(e, d) {
        var c = a(this).find("[data-valmsg-summary=true]"), b = c.find("ul");
        if (b && b.length && d.errorList.length) {
            b.empty();
            c.addClass("validation-summary-errors").removeClass("validation-summary-valid");
            a.each(d.errorList, function () {
                a("<li />").html(this.message).appendTo(b)
            })
        }
    }

    function j(c) {
        var b = c.data("unobtrusiveContainer"), d = a.parseJSON(b.attr("data-valmsg-replace"));
        if (b) {
            b.addClass("field-validation-valid").removeClass("field-validation-error");
            c.removeData("unobtrusiveContainer");
            d && b.empty()
        }
    }

    function h(d) {
        var b = a(d), c = b.data(f);
        if (!c) {
            c = { options: { errorClass: "input-validation-error", errorElement: "span", errorPlacement: a.proxy(l, d), invalidHandler: a.proxy(k, d), messages: {}, rules: {}, success: a.proxy(j, d) }, attachValidation: function () {
                b.validate(this.options)
            }, validate: function () {
                b.validate();
                return b.valid()
            } };
            b.data(f, c)
        }
        return c
    }

    d.unobtrusive = { adapters: [], parseElement: function (b, i) {
        var d = a(b), f = d.parents("form")[0], c, e, g;
        if (!f) return;
        c = h(f);
        c.options.rules[b.name] = e = {};
        c.options.messages[b.name] = g = {};
        a.each(this.adapters, function () {
            var c = "data-val-" + this.name, i = d.attr(c), h = {};
            if (i !== undefined) {
                c += "-";
                a.each(this.params, function () {
                    h[this] = d.attr(c + this)
                });
                this.adapt({ element: b, form: f, message: i, params: h, rules: e, messages: g })
            }
        });
        jQuery.extend(e, { __dummy__: true });
        !i && c.attachValidation()
    }, parse: function (b) {
        a(b).find(":input[data-val=true]").each(function () {
            d.unobtrusive.parseElement(this, true)
        });
        a("form").each(function () {
            var a = h(this);
            a && a.attachValidation()
        })
    } };
    b = d.unobtrusive.adapters;
    b.add = function (c, a, b) {
        if (!b) {
            b = a;
            a = []
        }
        this.push({ name: c, params: a, adapt: b });
        return this
    };
    b.addBool = function (a, b) {
        return this.add(a, function (d) {
            c(d, b || a, true)
        })
    };
    b.addMinMax = function (e, g, f, a, d, b) {
        return this.add(e, [d || "min", b || "max"], function (b) {
            var e = b.params.min, d = b.params.max;
            if (e && d) c(b, a, [e, d]); else if (e) c(b, g, e); else d && c(b, f, d)
        })
    };
    b.addSingleVal = function (a, b, d) {
        return this.add(a, [b || "val"], function (e) {
            c(e, d || a, e.params[b])
        })
    };
    d.addMethod("__dummy__", function () {
        return true
    });
    d.addMethod("regex", function (b, c, d) {
        var a;
        if (this.optional(c)) return true;
        a = (new RegExp(d)).exec(b);
        return a && a.index === 0 && a[0].length === b.length
    });
    b.addSingleVal("accept", "exts").addSingleVal("regex", "pattern");
    b.addBool("creditcard").addBool("date").addBool("digits").addBool("email").addBool("number").addBool("url");
    b.addMinMax("length", "minlength", "maxlength", "rangelength").addMinMax("range", "min", "max", "range");
    b.add("equalto", ["other"], function (b) {
        var h = g(b.element.name), i = b.params.other, d = e(i, h), f = a(b.form).find(":input[name=" + d + "]")[0];
        c(b, "equalTo", f)
    });
    b.add("required", function (a) {
        (a.element.tagName.toUpperCase() !== "INPUT" || a.element.type.toUpperCase() !== "CHECKBOX") && c(a, "required", true)
    });
    b.add("remote", ["url", "type", "additionalfields"], function (b) {
        var d = { url: b.params.url, type: b.params.type || "GET", data: {} }, f = g(b.element.name);
        a.each(i(b.params.additionalfields || b.element.name), function (h, g) {
            var c = e(g, f);
            d.data[c] = function () {
                return a(b.form).find(":input[name='" + c + "']").val()
            }
        });
        c(b, "remote", d)
    });
    a(function () {
        d.unobtrusive.parse(document)
    })
})(jQuery);