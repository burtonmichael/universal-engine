function Engine() {

	var self = this;

	this.mobile = (/Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent) && $(window).width() < 719);

	this.setupDate = function(){

		var useDefaultDate = true,
			puDate = new Date,
			doDate = new Date;

		if (this.grab("puDay")) {
			var puDay = this.grab("puDay"),
				puMonth = this.grab("puMonth") - 1,
				puYear = this.grab("puYear"),
				doDay = this.grab("doDay"),
				doMonth = this.grab("doMonth") - 1,
				doYear = this.grab("doYear");

			if (puDay && puMonth && puYear && doDay && doMonth && doYear) {
				useDefaultDate = false
				puDate = new Date(puYear, puMonth, puDay),
				doDate = new Date(doYear, doMonth, doDay);

				$('#puDay').val(puDay);
				$('#puMonth').val(puMonth + 1);
				$('#puYear').val(puYear);

				$('#doDay').val(doDay);
				$('#doMonth').val(doMonth + 1);
				$('#doYear').val(doYear);
			}
		}

		if (useDefaultDate) {
			var nowDate = new Date();
			puDate.setDate(nowDate.getDate() + 3);
			doDate.setDate(nowDate.getDate() + 6);
			$('#puDay').val(puDate.getDate());
			$('#puMonth').val(puDate.getMonth()+1);
			$('#puYear').val(puDate.getFullYear());
			$('#doDay').val(doDate.getDate());
			$('#doMonth').val(doDate.getMonth()+1);
			$('#doYear').val(doDate.getFullYear());
		}

		if (this.mobile) {

			$("body").addClass('mobile');

			document.getElementById("mobile-pickup").valueAsDate = puDate;
			document.getElementById("mobile-dropoff").valueAsDate = doDate;

			$('#mobile-pickup').on('change', function(event) {
				var date = event.target.valueAsDate;
				$('#puDay').val(date.getDate());
				$('#puMonth').val(date.getMonth()+1);
				$('#puYear').val(date.getFullYear());
			});

			$('#mobile-dropoff').on('change', function(event) {
				var date = event.target.valueAsDate;
				$('#doDay').val(date.getDate());
				$('#doMonth').val(date.getMonth()+1);
				$('#doYear').val(date.getFullYear());
			});

		} else {

			this.pointerSet = function(argInput) {
				var $input = $(argInput),
						$datepicker = $('#ui-datepicker-div');
				$input.addClass('focus');
				$datepicker.removeClass('no-pointer');
				var topDate = $datepicker.css('top'),
						offsetInput = $input.offset();
				if (parseInt(topDate) < offsetInput.top) {
						$datepicker.addClass('no-pointer');
				}
			}

			this.updateDates = function(argDate, argPrefix) {
				var prefix = argPrefix,
					date = argDate;
				$('#' + prefix + 'Day').val(date.getDate());
				$('#' + prefix + 'Month').val(date.getMonth()+1);
				$('#' + prefix + 'Year').val(date.getFullYear());
			}

			var format = this.grab('format');

			format = (format) ? (format.replace(/\+/g, ' ')) : "D d M y";

			var calendar = this.grab('calendar');

			calendar = (calendar) ? calendar : 1;

			$('#mobile-pickup').replaceWith('<input readonly="readonly" type="text" class="input-text input-date datepicker-pickup date-pickup" id="datepicker-pickup" />');
			$('#mobile-dropoff').replaceWith('<input readonly="readonly" type="text" class="input-text input-date datepicker-dropoff date-dropoff" id="datepicker-dropoff" />');

			$("#datepicker-pickup").datepicker({
				dateFormat: format,
				minDate: 0,
				showOtherMonths: true,
				dayNamesMin: dayNamesMin,
				dayNamesShort: dayNamesShort,
				monthNamesShort: monthNamesShort,
				monthNames: monthNames,
				firstDay: 1,
				numberOfMonths: [ 1, calendar ],
				isRTL: self.rtl,
				onSelect: function(dateText) {
					puDate = $(this).datepicker('getDate');
					$("#datepicker-dropoff").datepicker( "option", "minDate", puDate).trigger('blur');
					self.updateDates(puDate, 'pu');
					if (puDate > doDate) self.updateDates(puDate, 'do');
				},
				onClose: function(){
					$(this).removeClass('focus');
				}
			}).datepicker("setDate", puDate).on('click', function(e) {
				self.pointerSet(e.target);
			});


			$("#datepicker-dropoff").datepicker({
				dateFormat: format,
				minDate: puDate,
				showOtherMonths: true,
				dayNamesMin: dayNamesMin,
				dayNamesShort: dayNamesShort,
				monthNamesShort: monthNamesShort,
				monthNames: monthNames,
				firstDay: 1,
				numberOfMonths: [ 1, calendar ],
				onSelect: function() {
					doDate = $(this).datepicker('getDate');
					self.updateDates(doDate, 'do');
				},
				onClose: function(){
					$(this).removeClass('focus');
				}
			}).datepicker("setDate", doDate).on('click', function(e) {
				self.pointerSet(e.target);
			});
		}
	}

	this.initChosen = function() {
		if (!(this.mobile)) {
			var fts = this.grab('fts')
			if(fts) {

				var ftsScope = (fts === 'location') ? '.locations select' : 'select';

				this.hasChosen = true;

				$(ftsScope + ':last').on('chosen:ready', function() {
					$('body').addClass('chosen-' + fts);
					self.msnry.layout();
				});

				$.getScript('/js/vendor/chosen/chosen.jquery.min.js', function() {
					var dir = (self.rtl) ? "rtl" : "ltr",
							$selects = $(ftsScope);

					$selects.unwrap().addClass('chosen-' + dir);
					$selects.chosen({
						disable_search_threshold: 8,
						no_results_text: noResults,
						width: '100%',
						search_contains: true
					});
				});
			};
		};
	}

	this.initMasonry = function() {
		var elem = document.querySelector(".content");

		var msnry = new Masonry(elem, {
				columnWidth: '.grid-sizer',
				itemSelector: '.module',
				isOriginLeft: !self.rtl
			});

		msnry.on( 'layoutComplete', self.postHeight );

		self.msnry = msnry;
		self.postHeight();
	}

	this.postHeight = function() {
		bodyHeight = $('body').height();
		window.top.postMessage(bodyHeight + "", '*');
	}

	this.grab = function(string) {
		var exp = '[\\?&]' + string + '=([^&#]*)',
			regex = new RegExp(exp),
			results = regex.exec(this.location);
		if (results === null) {
			return false;
		} else {
			return results[1];
		}
	}

	this.importDeals = function() {
		if ($('.module-destinations').is(':visible')) {

			if (this.cor === 'us') {
				$('.module-destinations').remove();
			} else {
				var canTransform = Modernizr.testAllProps('transform'),
					url = window.location.protocol === "http:" ? "http://www.rentalcars.com" : "https://secure.rentalcars.com";
				$('#destinations-wrap').load(url + ' .destination', function() {
					if ($('.destination_country').size() <= 0) {
						var $this = $(this)
							re = new RegExp("（.*?）");
						$this.addClass('destinations-alt').find('.destination').each(function(index) {
							switch (index) {
								case 0:
								case 1:
								case 2:
								case 3:
									var $this = $(this),
										$destinationinfo = $this.find('.destinationinfo'),
										$img = $this.children('img'),
										imgsrc = $img.attr('src');
									$destinationinfo.find('img, p').wrapAll('<div class="destination_country"></div>');
									$destinationinfo.find('h4, .destination_country p').each(function(index, el) {
										$(this).text(function(){
											return $(this).text().replace(/（.*?\）/g, ""); 
										});
									});
									$this.find('.destinationprice').addClass('destination_price').appendTo($destinationinfo);
									$this.addClass('destination-' + (index + 1));
									$('<div></div>').addClass('destination_img').css('background-image', 'url(' + imgsrc + ')').prependTo($this);
									$img.remove()
									if(canTransform) {
										$this.addClass('scale-in');
									} else {
										$this.hide().fadeIn(250);
									}
									self.masonryRefresh();
									break;

								default:
									$(this).remove();
									self.masonryRefresh();
									break;
							}
						});
					} else {
						var $this = $(this);
						$this.find('.destination_booked_recency').remove();
						$this.find('.destination').each(function(index) {
							switch (index) {
								case 0:
								case 1:
								case 2:
								case 3:
									var $this = $(this);
									$this.addClass('destination-' + (index + 1));
									if(canTransform) {
										$this.addClass('scale-in');
									} else {
										$this.hide().fadeIn(250);
									}
									self.masonryRefresh();
									break;

								default:
									$(this).remove();
									self.masonryRefresh();
									break;
							}
						});
					}
				});
			}
			this.postHeight();
		}
	}

	this.masonryRefresh = function() {
		if (this.msnry != undefined) this.msnry.layout();
	}

	this.isIE = function() {
		if (document.all) {
			if (document.querySelector && !document.addEventListener) return 8;
			if (!document.querySelector) return 7;
		}
		return false;
	}

	this.readCookies = function() {
		c = document.cookie.split('; ');
		cookies = {};

		for(i=c.length-1; i>=0; i--){
		 C = c[i].split('=');
		 cookies[C[0]] = C[1];
		}
		return cookies;
	}

	this.cookiePreference = function(pref) {
		var regex = new RegExp(pref + ':([^|]*)');
		var results =  regex.exec(this.cookies['tj_conf']);
		if (results === null) {
			switch (pref) {
				case 'lang':
					return this.grab('preflang');
				case 'cor':
					return this.grab('cor');
				default:
					return false;
			}
		} else {
			return results[1];
		}
	}

	this.generateCSS = function(){
		var elm = $('style[id^="less"]'),
			content = elm.text(),
			textArea = $('<textarea></textarea>');

		textArea.val(content);
		$('body').append(textArea);
	}

	this.formTarget = function() {
		var target = this.grab('target');
		if (target === 'blank') {
			document.SearchResultsForm.target = '_' + target;
		}
	}

	this.setVariables = function() {
		this.location = window.location.href;
		this.cookies = this.readCookies();
		this.preflang = this.cookiePreference('lang');
		this.cor = this.cookiePreference('cor');
		this.rtl = $('body').hasClass('rtl');
		this.hasChosen = false;
		this.IE = this.isIE();
	}

	this.init = function() {
		this.setVariables();
		this.setupDate();

		if (!(this.IE === 7)) {
			this.initMasonry();
			this.initChosen();
			if (this.IE === 8) window.setTimeout(self.masonryRefresh, 3000);
		}

		this.importDeals();
		this.formTarget();
	}
}