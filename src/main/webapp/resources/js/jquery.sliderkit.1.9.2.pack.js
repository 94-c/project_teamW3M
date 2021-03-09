/** 
 *  Slider Kit v1.9.2 (packed)
 *  http://www.kyrielles.net/sliderkit
 *  
 *  Copyright (c) 2010-2012 Alan Frog
 *  Licensed under the GNU General Public License
 */ (function ($) {
    SliderKit = function () {
        var n = this;
        this._init = function (c, d) {
            this.options = $.extend({}, this._settings, d);
            this.cssNames = {
                selected: this.options.cssprefix + "-selected",
                panel: this.options.cssprefix + "-panel",
                panels: this.options.cssprefix + "-panels",
                panelActive: this.options.cssprefix + "-panel-active",
                panelOld: this.options.cssprefix + "-panel-old",
                panelsWrapper: this.options.cssprefix + "-panels-wrapper",
                nav: this.options.cssprefix + "-nav",
                navClip: this.options.cssprefix + "-nav-clip",
                navBtn: this.options.cssprefix + "-nav-btn",
                navPrev: this.options.cssprefix + "-nav-prev",
                navNext: this.options.cssprefix + "-nav-next",
                btnDisable: this.options.cssprefix + "-btn-disable",
                btnPause: this.options.cssprefix + "-pause-btn",
                goPrev: this.options.cssprefix + "-go-prev",
                goNext: this.options.cssprefix + "-go-next",
                playBtn: this.options.cssprefix + "-play-btn",
                goBtns: this.options.cssprefix + "-go-btn"
            };
            this.domObj = $(c);
            this.panels = $("." + this.cssNames.panel, this.domObj);
            this.allItems = this.panels.size();
            this.nav = $("." + this.cssNames.nav, this.domObj);
            this.navClip = $("." + this.cssNames.navClip, this.nav);
            this.arePanels = this.allItems > 0 ? 1 : 0;
            this.isNavClip = this.navClip.size() > 0 ? 1 : 0;
            if (!this.arePanels && !this.isNavClip) {
                this._errorReport("Error #01", this.options.debug, 1)
            }
            this.domObjHeight = this.domObj.height();
            this.domObjWidth = this.domObj.width();
            if (!this.domObjHeight && !this.options.freeheight) {
                this.domObjHeight = this.options.height;
                this.domObj.css('height', this.domObjHeight);
                this._errorReport("Error #02", this.options.debug, 0)
            }
            if (!this.domObjWidth) {
                this.domObjWidth = this.options.width;
                this.domObj.css('width', this.domObjWidth);
                this._errorReport("Error #02", this.options.debug, 0)
            }
            this.domObj.css('display', 'block');
            this.currId = 0;
            this.prevId = 0;
            this.newId = 0;
            this.currPanel = null;
            this.prevPanel = 0;
            this.prevPanelStill = 0;
            this.firstTime = 1;
            this.scrollActive = 0;
            this.isPlaying = null;
            this.changeOngoing = false;
            this.currLine = 1;
            this.animating = false;
            this.panelAnteFns = new Array;
            this.panelPostFns = new Array;
            this.navAnteFns = new Array;
            this.navPostFns = new Array;
            this.runningScope = this.nav;
            if (this.isNavClip) {
                this._buildNav()
            }
            this._buildControls();
            if (this.arePanels) {
                this.panelsBag = $("." + this.cssNames.panels, this.domObj);
                if (this.options.panelfx == "sliding") {
                    this._wrapPanels()
                }
            }
            this.lineScrollDo = !this.arePanels ? 1 : 0;
            if (this.options.mousewheel) {
                this.domObj.mousewheel(function (a, b) {
                    b > 0 ? n.stepBackward() : n.stepForward();
                    return false
                })
            }
            if (this.options.keyboard) {
                this.domObj.keyup(function (a) {
                    if (a.keyCode == 37) {
                        n.stepBackward()
                    } else if (a.keyCode == 39) {
                        n.stepForward()
                    }
                })
            }
            if (this.options.panelclick && this.arePanels) {
                this.panelsBag.click(function () {
                    n.stepForward();
                    return false
                })
            }
            this.startId = this.options.start >= this.allItems ? this.allItems - 1 : this.options.start < 0 ? 0 : this.options.start;
            if (this.options.counter) {
                try {
                    this.Counter()
                } catch (err) {
                    this._errorReport(err, this.options.debug, 0)
                }
            }
            if (this.imageFx) {
                try {
                    this.imageFx()
                } catch (err) {
                    this._errorReport(err, this.options.debug, 0)
                }
            }
            if (this.options.delaycaptions) {
                try {
                    this.DelayCaptions(this.options.delaycaptions)
                } catch (err) {
                    this._errorReport(err, this.options.debug, 0)
                }
            }
            this.changeWithId(this.startId, null);
            if (this.options.auto) {
                this.autoScrollStart();
                this._autoScrollHoverStop()
            }
            if (this.options.timer) {
                try {
                    this.Timer(this.options.timer)
                } catch (err) {
                    this._errorReport(err, this.options.debug, 0)
                }
            }
            if (this.arePanels && !this.options.fastchange) {
                this.runningScope = this.domObj.find('.' + this.cssNames.panels, '.' + this.cssNames.nav)
            }
            return this
        };
        this._settings = {
            cssprefix: "sliderkit",
            width: 500,
            height: 350,
            start: 0,
            auto: true,
            autospeed: 4000,
            autostill: false,
            mousewheel: false,
            keyboard: false,
            circular: false,
            shownavitems: 5,
            navitemshover: false,
            navclipcenter: false,
            navcontinuous: false,
            navscrollatend: false,
            navpanelautoswitch: true,
            navfx: "sliding",
            navfxbefore: function () {},
            navfxafter: function () {},
            scroll: null,
            scrollspeed: 600,
            scrolleasing: null,
            panelfx: "fading",
            panelfxspeed: 700,
            panelfxeasing: null,
            panelfxfirst: "none",
            panelfxbefore: function () {},
            panelfxafter: function () {},
            panelbtnshover: false,
            panelclick: false,
            verticalnav: false,
            verticalslide: false,
            tabs: false,
            freeheight: false,
            fastchange: true,
            counter: false,
            delaycaptions: false,
            timer: false,
            imagefx: false,
            debug: false
        };
        this._errorReport = function (a, b, c) {
            if (b) {
                alert("Slider Kit error!\nMessage = " + a + " (see doc for details)\nElement id = " + this.domObj.attr("id") + "\nElement class = " + this.domObj.attr("class"))
            }
            if (c) {
                return false
            }
        };
        this._autoScrollHoverStop = function () {
            if (!this.isPlayBtn && !this.options.autostill) {
                this.domObj.hover(function () {
                    if (n.isPlaying != null) {
                        n.autoScrollStop()
                    }
                }, function () {
                    n.autoScrollStart()
                })
            }
            if (this.options.autostill) {
                this.domObj.mouseleave(function () {
                    if (n.isPlaying == null) {
                        n.autoScrollStart()
                    }
                })
            }
        };
        this._buildNav = function () {
            this.navUL = $("ul", this.navClip);
            this.navLI = $("li", this.navUL);
            this.navLINum = this.navLI.size();
            if (this.arePanels && (this.navLINum != this.allItems) && this.nav.size() == 1) {
                this._errorReport("Error #03", this.options.debug, 1)
            }
            if (this.options.tabs) {
                this.options.shownavitems = this.allItems
            } else {
                function getLImargin(a) {
                    attrVal = n.navLI.css(a);
                    if (attrVal != "auto" && a != "" && a != "0px") {
                        return parseInt(attrVal)
                    } else return 0
                }
                var c = this.options.verticalnav ? this.nav.height() : this.nav.width();
                var d = this.navLI.outerWidth(true);
                var e = this.navLI.outerHeight(true);
                var f = getLImargin("margin-left") + getLImargin("margin-right");
                var g = getLImargin("margin-top") + getLImargin("margin-bottom");
                this.allItems = this.navLINum;
                if (this.options.shownavitems > this.allItems) {
                    this.options.shownavitems = this.navLINum
                }
                this.navLIsize = this.options.verticalnav ? e : d;
                this.navULSize = this.navLIsize * this.navLINum;
                this.navClipSize = (this.options.shownavitems * this.navLIsize) - (this.options.verticalnav ? g : f);
                this.cssPosAttr = this.options.verticalnav ? "top" : "left";
                var h = this.options.verticalnav ? "height" : "width";
                var i = this.options.verticalnav ? "width" : "height";
                this.navLI.css({
                    width: this.navLI.width(),
                    height: this.navLI.height()
                });
                this.navUL.css(h, this.navULSize + "px");
                this.navClip.css({
                    width: this.options.verticalnav ? d : this.navClipSize,
                    height: this.options.verticalnav ? this.navClipSize : e
                });
                if (this.options.navclipcenter) {
                    this.navClip.css(this.cssPosAttr, (c - this.navClipSize) / 2).css("margin", "0")
                }
                if (this.allItems > this.options.shownavitems) {
                    this.scrollActive = true;
                    if (this.options.scroll == null || this.options.scroll < 0 || this.options.scroll > this.allItems) {
                        this.options.scroll = this.options.shownavitems
                    }
                }
                this.navBtns = $('.' + this.cssNames.navBtn, this.nav);
                if (this.navBtns.size() > 0) {
                    this._buildNavButtons()
                }
            }
            if (this.options.navitemshover && this.arePanels) {
                this.navLI.mouseover(function () {
                    n.changeWithId(getIndex(this, "li"), $(this))
                })
            } else if (this.arePanels || this.options.navscrollatend) {
                this.navLI.click(function () {
                    n.changeWithId(getIndex(this, "li"), $(this));
                    return false
                })
            }
            function getIndex(a, b) {
                return $(b, $(a).parent()).index(a)
            }
        };
        this._buildNavButtons = function () {
            if (this.scrollActive) {
                this.scrollBtns = true;
                this.navBtnPrev = $("." + this.cssNames.navPrev, this.nav);
                this.navBtnNext = $("." + this.cssNames.navNext, this.nav);
                this.navBtns.removeClass(this.cssNames.btnDisable);
                this.navBtnPrev.click(function () {
                    n.navPrev();
                    return false
                });
                this.navBtnNext.click(function () {
                    n.navNext();
                    return false
                });
                if (this.options.navcontinuous) {
                    this.navBtnPrev.mouseover(function () {
                        n.navPrev(true)
                    });
                    this.navBtnNext.mouseover(function () {
                        n.navNext(true)
                    });
                    this.navBtns.mouseout(function () {
                        n.navStopContinuous()
                    })
                }
                if (!this.options.circular) {
                    this.navBtnPrev.addClass(this.cssNames.btnDisable)
                }
            } else {
                this.navBtns.addClass(this.cssNames.btnDisable)
            }
        };
        this._getNavPos = function () {
            this.navPos = this.options.verticalnav ? this.navUL.position().top : this.navUL.position().left;
            this.LIbefore = Math.ceil(Math.abs(this.navPos) / this.navLIsize);
            this.LIafter = Math.floor((this.navULSize - Math.abs(this.navPos) - this.navClipSize) / this.navLIsize);
            if (this.LIafter < 0) {
                this.LIafter = 0
            }
        };
        this._buildControls = function () {
            this.playBtn = $("." + this.cssNames.playBtn, this.domObj);
            this.gBtns = $("." + this.cssNames.goBtns, this.domObj);
            this.isPlayBtn = this.playBtn.size() > 0 ? 1 : 0;
            this.goBtns = this.gBtns.size() > 0 ? 1 : 0;
            if (this.isPlayBtn) {
                if (this.options.auto) {
                    this.playBtn.addClass(this.cssNames.btnPause)
                }
                this.playBtn.click(function () {
                    if (n.playBtn.hasClass(n.cssNames.btnPause)) {
                        n.playBtnPause()
                    } else {
                        n.playBtnStart()
                    }
                    return false
                })
            }
            if (this.goBtns) {
                this.goBtnPrev = $("." + this.cssNames.goPrev, this.domObj);
                this.goBtnNext = $("." + this.cssNames.goNext, this.domObj);
                if (this.options.panelbtnshover) {
                    this.gBtns.hide();
                    $("." + this.cssNames.panels, this.domObj).hover(function () {
                        n.gBtns.fadeIn()
                    }, function () {
                        n.gBtns.fadeOut()
                    })
                }
                this.goBtnPrev.click(function () {
                    n.stepBackward($(this));
                    return false
                });
                this.goBtnNext.click(function () {
                    n.stepForward($(this));
                    return false
                })
            }
        };
        this._wrapPanels = function () {
            if ($('.' + this.cssNames.panelsWrapper, this.domObj).size() == 0) {
                this.panels.wrapAll('<div class="' + this.cssNames.panelsWrapper + '"></div>');
                this.panelsWrapper = $('.' + this.cssNames.panelsWrapper, this.panelsBag);
                this.panelsWrapper.css('position', 'relative')
            }
        };
        this._change = function (a, b, c, d, e) {
            if (e && this.isPlaying != null) {
                if (this.isPlayBtn) {
                    this.playBtnPause()
                }
                if (this.options.autostill) {
                    n.autoScrollStop()
                }
            }
            if (a) {
                if (a.hasClass(this.cssNames.btnDisable)) {
                    return false
                }
            }
            var f = 0;
            var g = $(':animated', this.runningScope).size() > 0 ? 1 : 0;
            if (!g && !this.animating) {
                this.prevId = this.currId;
                if (c == null && !d) {
                    this.currId = b == "-=" ? this.currId + 1 : this.currId - 1
                } else if (c != null) {
                    c = parseInt(c);
                    this.currId = c < 0 ? 0 : c > this.allItems - 1 ? this.allItems - 1 : c;
                    var h = a ? a.parent().parent().hasClass(this.cssNames.navClip) ? false : true : true
                }
                if (this.goBtns) {
                    this.gBtns.removeClass(this.cssNames.btnDisable)
                }
                if (!this.options.circular) {
                    if (this.currId == -1) {
                        this.currId = 0;
                        f = 1
                    }
                    if (this.currId == 0 && this.goBtns) {
                        this.goBtnPrev.addClass(this.cssNames.btnDisable)
                    }
                    if (this.currId == this.allItems) {
                        this.currId = this.allItems - 1;
                        f = 1
                    }
                    if (this.currId == this.allItems - 1) {
                        if (this.options.auto) {
                            this.autoScrollStop()
                        }
                        if (this.goBtns) {
                            this.goBtnNext.addClass(this.cssNames.btnDisable)
                        }
                    }
                } else if (!this.scrollActive) {
                    if (this.currId == this.allItems) {
                        this.currId = 0
                    }
                    if (this.currId == -1) {
                        this.currId = this.allItems - 1
                    }
                }
                if (this.scrollActive && !f) {
                    this._setNavScroll(d, b, h)
                }
                if (this.isNavClip) {
                    this.selectThumbnail(this.currId)
                }
                if (!(d && !this.options.navpanelautoswitch)) {
                    if (this.arePanels) {
                        this._animPanel(this.currId, b)
                    }
                }
                if (this.firstTime) {
                    this.firstTime = 0
                }
            }
        };
        this._setNavScroll = function (a, b, c) {
            this._getNavPos();
            var d = a ? true : false;
            var e = 0;
            if (!a) {
                var f = Math.abs(this.currId + 1 - this.LIbefore);
                var g = this.options.shownavitems - f + 1;
                var h = this.currId == 0 || this.currId == this.allItems - 1 ? 1 : 0;
                if ((this.options.navscrollatend && (g == 1 || f == 1)) && !this.firstTime && !h) {
                    e = this.options.scroll - 1;
                    d = true
                }
                if (g == 0 || f == 0) {
                    d = true
                }
                if (c) {
                    if (g < 0) {
                        g = 0
                    }
                    b = this.prevId < this.currId ? '-=' : '+=';
                    var i = Math.abs(this.prevId - this.currId);
                    if ((i - 1 > g && b == '-=') || (i > f && b == '+=')) {
                        e = i;
                        d = true
                    }
                }
                if (b == "") {
                    if (this.prevId == this.currId && !h) {
                        b = this.scrollWay == "-=" ? "+=" : "-="
                    } else {
                        b = this.prevId < this.currId ? "-=" : "+="
                    }
                }
                this.scrollWay = b
            }
            if (d) {
                var j = e > 0 ? e : this.options.scroll;
                var k = b == "-=" ? this.LIafter : this.LIbefore;
                var l = k < j ? k : j;
                var m = l * this.navLIsize;
                this.newId = b == "-=" ? this.LIbefore + l : this.LIbefore - l + this.options.shownavitems - 1;
                if ((b == "-=" && this.newId > this.currId) || (b == "+=" && this.newId < this.currId)) {
                    this.currId = this.newId
                }
                if (this.options.circular) {
                    if (this.LIbefore <= 0 && b == "+=") {
                        b = "-=";
                        this.currId = this.allItems - 1;
                        m = (this.LIafter / this.options.scroll) * (this.navLIsize * this.options.scroll)
                    } else if (this.LIafter == 0 && b == "-=") {
                        b = "+=";
                        this.currId = 0;
                        m = Math.abs(this.navPos)
                    }
                }
                this._animNav(b, m)
            }
        };
        this._animPanel = function (a, b) {
            this.currPanel = this.panels.eq(a);
            this.prevPanelStill = this.panels.eq(this.prevId);
            var c = function () {
                if ($.isFunction(n.options.panelfxafter)) {
                    n.options.panelfxafter()
                }
                n._runCallBacks(n.panelPostFns)
            };
            if (!this.currPanel.hasClass(this.cssNames.panelActive)) {
                if (this.firstTime) {
                    this.panelTransition = this.options.panelfxfirst;
                    var d = 1
                } else {
                    var e = this.options.freeheight && this.options.panelfx == "fading" ? "tabsfading" : "none";
                    this.panelTransition = this.options.freeheight ? e : this.options.panelfx
                }
                if ($.isFunction(n.options.panelfxbefore)) {
                    n.options.panelfxbefore()
                }
                this._runCallBacks(this.panelAnteFns);
                this._panelTransitions[this.panelTransition](b, d, c)
            }
        };
        this._animNav = function (a, b) {
            var c = function () {
                if (!n.options.circular && n.scrollBtns) {
                    n.navBtns.removeClass(n.cssNames.btnDisable);
                    n._getNavPos();
                    if (n.LIbefore <= 0) {
                        n.navBtnPrev.addClass(n.cssNames.btnDisable)
                    } else if (n.LIafter <= 0) {
                        n.navBtnNext.addClass(n.cssNames.btnDisable)
                    }
                }
                if (n.scrollcontinue) {
                    setTimeout(function () {
                        n.scrollcontinue == "-=" ? n.navPrev() : n.navNext()
                    }, 0)
                } else if ($.isFunction(n.options.navfxafter)) {
                    n.options.navfxafter()
                }
                n._runCallBacks(n.navPostFns)
            };
            if ($.isFunction(n.options.navfxbefore)) {
                n.options.navfxbefore()
            }
            n._runCallBacks(n.navAnteFns);
            this._navTransitions[this.options.navfx](a, b, c)
        };
        this._runCallBacks = function (c) {
            $.each(c, function (a, b) {
                if ($.isFunction(b)) {
                    b()
                }
            })
        };
        this._clearCallBacks = function (a) {
            a.length = 0
        };
        this._panelTransitions = {
            none: function (a, b, c) {
                n.panels.removeClass(n.cssNames.panelActive).hide();
                n.currPanel.addClass(n.cssNames.panelActive).show();
                c()
            },
            sliding: function (a, b, c) {
                if (a == "") {
                    a = n.prevPanel < n.currId ? "-=" : "+="
                }
                n.prevPanel = n.currId;
                var d = a == "-=" ? "+" : "-";
                var e = n.options.verticalslide ? "top" : "left";
                var f = n.options.verticalnav ? n.domObjHeight : n.domObjWidth;
                var g = e == "top" ? {
                    top: a + f
                } : {
                    left: a + f
                };
                n.oldPanel = $("." + n.cssNames.panelOld, n.domObj);
                n.activePanel = $("." + n.cssNames.panelActive, n.domObj);
                n.panels.css(e, "0");
                n.oldPanel.removeClass(n.cssNames.panelOld).hide();
                n.activePanel.removeClass(n.cssNames.panelActive).addClass(n.cssNames.panelOld);
                n.currPanel.addClass(n.cssNames.panelActive).css(e, d + f + "px").show();
                n.panelsWrapper.stop(true, true).css(e, "0").animate(g, n.options.panelfxspeed, n.options.panelfxeasing, function () {
                    c()
                })
            },
            fading: function (a, b, c) {
                if (b) {
                    n.panels.hide()
                } else {
                    n.currPanel.css("display", "none")
                }
                $("." + n.cssNames.panelOld, n.domObj).removeClass(n.cssNames.panelOld);
                $("." + n.cssNames.panelActive, n.domObj).stop(true, true).removeClass(n.cssNames.panelActive).addClass(n.cssNames.panelOld);
                n.currPanel.addClass(n.cssNames.panelActive).animate({
                    "opacity": "show"
                }, n.options.panelfxspeed, n.options.panelfxeasing, function () {
                    c()
                })
            },
            tabsfading: function (a, b, c) {
                n.panels.removeClass(n.cssNames.panelActive).hide();
                n.currPanel.fadeIn(n.options.panelfxspeed, function () {
                    c()
                })
            }
        };
        this._navTransitions = {
            none: function (a, b, c) {
                var d = a == "-=" ? n.navPos - b : n.navPos + b;
                n.navUL.css(n.cssPosAttr, d + "px");
                c()
            },
            sliding: function (a, b, c) {
                n.navUL.animate(n.cssPosAttr == "left" ? {
                    left: a + b
                } : {
                    top: a + b
                }, n.options.scrollspeed, n.options.scrolleasing, function () {
                    c()
                })
            }
        };
        this.playBtnPause = function () {
            this.playBtn.removeClass(this.cssNames.btnPause);
            this.autoScrollStop()
        };
        this.playBtnStart = function () {
            this.playBtn.addClass(n.cssNames.btnPause);
            this.autoScrollStart()
        };
        this.autoScrollStart = function () {
            var a = this;
            this.isPlaying = setInterval(function () {
                a._change(null, "-=", null, a.lineScrollDo, null)
            }, a.options.autospeed)
        };
        this.autoScrollStop = function () {
            clearTimeout(this.isPlaying);
            this.isPlaying = null
        };
        this.changeWithId = function (a, b) {
            this._change(b, "", a, 0, 1)
        };
        this.stepBackward = function (a) {
            this._change(a, "+=", null, n.lineScrollDo, 1)
        };
        this.stepForward = function (a) {
            this._change(a, "-=", null, n.lineScrollDo, 1)
        };
        this.navPrev = function (c) {
            if (c) {
                n.scrollcontinue = "-="
            }
            this._change(this.navBtnPrev, "+=", null, 1, 1)
        };
        this.navNext = function (c) {
            if (c) {
                n.scrollcontinue = "+="
            }
            this._change(this.navBtnNext, "-=", null, 1, 1)
        };
        this.navStopContinuous = function () {
            n.scrollcontinue = ""
        };
        this.selectThumbnail = function (a) {
            $("." + this.cssNames.selected, this.navUL).removeClass(this.cssNames.selected);
            this.navLI.eq(a).addClass(this.cssNames.selected)
        }
    };
    $.fn.sliderkit = function (a) {
        return this.each(function () {
            $(this).data("sliderkit", new SliderKit()._init(this, a))
        })
    }
})(jQuery);