<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xdt="http://www.w3.org/2005/xpath-datatypes">

<xsl:template match="document">
	<html>
	<head>
		<style>
			body {
				margin: 0;
			}
			* {
				font-family: sans-serif;
			}
			header{
				background-color: #2d3436;
				color: #fff;
				padding-top: 30px;
				padding-bottom: 30px;
			}
			article, footer section, h1 {
				width: 95%;
				max-width: 1000px;
				margin: auto;
			}
			section.container {
				display: flex;
				flex-wrap: wrap;
				justify-content: center;
			}
			section.koncert {
				border: 3px solid #000;
				border-radius: 4px;
				width: 210px;
				height: 150px;
				font-size: 14pt;
				text-align: center;
				font-weight: bold;
				margin: 10px;
			}
			section.koncert .lista {
				background-color: #2d3436;
				text-align: left;
				margin-bottom: 30px;
				padding: 10px;
				color: #fff;
			}
			section.koncert .lista span {
				float: right;
			}
			iframe {
				margin: 10px;
				border-radius: 4px;
			}
			table.bar {
				border-collapse: collapse;
				border-spacing: 0;
				width: 300px;
			}
			table.bar td {
				padding: 8px;
			}
			section.bar {
				display: flex;
				justify-content: space-evenly;
			}
			footer {
				background-color: #2d3436;
				color: #fff;
				margin-top: 50px;
			}
			footer section {
				width: 95%;
				max-width: 1000px;
				margin: auto;
				padding-top: 30px;
				padding-bottom: 30px;
			}
			footer table {
				width: 250px;
				padding-bottom: 30px;
			}
			footer table td {
				color: #fff;
				padding: 3px;
			}
		</style>
		<title>Hudební klub Veleslavín</title> 
	</head>
	<body>
		<header>
			<h1>Hudební klub Veleslavín</h1>
		</header>
		<main>
			<xsl:apply-templates/>
		</main>
	</body>
	</html>
</xsl:template>

<xsl:template match="koncerty">
	<article>
		<h2>Plánované koncerty</h2>
		<section class="container">
			<xsl:for-each select="koncert">
				<section class="koncert">
					<section class="lista">
						<xsl:value-of select="number(substring(@datum, 9, 2))"/>.
						<xsl:value-of select="number(substring(@datum, 6, 2))"/>.
						<span><xsl:value-of select="vstupne"/> Kč</span>
					</section>
					<section class="kapela">
						<xsl:value-of select="kapela"/>
					</section>
				</section>
			</xsl:for-each>
		</section>
	</article>
</xsl:template>

<xsl:template match="ukazky">
	<article>
		<h2>Videa z proběhlých akcí</h2>
		<section class="container">
			<xsl:for-each select="video">
				<iframe width="350" height="240" src="https://www.youtube.com/embed/{@youtube_id}?controls=0" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"></iframe>
			</xsl:for-each>
		</section>
	</article>
</xsl:template>

<xsl:template match="bar">
	<article>
		<h2>Nabídka na baru</h2>
		<section class="bar">
			<section>
				<h3>Pivo</h3>
				<table class="bar">
					<xsl:for-each select="alkohol[@typ='pivo']/napoj">	
						<tr>
							<td>
								<xsl:value-of select="current()"/>&#160;
								<xsl:value-of select="@epm"/>°
							</td>
							<td><xsl:value-of select="@cena"/> Kč</td>			
						</tr>	
					</xsl:for-each>
				</table>
			</section>
			<section>
				<h3>Destiláty a likéry</h3>
				<table class="bar">
					<xsl:for-each select="alkohol[@typ='destilaty_likery']/napoj">	
						<tr>
							<td>
								<xsl:value-of select="current()"/>&#160;
								<xsl:value-of select="@objem"/>&#160;cl
							</td>
							<td><xsl:value-of select="@cena"/> Kč</td>			
						</tr>	
					</xsl:for-each>
				</table>
			</section>
		</section>
	</article>
</xsl:template>

<xsl:template match="info">
	<footer>
		<section>
			<h3>Otevírací doba</h3>
			<table>
				<xsl:for-each select="oteviraci_doba/den_v_tydnu">
					<tr>
						<td><xsl:value-of select="@den"/></td>
						<td>
							<xsl:value-of select="od"/>
							&#160;-&#160;
							<xsl:value-of select="do"/>
						</td>
					</tr>
				</xsl:for-each>
			</table>
			Začátek koncertů vždy ve <xsl:value-of select="zacatek_koncertu"/>.
		</section>
	</footer>
</xsl:template>

</xsl:stylesheet>
