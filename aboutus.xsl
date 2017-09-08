<?xml version="1.0" encoding="UTF-8" ?>

<xsl:stylesheet version="2.0"
     xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
     xmlns:xs="http://www.w3.org/2001/XMLSchema" 
     xmlns:a="http://example.com/illumaures"
     exclude-result-prefixes="xs a">

   <xsl:output method="html"
      doctype-system="about:legacy-compat"
      encoding="UTF-8"
      indent="yes" />
<xsl:template match="/">
<html>
	<head>
		<title></title>
	</head>
	<body>
<xsl:for-each select="contacts/contact">
  <tr>
			<th>
			<div style="background-color:orangered;color:white;padding:4px">
    <span style="font-weight:bold">
    <xsl:value-of select="firstLine"/></span>
	    </div>

</th>
		</tr>
		    <xsl:value-of select="secondLine"/>
</xsl:for-each>
	</body>
</html>
</xsl:template>
  </xsl:stylesheet>
