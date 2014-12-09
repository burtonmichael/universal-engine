<?xml version="1.0" encoding="UTF-8"?>

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

<xsl:template name="engine_head_css">

	<script>
		var affiliateCode = "<xsl:value-of select="$affiliatecode" />";
	</script>

	<title>Rentalcars</title>

<!-- IE SET TO EDGE / ENABLE CHROME FRAME -->
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

<!-- HARD SET VIEWPORT FOR MOBILE -->
	<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no" />

<!-- VENDOR -->
	<link href="/affiliateXmlStylesheets/common/css/vendor.css" rel="stylesheet" type="text/css" />

<!-- BASE CSS -->
	<link href="/affiliateXmlStylesheets/{$affiliatecode}/css/base.css" type="text/css" rel="stylesheet" />

<!-- MEDIA QUERY / MISC CSS -->
	<link href="/affiliateXmlStylesheets/common/css/media-queries.css" rel="stylesheet" type="text/css" />

<!-- IE CONDITIONAL CSS -->

	<xsl:text disable-output-escaping="yes">
		&lt;!--[if lte IE 7]>
	</xsl:text>
			<link href="/affiliateXmlStylesheets/common/css/fix-ie7.css" rel="stylesheet" type="text/css" />
	<xsl:text disable-output-escaping="yes">
		&lt;![endif]-->
	</xsl:text>

	<xsl:text disable-output-escaping="yes">
		&lt;!--[if lte IE 8]>
	</xsl:text>
			<link href="/affiliateXmlStylesheets/common/css/fix-ie8.css" rel="stylesheet" type="text/css" />
	<xsl:text disable-output-escaping="yes">
		&lt;![endif]-->
	</xsl:text>

	<xsl:text disable-output-escaping="yes">
		&lt;!--[if lte IE 9]>
	</xsl:text>
			<link href="/affiliateXmlStylesheets/common/css/fix-ie9.css" rel="stylesheet" type="text/css" />
	<xsl:text disable-output-escaping="yes">
		&lt;![endif]-->
	</xsl:text>

	<xsl:text disable-output-escaping="yes">
		&lt;!--[if lte IE 8]>
			&lt;script src="/js/vendor/respond.min.js">&lt;/script>
		&lt;![endif]-->
	</xsl:text>

</xsl:template>

<xsl:template name="engine_head">

	<script>
		var affiliateCode = "<xsl:value-of select="$affiliatecode" />";
	</script>

	<title>Rentalcars</title>

<!-- IE SET TO EDGE / ENABLE CHROME FRAME -->
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

<!-- HARD SET VIEWPORT FOR MOBILE -->
	<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no" />

<!-- VENDOR -->
	<link href="/affiliateXmlStylesheets/common/css/vendor.css" rel="stylesheet" type="text/css" />

<!-- LESS CSS -->
	<link href="/affiliateXmlStylesheets/common/css/less/less-style.less" type="text/css" rel="stylesheet/less" media="screen" />

<!-- LESS JS -->
	<xsl:text disable-output-escaping="yes">
		&lt;!--[if lte IE 8]>
			&lt;script src="/js/vendor/es5-shim.min.js">&lt;/script>
		&lt;![endif]-->
	</xsl:text>
	<script src="/js/vendor/less-1.5.0.min.js" type="text/javascript"></script>

<!-- CUSTOMISE DESIGN -->
	<script src="/affiliateXmlStylesheets/common/js/engine-customise.js" type="text/javascript"></script>

<!-- MEDIA QUERY / MISC CSS -->
	<link href="/affiliateXmlStylesheets/common/css/media-queries.css" rel="stylesheet" type="text/css" />

<!-- IE CONDITIONAL CSS -->

	<xsl:text disable-output-escaping="yes">
		&lt;!--[if lte IE 7]>
	</xsl:text>
			<link href="/affiliateXmlStylesheets/common/css/fix-ie7.css" rel="stylesheet" type="text/css" />
	<xsl:text disable-output-escaping="yes">
		&lt;![endif]-->
	</xsl:text>

	<xsl:text disable-output-escaping="yes">
		&lt;!--[if lte IE 8]>
	</xsl:text>
			<link href="/affiliateXmlStylesheets/common/css/fix-ie8.css" rel="stylesheet" type="text/css" />
	<xsl:text disable-output-escaping="yes">
		&lt;![endif]-->
	</xsl:text>

	<xsl:text disable-output-escaping="yes">
		&lt;!--[if lte IE 9]>
	</xsl:text>
			<link href="/affiliateXmlStylesheets/common/css/fix-ie9.css" rel="stylesheet" type="text/css" />
	<xsl:text disable-output-escaping="yes">
		&lt;![endif]-->
	</xsl:text>

	<xsl:text disable-output-escaping="yes">
		&lt;!--[if lte IE 8]>
			&lt;script src="/js/vendor/respond.min.js">&lt;/script>
		&lt;![endif]-->
	</xsl:text>

</xsl:template>

<xsl:template name="engine_scripts">

	<script src="/js/vendor/jquery.js"></script>
	<script src="/js/vendor/jquery-ui.js"></script>
	<script src="/js/vendor/modernizr.min.js"></script>

	<xsl:text disable-output-escaping="yes">
		&lt;![if gt IE 7]>
	</xsl:text>
			<script src="/js/vendor/masonry.min.js"></script>
	<xsl:text disable-output-escaping="yes">
		&lt;![endif]-->
	</xsl:text>

	<script src="/affiliateXmlStylesheets/common/js/engine.js"></script>
	<script src="/affiliateXmlStylesheets/common/js/jquery-functions.js"></script>
	<script src="/affiliateXmlStylesheets/common/js/main.js"></script>

</xsl:template>



</xsl:stylesheet>