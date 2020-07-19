<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="xml"/>

    <xsl:param name="stroke-width">1px</xsl:param>

    <xsl:template match="*">
        <xsl:copy>
            <xsl:apply-templates select="@*|text()|*"/>
        </xsl:copy>
    </xsl:template>

    <xsl:template match="@style[contains(., 'stroke-width:')]">
        <xsl:variable name="before" select="substring-before(.,'stroke-width:')"/>
        <xsl:variable name="rest" select="substring-after(.,'stroke-width:')"/>
        <xsl:variable name="after" select="substring-after($rest,';')"/>
        <xsl:attribute name="style">
            <xsl:value-of select="$before"/>
            <xsl:text>stroke-width:</xsl:text>
            <xsl:value-of select="$stroke-width"/>
            <xsl:text>;</xsl:text>
            <xsl:value-of select="$after"/>
        </xsl:attribute>
    </xsl:template>

    <xsl:template match="@*|text()">
        <xsl:copy/>
    </xsl:template>

</xsl:stylesheet>
