<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE xsl:stylesheet [
	<!ENTITY % HTMLlat1 PUBLIC
		"-//W3C//ENTITIES Latin 1//EN//HTML"
		"../ent/xhtml-lat1.ent">
		 %HTMLlat1;
	<!ENTITY % HTMLspecial PUBLIC
		"-//W3C//ENTITIES Special//EN//HTML"
		"../ent/xhtml-special.ent">
		%HTMLspecial;
	<!ENTITY % HTMLsymbol PUBLIC
		"-//W3C//ENTITIES Symbols//EN//HTML"
		"../ent/xhtml-symbol.ent">
		%HTMLsymbol;
]>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:import href="../import/common_import.xsl"/>
	<xsl:import href="../import/search_panel_import.xsl"/>
	<xsl:import href="../common/engine.xsl"/>

	<xsl:output
		method="html"
		doctype-system="about:legacy-compat"
		encoding="UTF-8"
		indent="no" />

	<xsl:template match="page">

		<html>

			<head>

				<xsl:call-template name="engine_head" />

			</head>

			<body class="@@@xsl.format.direction@@@">
				<div class="container">
					<div class="header module-header">
						<h1 class="lead">@@@salesMessage.priceguaranteed.header@@@</h1>
						<hr class="half-rule" />
						<h2 class="featurette">@@@salesMessage.priceguaranteed.prompt@@@</h2>
					</div>
					<div class="content">
						<div class="grid-sizer"></div>
						<div class="module module-search">
							<div class="form-wrap">
								<div class="search-box">
									<h2 class="heading">@@@searchPanel.text.searchCarHire@@@</h2>
									<xsl:call-template name="search_panel" />
								</div>
							</div>
						</div>
						<div class="module module-cars">
							<img src="/affiliateXmlStylesheets/common/img/cars.png" alt="Cars image"/>
						</div>
						<div class="module module-suppliers">
							<div class="heading-wrap">
								<h2 class="heading">###suppliers.text.massiveSavings###</h2>
							</div>
							<div class="suppliers-row row-1">
								<div class="supplier-logo logo-1"></div>
								<div class="supplier-logo logo-2"></div>
								<div class="supplier-logo logo-3"></div>
								<div class="supplier-logo logo-4"></div>
							</div>
							<div class="suppliers-row row-2">
								<div class="supplier-logo logo-5"></div>
								<div class="supplier-logo logo-6"></div>
								<div class="supplier-logo logo-7"></div>
								<div class="supplier-logo logo-8"></div>
							</div>
						</div>
						<div class="module module-why module-icon">
							<div class="why-wrap icon-wrap">
								<div class="icon-header icon-why">
									<div class="icon-box">
										<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" id="tick-svg" x="0px" y="0px" viewBox="65.098 26.701 250 250" enable-background="new 65.098 26.701 250 250" xml:space="preserve">
											<polygon class="icon" points="156.629,246.189 77.959,167.519 111.328,134.15 156.629,179.45 268.866,67.212 302.238,100.581
								"/>
										</svg>
									</div>
								</div>
								<div class="why-content icon-content">
									<h3 class="heading">###ourRentalsInclude.text.whyBook###</h3>
									<ul>
										<li>###banner.text.save15percent###</li>
										<li>###whybook.text.leadingsuppliers###</li>
										<li>###whybook.text.priceguarantee###</li>
										<li id="quantified-trusted">###whybook.text.quantifiedTrusted###</li>
									</ul>
								</div>
							</div>
						</div>
						<div class="module module-manage module-icon">
							<div class="manage-wrap icon-wrap">
								<div class="icon-header icon-manage">
									<div class="icon-box">
										<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" id="manage-svg" x="0px" y="0px" viewBox="65.098 26.701 250 250" enable-background="new 65.098 26.701 250 250" xml:space="preserve">
											<path class="icon" d="M190.098,122.304c23.602,0,44.1-20.484,44.1-44.1c0-23.615-20.498-44.1-44.1-44.1
												c-23.607,0-44.1,20.485-44.1,44.1C145.998,101.82,166.49,122.304,190.098,122.304z"/>
											<path class="icon" d="M190.098,137.003c-38.631,0-73.5,41.675-73.5,93.469c0,51.768,147,51.768,147,0
												C263.598,178.679,228.728,137.003,190.098,137.003z"/>
										</svg>
									</div>
								</div>
								<div class="manage-content icon-content">
									<h3 class="heading">@@@crm.account.booking.managebooking@@@</h3>
									<p>
										###myres.text.mybooking.text###&nbsp;@@@whybook.text.amendcancel@@@.
									</p>
									<div class="button-wrap">
										<a class="button" target="_parent" href="/AccessMyBooking.do?">@@@manageBooking.text.title@@@</a>
									</div>
								</div>
							</div>
						</div>
						<div class="module module-destinations">
							<h1 class="heading">###email.newsletter.mostPopularText###</h1>
							<div id="destinations-wrap">
								<div class="loader-wrap">
									<img src="/images/common/ajax-loader.gif" alt="Loading destinations"/>
								</div>
							</div>
						</div>
						<div class="module module-powered">
							<p>@@@myres.text.poweredby@@@</p>
							<img src="/affiliateXmlStylesheets/common/img/rc-logo.png" alt="The rentalcars.com logo"/>
						</div>
					</div>
				</div>

				<div class="tip">

				</div>

				<script>
					<!-- These are to set the language of Javascript elements -->
						var dayNamesMin = [@@@calendar.text.DOW@@@],
							dayNamesShort = @@@searchPanel.datepicker.formatDaysShort@@@,
							monthNames = [@@@calendar.text.months@@@],
							monthNamesShort = @@@searchPanel.datepicker.formatMonthsShort@@@,
							noResults = '@@@searchPanel.nearby.error.noResults@@@';
					<!-- These are to set the language of Javascript elements -->
				</script>

				<xsl:call-template name="engine_scripts" />

			</body>

		</html>

	</xsl:template>

	<xsl:template name="search_panel">

		<xsl:call-template name="search_panel_setup_function">
			<xsl:with-param name="onLoad">if(typeof frameReload == 'function') frameReload();</xsl:with-param>
		</xsl:call-template>

		<form class="search-form" target="_parent" method="get">

			<xsl:call-template name="search_panel_form_setup">
				<xsl:with-param name="action">/LoadingSearchResults.do;jsessionid=<xsl:value-of select="$sessionid"/>?</xsl:with-param>
			</xsl:call-template>

			<input type="hidden" name="puSameAsDo" value="false" />
			<input type="hidden" name="emptySearchResults" value="true" />

			<div class="tabs-wrap">
				<div class="tab-wrap-pick tab-wrap">
					<span data-frame="pickup" class="tab tab-pick">@@@widget.pickUp@@@</span>
				</div>
				<div class="tab-wrap-drop tab-wrap return">
					<span data-frame="dropoff" class="tab tab-drop disabled">@@@widget.dropOff@@@</span>
				</div>
			</div>
			<div class="pickup locations">
				<div class="drop has-tip" data-tip="@@@searchPanel.text.country@@@">
					<label>@@@searchPanel.text.country@@@</label>
					<div class="select-wrap">
						<span class="select-value">@@@searchPanel.text.country@@@</span>
						<xsl:call-template name="search_panel_pickup_country_dropdown">
							<xsl:with-param name="css_class">
								dropdown location
							</xsl:with-param>
							<xsl:with-param name="please_select_text">
								@@@searchPanel.text.country@@@
							</xsl:with-param>
						</xsl:call-template>
					</div>
				</div>

				<div class="drop has-tip" data-tip="@@@searchPanel.text.city@@@">
					<label>@@@searchPanel.text.city@@@</label>
					<div class="select-wrap">
						<span class="select-value">@@@searchPanel.text.city@@@</span>
						<xsl:call-template name="search_panel_pickup_city_dropdown">
							<xsl:with-param name="css_class">
								dropdown location
							</xsl:with-param>
							<xsl:with-param name="please_select_text">
								@@@searchPanel.text.city@@@
							</xsl:with-param>
						</xsl:call-template>
					</div>
				</div>

				<div class="drop has-tip" data-tip="@@@searchPanel.text.location@@@">
					<label>###searchPanel.text.location###</label>
					<div class="select-wrap">
						<span class="select-value">###searchPanel.text.location###</span>
						<xsl:call-template name="search_panel_pickup_location_dropdown">
							<xsl:with-param name="css_class">
								dropdown location
							</xsl:with-param>
							<xsl:with-param name="please_select_text">
								###searchPanel.text.location###
							</xsl:with-param>
						</xsl:call-template>
					</div>
				</div>
			</div>

			<div class="dropoff locations">
				<div class="drop has-tip" data-tip="@@@searchPanel.validation.dropCountry@@@">
					<label>@@@searchPanel.validation.dropCountry@@@</label>
					<div class="select-wrap">
						<span class="select-value">@@@searchPanel.validation.dropCountry@@@</span>
						<xsl:call-template name="search_panel_dropoff_country_dropdown">
							<xsl:with-param name="css_class">
								dropdown location
							</xsl:with-param>
							<xsl:with-param name="please_select_text">
								@@@searchPanel.validation.dropCountry@@@
							</xsl:with-param>
						</xsl:call-template>
					</div>
				</div>

				<div class="drop has-tip" data-tip="@@@searchPanel.validation.dropCity@@@">
					<label>@@@searchPanel.validation.dropCity@@@</label>
					<div class="select-wrap">
						<span class="select-value">@@@searchPanel.validation.dropCity@@@</span>
						<xsl:call-template name="search_panel_dropoff_city_dropdown">
							<xsl:with-param name="css_class">
								dropdown location
							</xsl:with-param>
							<xsl:with-param name="please_select_text">
								@@@searchPanel.validation.dropCity@@@
							</xsl:with-param>
						</xsl:call-template>
					</div>
				</div>

				<div class="drop has-tip" data-tip="@@@searchPanel.validation.dropLocation@@@">
					<label>###searchPanel.validation.dropLocation###</label>
					<div class="select-wrap">
						<span class="select-value">###searchPanel.validation.dropLocation###</span>
						<xsl:call-template name="search_panel_dropoff_location_dropdown">
							<xsl:with-param name="css_class">
								dropdown location
							</xsl:with-param>
							<xsl:with-param name="please_select_text">
								###searchPanel.validation.dropLocation###
							</xsl:with-param>
						</xsl:call-template>
					</div>
				</div>
			</div>

			<div class="return-wrap return">
				<span class="check-image check-return"></span>
				<input id="return-check" class="default-check return-check" type="checkbox" checked="checked" />
				<label class="check-label return-label" for="return-check">
					@@@searchPanel.text.returnSameLocation@@@
				</label>
			</div>

			<div class="pickup-dates dates pickup-times times">
				<label class="label-date">@@@timeDateChooser.text.pickDateNTime@@@</label>
				<div class="date-wrap">
					<input class="input-text input-date date-mobile date-pickup" id="mobile-pickup" type="date" min="0" />
					<input name="puDay" id="puDay" type="hidden" />
					<input name="puMonth" id="puMonth" type="hidden" />
					<input name="puYear" id="puYear" type="hidden" />
				</div>
				<div class="time-wrap">
					<div class="select-wrap">
						<span class="select-value">11:30</span>
						<select class="select-time time-pickup"></select>
						<input class="hidden-input" name="puHour" type="hidden" value="11"/>
						<input class="hidden-input" name="puMinute" type="hidden" value="30"/>
					</div>
				</div>
			</div>

			<div class="dropoff-dates dates dropoff-times times">
				<label class="label-date">@@@timeDateChooser.text.returnDateNTime@@@</label>
				<div class="date-wrap">
					<input class="input-text input-date date-mobile date-dropoff" id="mobile-dropoff" type="date" min="0" />
					<input name="doDay" id="doDay" type="hidden" />
					<input name="doMonth" id="doMonth" type="hidden" />
					<input name="doYear" id="doYear" type="hidden" />
				</div>
				<div class="time-wrap">
					<div class="select-wrap">
						<span class="select-value">11:30</span>
						<select class="select-time time-dropoff"></select>
						<input class="hidden-input" name="doHour" type="hidden" value="11"/>
						<input class="hidden-input" name="doMinute" type="hidden" value="30"/>
					</div>
				</div>
			</div>

			<div class="age-wrap">
				<div class="age-wrap-padding">
					<label class="label-age label-tip has-tip" data-tip="@@@searchPanel.text.driverMoreInfoContent@@@">@@@searchPanel.validation.driversAge@@@</label>
					<div class="age-check-wrap">
						<span class="check-image check-age"></span>
						<input id="age-check" class="default-check age-check" type="checkbox" checked="checked" />
						<label class="check-label age-label" for="age-check">
							@@@crm.age.between.label@@@?
						</label>
						<input placeholder="@@@crm.account.label.age@@@" class="input-text input-age" name="driversAge" type="text" value="25" />
					</div>
				</div>
			</div>

			<div class="button-wrap">
				<a class="button" href="#" target="_parent">
					@@@searchPanel.button.search@@@
				</a>
			</div>
		</form>

	</xsl:template>

</xsl:stylesheet>