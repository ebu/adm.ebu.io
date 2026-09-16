<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" xmlns:reg="http://www.smpte-ra.org/schemas/400/2012" exclude-result-prefixes="reg">
	<xsl:variable name="adm" select="//reg:Entry[reg:Applications='ADMProfileLevel']"/>
	<xsl:template match="/">
		<html>
			<head>
				<meta name="viewport" content="width=device-width, initial-scale=1"/>
				<title>ADM Profiles and Levels Labels</title>
				<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous"/>
			</head>
			<body>
				<div class="p-4">
					<h1>ADM Profiles and Levels Labels</h1>
					<p>Generated from the <a href="https://registry.smpte-ra.org/apps/pages/draft/">SMPTE Metadata Labels Register</a>. The table shows all Labels with the "Applications" field set to "ADMProfileLevel" at the point of generation.
					</p>
					<p>Refer to <a href="./mxf_imf.html">MXF &amp; IMF Best Practice</a> for guidance on using these Labels.
					</p>
					<table class="table table-hover table-sm table-resposive">
						<thead class="table-light">
							<tr>
								<th scope="col">Symbol</th>
								<th scope="col">UL</th>
								<th scope="col">Definition</th>
								<th scope="col">DefiningDocument</th>
							</tr>
						</thead>
						<tbody class="align-middle">
							<xsl:for-each select="$adm">
								<xsl:variable name="cur_pos" select="position()"/>
								<xsl:element name="tr">
									<xsl:if test="($cur_pos > 1) and ($adm[$cur_pos - 1]/reg:DefiningDocument != $adm[$cur_pos]/reg:DefiningDocument)">
										<xsl:attribute name="class">table-group-divider</xsl:attribute>
									</xsl:if>
									<th scope="row">
										<xsl:value-of select="reg:Symbol"/>
									</th>
									<td>
										<xsl:value-of select="reg:UL"/>
									</td>
									<td>
										<xsl:value-of select="reg:Definition"/>
									</td>
									<td>
										<xsl:value-of select="reg:DefiningDocument"/>
									</td>
								</xsl:element>
							</xsl:for-each>
						</tbody>
					</table>
					<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"/>
				</div>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>