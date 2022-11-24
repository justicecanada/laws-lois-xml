<?xml version='1.0' encoding='utf-8'?>

<!-- =============================================================== -->
<!--                                                                 -->
<!-- Convert LIMS XML to X HTML yes -                   			-->
<!--  Minor changes for Finance html document    -->
<!--  CSS classes defined here: https://laws-lois.justice.gc.ca/css/lawContent.css  -->
<!-- =============================================================== -->

<xsl:stylesheet version="1.0"
            xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
            xmlns:lims="http://justice.gc.ca/lims"
				xmlns:m="http://www.w3.org/1998/Math/MathML"
	xmlns:exslt="http://exslt.org/common"
	xmlns:saxon="http://saxon.sf.net"
	extension-element-prefixes="exslt"
	xmlns:CGext="urn:custom-extensions"
	xmlns:fo="http://www.w3.org/1999/XSL/Format"
      exclude-result-prefixes="xsl m lims exslt CGext fo">

  <xsl:output
      method="html"
      encoding="utf-8"
      omit-xml-declaration="yes"
      indent="no"/>


  <xsl:param name="heading-count" select="'3.1415'"/>
  <xsl:param name="folder" select="C-46" />
 
 <xsl:variable name="language">
      <xsl:value-of select="/*/@xml:lang" />
</xsl:variable>

  <xsl:template match="/">
  <html>
  <head>
  <link rel="stylesheet" type="text/css" href="https://laws-lois.justice.gc.ca/css/lawContent.css" />
  <link rel="stylesheet" type="text/css" href="https://laws-lois.justice.gc.ca/theme-gcwu-fegc/css/theme.css" />
  </head>
  <body>
  <div class="docContents" id="docCont">   
    <xsl:apply-templates />
  </div>
  </body>
	</html>
	
  </xsl:template>
 <!-- -THIS SECTION IS NOT FOUND IN WEBSITE PUBLISHER CODE BECAUSE IT IS HANDLED IN CODE IN THAT APP
       - HERE WE WILL CREATE THE IDENTIFICATION VIEW IN THE XSLT-->

  <!--Identification-->
  <xsl:template match="Identification[ancestor::Statute or ancestor::Bill]">
    <section class="intro">
      <header>
        <xsl:apply-templates select="ShortTitle"/>
        <xsl:apply-templates select="Chapter"/>
      </header>
      <xsl:apply-templates select="BillHistory/Stages"/>
      <xsl:apply-templates select="LongTitle"/>
      <xsl:apply-templates select="ReaderNote"/>      
    </section>
  </xsl:template>

  <xsl:template match="Identification[ancestor::Regulation]">
    <xsl:choose>
      <xsl:when test="InstrumentNumber[contains(text(), 'SI/')] | InstrumentNumber[contains(text(), 'TR/')] | InstrumentNumber[contains(text(), 'SOR/')] | InstrumentNumber[contains(text(), 'DOR/')]">
        <section class="intro">
          <header>
            <xsl:apply-templates select="LongTitle"/>
            <xsl:apply-templates select="InstrumentNumber"/>
          </header>
          <xsl:apply-templates select="EnablingAuthority"/>
          <xsl:apply-templates select="RegistrationDate"/>
          <xsl:apply-templates select="LongTitle" mode="secondItem"/>
          <xsl:apply-templates select="RegulationMakerOrder"/>
        </section>
      </xsl:when>
      <xsl:otherwise>
        <section class="intro">
          <header>
            <xsl:if test="not(ShortTitle)">
              <xsl:apply-templates select="LongTitle" mode="noShortTitle"/>
            </xsl:if>
            <xsl:apply-templates select="ShortTitle"/>
            <xsl:apply-templates select="InstrumentNumber"/>
            <xsl:apply-templates select="Chapter"/>
          </header>
          <xsl:apply-templates select="EnablingAuthority"/>
          <xsl:apply-templates select="LongTitle"/>
          <xsl:apply-templates select="RegistrationDate"/>
          <xsl:apply-templates select="RegulationMakerOrder"/>
        </section>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  <!--End Identification-->

  <!--EnablingAuthority - Identification-->
  <xsl:template match="EnablingAuthority">
    <p class="EnablingAct">
      <xsl:apply-templates />
    </p>
  </xsl:template>
  <!--End EnablingAuthority - Identification-->
  
  <!--Chapter Section-->
  <xsl:template match="Chapter">
    <xsl:apply-templates select="AnnualStatuteId"/>
    <xsl:if test="ConsolidatedNumber[@official='yes']">
      <xsl:apply-templates select="ConsolidatedNumber"/>
    </xsl:if>
  </xsl:template>
  <!--End Chapter Section-->
  
  <!--Instrument Number-->
  <xsl:template match="InstrumentNumber">
    <p class="ChapterNumber">
      <xsl:apply-templates />
    </p>
  </xsl:template>
  <!--End Instrument Number-->

  <!--Annual Statute ID-->
  <xsl:template match="AnnualStatuteId">
    <p class="ChapterNumber">
      <xsl:choose>
        <xsl:when test="@revised-statute='yes'">
          <xsl:text>R.S.C </xsl:text>
        </xsl:when>
        <xsl:otherwise>
          <xsl:text>S.C </xsl:text>
        </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="YYYY" />
      <xsl:choose>
        <xsl:when test="$language='fr'">
          <xsl:text>, ch. </xsl:text>
          <xsl:apply-templates select="AnnualStatuteNumber" />
        </xsl:when>
        <xsl:otherwise>
          <xsl:text>, c. </xsl:text>
          <xsl:apply-templates select="AnnualStatuteNumber" />
        </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="preceding-sibling::ConsolidatedNumber"/>
    </p>
  </xsl:template>
  <!--End Annual Statute ID-->
  
  <!--Condsolidated Number-->
  <xsl:template match="ConsolidatedNumber">
    <xsl:if test="@official='yes'">
      <p class="ChapterNumber">
        <xsl:choose>
          <xsl:when test="$language='fr'">
            <xsl:text>L.R.C. (1985), ch. </xsl:text>
            <xsl:apply-templates/>
          </xsl:when>
          <xsl:otherwise>
            <xsl:text>R.S.C, 1985, c. </xsl:text>
            <xsl:apply-templates/>
          </xsl:otherwise>
        </xsl:choose>
      </p>
    </xsl:if>
    <xsl:if test="@official='no'">
      <xsl:text> (</xsl:text>
      <xsl:apply-templates/>
    <xsl:text>)</xsl:text>
    </xsl:if>
  </xsl:template>
  <!--End Condsolidated Number-->
  
  

  <!--Bill History-->
  <xsl:template match="BillHistory/Stages">
    <xsl:if test="@stage='assented-to'">
      <p class="AssentedTo">
        <xsl:choose>
          <xsl:when test="$language='fr'">
            <xsl:text>Sanctionnée </xsl:text>
            <xsl:apply-templates select="Date"/>
          </xsl:when>
          <xsl:otherwise>
            <xsl:text>Assented to </xsl:text>
            <xsl:apply-templates select="Date"/>
          </xsl:otherwise>
        </xsl:choose>
      </p>
    </xsl:if>
  </xsl:template>
  <!--End Bill History-->

  <!--Registration date tag-->
  <xsl:template match="RegistrationDate">
    <xsl:choose>
      <xsl:when test="$language='fr'">
        <p class="RegistrationDate">
          <xsl:text>Enregistrement </xsl:text>
          <xsl:apply-templates/>
        </p>
      </xsl:when>
      <xsl:otherwise>
        <p class="RegistrationDate">
          <xsl:text>Registration </xsl:text>
          <xsl:apply-templates/>
        </p>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="ConsolidationDate">
  </xsl:template>
  
  <!--Regulation Maker Order-->
  <xsl:template match="RegulationMakerOrder">
    <xsl:apply-templates select="RegulationMaker"/>
    <xsl:text> </xsl:text>
    <xsl:apply-templates select="OrderNumber"/>
    <xsl:text> </xsl:text>
    <xsl:apply-templates select="Date"/>
  </xsl:template>
  <!--End Regulation Maker Order-->

  <!--Gazette Header-->
  <xsl:template match="GazetteHeader">
    <p class="GazetteHeader">
      <strong>
        <span class="GazetteVolume">Vol. </span>
        <xsl:text> </xsl:text>
        <xsl:apply-templates select="Volume" />
        <xsl:text>, no. </xsl:text>
        <xsl:apply-templates select="GazetteNumber" />
        <xsl:text>, page </xsl:text>
        <xsl:apply-templates select="Page" />
      </strong>
    </p>
  </xsl:template>

  <xsl:template match="GazetteDate">
    <p class="GazetteDate">
      <xsl:text>Ottawa: </xsl:text>
      <xsl:apply-templates />
    </p>
  </xsl:template>

  <xsl:template match="GazetteNotice">
    <div class="GazetteNotice">
      <xsl:apply-templates />
    </div>
  </xsl:template>

  <xsl:template match="GazetteNotice/Authority">
    <p class="Authority">
      <xsl:apply-templates />
    </p>
  </xsl:template>
  
  <xsl:template match="GazetteNotice/Source">
    <p class="Authority">
      <xsl:apply-templates />
    </p>
  </xsl:template>
  <xsl:template match="NoticeTitle">
    <p class="NoticeTitle italic">
      <xsl:apply-templates />
    </p>
  </xsl:template>

  <xsl:template match="GazetteHeader">
    <p class="GazetteHeader">
      <strong>
        <span class="GazetteVolume">Vol. </span>
        <xsl:text> </xsl:text>
        <xsl:apply-templates select="Volume" />
        <xsl:text>, no. </xsl:text>
        <xsl:apply-templates select="GazetteNumber" />
        <xsl:text>, page </xsl:text>
        <xsl:apply-templates select="Page" />
      </strong>
    </p>
  </xsl:template>

  <xsl:template match="GazetteNotice">
    <div class="GazetteNotice">
      <xsl:apply-templates />
    </div>
  </xsl:template>

  <xsl:template match="GazetteNotice/Authority">
    <p class="Authority">
      <xsl:apply-templates />
    </p>
  </xsl:template>
  
  <xsl:template match="GazetteNotice/Source">
    <p class="Authority">
      <xsl:apply-templates />
    </p>
  </xsl:template>
  
  <xsl:template match="NoticeTitle">
    <p class="NoticeTitle italic">
      <xsl:apply-templates />
    </p>
  </xsl:template>
  <!--End Gazette-->
  
  <!--Long Titles-->
  <xsl:template match="LongTitle[ancestor::BillInternal]">
    <header>
      <h1 class="LongTitle">
        <xsl:apply-templates />
      </h1>
    </header>
  </xsl:template>
  
  <xsl:template match="LongTitle[ancestor::Schedule]">
    <p class="LongTitle">
      <xsl:apply-templates />
    </p>
  </xsl:template>

  <xsl:variable name="instNum" select="Regulation/Identification/InstrumentNumber"/>
  <xsl:template match="LongTitle">
    <xsl:choose>
      <xsl:when test="contains($instNum, 'SI/') or contains($instNum, 'SOR/') or contains($instNum, 'TR/') or contains($instNum, 'DOR/')">
        <h1 class="Title-of-Act">
          <xsl:apply-templates />
        </h1>
      </xsl:when>
      <xsl:otherwise>
        <p class="LongTitle">
          <xsl:apply-templates />
        </p>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  
  <xsl:template match="LongTitle" mode="noShortTitle">
    <h1 class="Title-of-Act">
          <xsl:apply-templates />
        </h1>
  </xsl:template>

  <xsl:template match="LongTitle" mode="secondItem">
    <p class="LongTitle">
      <xsl:apply-templates />
    </p>
  </xsl:template>
  
  <!--End Long Titles-->

  <!--Short Titles-->
  <xsl:template match="ShortTitle">
    <h1 class="Title-of-Act">
      <xsl:apply-templates />
    </h1>
  </xsl:template>
  <!--End Short Titles-->
  
  <!--Date-->
  <xsl:template match="Date">
    <xsl:apply-templates select="YYYY" />
    <xsl:text>-</xsl:text>
    <xsl:apply-templates select="MM" />
    <xsl:text>-</xsl:text>
    <xsl:apply-templates select="DD" />
  </xsl:template>
  <!--End Date-->

  <!--Reader Note-->
  <xsl:template match="ReaderNote">
    <div class='ReaderNote'>
      <xsl:apply-templates/>
    </div>
  </xsl:template>
  <!--End Reader Note-->

  <xsl:template match="LastAmendedDate | LastModifiedDate | StatuteYear">
    <!-- do nothing - strip from output -->
  </xsl:template>

  <!-- Used for the Public Consultation conversion-->
  <xsl:template match="ExplanatoryNote">
    <xsl:choose>
      <xsl:when test="$language='fr'">
        <h3 class="ExplanatoryNoteFr">Notes explicatives</h3>
        <xsl:apply-templates />
      </xsl:when>
      <xsl:otherwise>
        <h3 class="ExplanatoryNoteEn">Explanatory Notes</h3>
        <xsl:apply-templates />
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="ExplanatoryNote/TitleText">
    <h4 class="ExplanatoryTitle">
      <xsl:apply-templates />
    </h4>
  </xsl:template>

  <xsl:template match="ExplanatoryNote/Label">
    <p class="ExplanatoryLabel">
      <xsl:apply-templates />
      <xsl:text> </xsl:text>
      <xsl:value-of select="following-sibling::ExplanatoryText"/>
    </p>
  </xsl:template>

  <xsl:template match="ExplanatoryNote/ExplanatoryText"/>




  <!-- USed to generate the id for the html anchor-->
  <xsl:template name="print-label">
    <xsl:choose>
      <xsl:when test="name() = 'Section'">
        <xsl:text>s-</xsl:text>
      </xsl:when>
      <xsl:when test="name() = 'Subsection'">
        <xsl:text>ss-</xsl:text>
      </xsl:when>
      <xsl:when test="name() = 'Paragraph'">
        <xsl:text>p-</xsl:text>
      </xsl:when>
      <xsl:when test="name() = 'Subparagraph'">
        <xsl:text>subp-</xsl:text>
      </xsl:when>
      <xsl:when test="name() = 'Provision'">
        <xsl:text>pv-</xsl:text>
      </xsl:when>
      <xsl:when test="name() = 'FormGroup'">
        <xsl:text>fg-</xsl:text>
      </xsl:when>
      <xsl:when test="name() = 'TableGroup'">
        <xsl:text>tg-</xsl:text>
      </xsl:when>
      <xsl:when test="name() = 'table' or name() = 'tgroup' or name() = 'thead' or name() = 'row'">
      </xsl:when>
      <xsl:when test="name() = 'Schedule'">
        <xsl:value-of select="translate(ScheduleFormHeading/Label , ' ', '_')"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="name()"/>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:value-of select="translate(Label , ' ', '_')"/>
  </xsl:template>


  <xsl:template match="Label" mode="pulled">
    <xsl:choose>
      <xsl:when test="parent::Section and ancestor::Schedule">
        <xsl:choose>
          <xsl:when test="ancestor::Schedule[@id='RelatedProvs']">
            <a class="lawLabel">
              <span class="lawlabel">
                <xsl:apply-templates />
              </span>
            </a>
          </xsl:when>
          <xsl:when test="ancestor::Schedule[@id='NifProvs']">
            <a class="lawLabel">
              <span class="lawlabel">
                <xsl:apply-templates />
              </span>
            </a>
          </xsl:when>
          <xsl:otherwise>
            <strong>
              <xsl:apply-templates />
            </strong>
          </xsl:otherwise>

        </xsl:choose>
      </xsl:when>
      <xsl:when test="parent::Section and ancestor::QuotedText">
        <strong>
          <xsl:apply-templates />
        </strong>
      </xsl:when>
      <xsl:when test="parent::Section and ancestor::Citation">
        <strong>
          <xsl:apply-templates />
        </strong>
      </xsl:when>
      <xsl:when test="parent::Section and ancestor::AmendedText">
        <strong>
          <xsl:apply-templates />
        </strong>
      </xsl:when>
      <xsl:when test="parent::Section and ancestor::ReadAsText">
        <strong>
          <xsl:apply-templates />
        </strong>

      </xsl:when>
      <xsl:when test="parent::Section and ancestor::ExplanatoryNote">
        <xsl:message>~<xsl:value-of select="." /></xsl:message>
        <strong>
          <xsl:apply-templates select="FootnoteRef" />
          <a class="sectionLabel">
            <span class="sectionLabel">
              <xsl:apply-templates select="node()[not(self::FootnoteRef)]" />
            </span>
          </a>
        </strong>
      </xsl:when>
      <xsl:when test="parent::Section">
        <xsl:message>~<xsl:value-of select="." /></xsl:message>
        <strong>
          <xsl:apply-templates select="FootnoteRef" />
          <a class="sectionLabel">
            <xsl:attribute name="id">s-<xsl:value-of select="translate(text(), ' ', '_')" /></xsl:attribute>
            <span class="sectionLabel">
              <xsl:apply-templates select="node()[not(self::FootnoteRef)]" />
            </span>
          </a>
        </strong>
      </xsl:when>
      <xsl:otherwise>
        <xsl:apply-templates select="FootnoteRef" />
        <a class="lawLabel">
          <xsl:attribute name="id">
            <xsl:for-each select="ancestor::*">
              <xsl:call-template name="print-label"/>
            </xsl:for-each>
            <xsl:value-of select="generate-id()" />
          </xsl:attribute>
          <span class="lawlabel">
            <xsl:apply-templates select="node()[not(self::FootnoteRef)]" />
          </span>
        </a>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:text>&#x00A0;</xsl:text>
  </xsl:template>

  <xsl:template name="GetClassFromFormatRef">
    <xsl:param name="formatref" />
    <xsl:choose>
      <xsl:when test="$formatref='group1-part'">
        <xsl:text>Topic</xsl:text>
      </xsl:when>
      <xsl:when test="$formatref='group2-division'">
        <xsl:text>Subheading</xsl:text>
      </xsl:when>
      <xsl:when test="$formatref='group3-subdivision'">
        <xsl:text>Subheading</xsl:text>
      </xsl:when>
      <xsl:when test="$formatref='group4'">
        <xsl:text>Subheading</xsl:text>
      </xsl:when>
      <xsl:when test="$formatref='group5'">
        <xsl:text>Subheading</xsl:text>
      </xsl:when>
      <xsl:when test="$formatref='center'">
        <xsl:text>Centered</xsl:text>
      </xsl:when>
      <xsl:when test="$formatref='right'">
        <xsl:text>right-align</xsl:text>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="$formatref" />
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>


  <xsl:template name="GetClassFromProvision">
    <xsl:param name="provision" />
    <xsl:choose>
      <xsl:when test="exslt:node-set($provision)/@format-ref">
        <xsl:call-template name="GetClassFromFormatRef">
          <xsl:with-param name="formatref">
            <xsl:value-of select="exslt:node-set($provision)/@format-ref[1]" />
          </xsl:with-param>
        </xsl:call-template>
      </xsl:when>
      <xsl:when test="exslt:node-set($provision)/@justification">
        <xsl:call-template name="GetClassFromFormatRef">
          <xsl:with-param name="formatref">
            <xsl:value-of select="exslt:node-set($provision)/@justification[1]" />
          </xsl:with-param>
        </xsl:call-template>
      </xsl:when>
      <xsl:otherwise>
        <xsl:text>CustomProvision</xsl:text>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="Item/Text">
    <xsl:apply-templates />
  </xsl:template>

  <xsl:template match="Footnote/Text">
    <xsl:apply-templates />
  </xsl:template>

  <xsl:template match="FormulaDefinition/Text">
    <xsl:apply-templates />
  </xsl:template>

  <!-- We have to use Pull processing here because we are trying to create a grouped/nested list
     (an html list) starting from a flat structure (consecutive list-item provisions) without a parent container -->
  <xsl:template match="Provision[@list-item='yes']">
    <xsl:choose>
      <xsl:when test="preceding-sibling::*[1][self::Provision[@list-item='yes']]">
        <!-- It's not the first; so it has already been pulled in.  We'll do nothing here. -->
      </xsl:when>
      <xsl:otherwise>
        <!-- It's the first of this group; we'll start a new list:  -->
        <ul class="ProvisionList">
          <li>
            <xsl:apply-templates />
          </li>
          <!-- Get the next Provision list-item, if there is one-->
          <xsl:apply-templates select="following-sibling::*[1][self::Provision[@list-item='yes']]" mode="inside-list"/>
        </ul>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  <xsl:template match="Provision[@list-item='yes']" mode="inside-list">
    <!-- Put this paragraph into the <li> tag:  -->
    <li>
      <!-- Process this Provision  -->
      <xsl:apply-templates />
    </li>
    <!-- Get the next Provision list-item, if there is one -->
    <xsl:apply-templates select="following-sibling::*[1][self::Provision[@list-item='yes']]" mode="inside-list"/>
  </xsl:template>

  <!-- We have to use Pull processing here because we are trying to create a grouped/nested list
     (an html list) starting from a flat structure (consecutive provisions with the same format-ref) without a parent container -->
  <xsl:template match="Provision[@format-ref and Label and not(@list-item='yes')]">
    <xsl:variable name="thisformatref" select="@format-ref" />
    <xsl:choose>
      <xsl:when test="preceding-sibling::*[1][self::Provision[@format-ref=$thisformatref and Label and not(@list-item='yes')]]">
        <!-- It's not the first; so it has already been pulled in.  We'll do nothing here. -->
      </xsl:when>
      <xsl:otherwise>
        <!-- It's the first of this group; we'll start a new list:  -->
        <ul class="ProvisionList">
          <li>
            <xsl:apply-templates />
          </li>
          <!-- Get the next matching Provision, if there is one-->
          <xsl:apply-templates select="following-sibling::*[1][self::Provision[@format-ref=$thisformatref and Label and not(@list-item='yes')]]" mode="inside-list"/>
        </ul>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  <xsl:template match="Provision[@format-ref and Label and not(@list-item='yes')]"  mode="inside-list">
    <xsl:variable name="thisformatref" select="@format-ref" />
    <li>
      <xsl:apply-templates />
    </li>
    <!-- Get the next Provision list-item, if there is one-->
    <xsl:apply-templates select="following-sibling::*[1][self::Provision[@format-ref=$thisformatref and Label and not(@list-item='yes')]]" mode="inside-list"/>
  </xsl:template>

  <xsl:template match="Provision[@list-item='yes' or @format-ref]/Label">
    <xsl:choose>
      <xsl:when test="following-sibling::*[1][self::Text]">
        <!-- Do nothing it has been pulled in -->
      </xsl:when>
      <xsl:otherwise>
        <xsl:apply-templates />
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="Provision[@list-item='yes']/Text">

    <xsl:variable name="fLineIndent">
      <xsl:choose>
        <xsl:when test="parent::Provision/@first-line-indent">
          <xsl:value-of select="parent::Provision/@first-line-indent" />
        </xsl:when>
        <xsl:when test="parent::Provision/@format-ref">
          <xsl:value-of select="substring(parent::Provision/@format-ref,8,1)" /> <!-- get character after "indent-"-->
        </xsl:when>
      </xsl:choose>
    </xsl:variable>

    <xsl:variable name="sLineIndent">
      <xsl:choose>
        <xsl:when test="parent::Provision/@subsequent-line-indent">
          <xsl:value-of select="parent::Provision/@subsequent-line-indent" />
        </xsl:when>
        <xsl:when test="parent::Provision/@format-ref">
          <xsl:value-of select="substring(parent::Provision/@format-ref,10,1)" />
          <!-- get character after "indent-3-"-->
        </xsl:when>
      </xsl:choose>
    </xsl:variable>
    <xsl:variable name="padding">
      <xsl:value-of select="translate($sLineIndent - $fLineIndent, '.', '-')" />
    </xsl:variable>
    <div class="listItemBlock{translate($fLineIndent, '.', '-')}">
      <div class="listItemLabel">
        <xsl:apply-templates select="preceding-sibling::Label[1]" mode="pulled" />
        <!--<xsl:if test="not(preceding-sibling::Label)">&#x00A0;</xsl:if>-->
      </div>
      <div class="listItemText{$padding}">
        <xsl:apply-templates />
      </div>
    </div>
  </xsl:template>


  <xsl:template match="Text">
    <xsl:variable name="class">
      <xsl:choose>
        <xsl:when test="parent::Provision[@format-ref]">
          <xsl:call-template name="GetClassFromFormatRef">
            <xsl:with-param name="formatref">
              <xsl:value-of select="parent::Provision/@format-ref" />
            </xsl:with-param>
          </xsl:call-template>
        </xsl:when>
        <xsl:when test="parent::Provision[@justification]">
          <xsl:call-template name="GetClassFromFormatRef">
            <xsl:with-param name="formatref">
              <xsl:value-of select="parent::Provision/@justification" />
            </xsl:with-param>
          </xsl:call-template>
        </xsl:when>
        <xsl:when test="parent::Provision[@list-item='no' and @first-line-indent and @subsequent-line-indent]">
          <!--Convert the first-line and sub-line to format ref style - replace decimals with 'o' for css -->
          <xsl:text>indent-</xsl:text>
          <xsl:value-of select="translate(parent::Provision/@first-line-indent, '.', 'o')" />
          <xsl:text>-</xsl:text>
          <xsl:value-of select="translate(parent::Provision/@subsequent-line-indent, '.', 'o')" />
        </xsl:when>
        <xsl:when test="parent::*[@type='amending']"><xsl:value-of select="name(parent::*)" /> amending</xsl:when>
        <xsl:when test="parent::*[@type='transitional']"><xsl:value-of select="name(parent::*)" /> transitional</xsl:when>
        <xsl:when test="parent::FormulaParagraph/parent::FormulaParagraph">FormulaSubparagraph</xsl:when>
        <xsl:when test="parent::FormulaParagraph/parent::FormulaParagraph/parent::FormulaParagraph">
          <xsl:text>FormulaClause</xsl:text>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="name(parent::*)" />
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <p>
      <xsl:attribute name="class">
        <xsl:value-of select="$class"/>
      </xsl:attribute>
      <xsl:if test="parent::Subsection[not(preceding-sibling::Subsection) and parent::Section]">
        <xsl:apply-templates select="parent::Subsection/parent::Section/Label" mode="pulled" />
      </xsl:if>
      <xsl:if test="preceding-sibling::*[1][self::Label] and not((parent::Footnote) or (parent::Item))">
        <xsl:apply-templates select="preceding-sibling::Label[1]" mode="pulled" />
      </xsl:if>
      <xsl:if test="preceding-sibling::*[1][self::FormulaTerm]">
        <xsl:apply-templates select="preceding-sibling::FormulaTerm[1]" />
      </xsl:if>

      <xsl:apply-templates />

      <!-- Append other language Defined Term  -->
      <xsl:if test="ancestor::Definition[MarginalNote]">
        <!-- If the current Text element is the last Text element inside a Definition with MarginalNotes we must extract it -->
        <!-- But only if this is the last Text element in the Definition -->
        <xsl:choose>
          <xsl:when test="generate-id(.) = generate-id(ancestor::Definition/descendant::Text[last()])">
            <!-- This node is the last Text node within the Definition -->
            <xsl:if test="ancestor::Definition[1]/MarginalNote[2]">
              <!-- Only add other language if there is 2 marg notes-->
              <xsl:text> (</xsl:text>
              <xsl:apply-templates select="ancestor::Definition[1]/MarginalNote[2]/* | ancestor::Definition[1]/MarginalNote[2]/text()" />
              <xsl:text>)</xsl:text>
            </xsl:if>
          </xsl:when>
          <xsl:otherwise>
            <!-- If neither condition is true, then we do nothing -->
          </xsl:otherwise>
        </xsl:choose>
      </xsl:if>
    </p>
  </xsl:template>

  <xsl:template match="Note">
    <p>
      <xsl:apply-templates />
    </p>
  </xsl:template>


  <xsl:template match="HistoricalNote">
    <xsl:choose>
      <xsl:when test="ancestor::MarginalNote">
        <span class="HistoricalNote" >
          <xsl:apply-templates />
        </span>
      </xsl:when>
      <xsl:when test="ul">
        <div class="HistoricalNote" >
          <xsl:apply-templates />
        </div>
      </xsl:when>
      <xsl:otherwise><!-- IF HN is not a list already, add ul tags -->
        <div class="HistoricalNote" >
          <ul class="HistoricalNote">
            <xsl:apply-templates />
          </ul>
          <xsl:text>.</xsl:text>
        </div>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>




  <xsl:template match="HistoricalNoteSubItem">
    <xsl:call-template name="splitHN">
      <xsl:with-param name="hnsi" select="."></xsl:with-param>
    </xsl:call-template>
  </xsl:template>

  <!-- This is some ugly code to split Historical Notes into separate tags using string splitting on the semi-colon-->
  <!-- 1. Recursive function - ends when it is called with empty @param hnsi-->
  <xsl:template name="splitHN">
    <xsl:param name="hnsi" />
    <xsl:variable name="first-item" select="substring-before(concat( $hnsi, ';'), ';')" />

    <xsl:if test="$first-item">
      <li class="HistoricalNoteSubItem">
        <xsl:value-of select="$first-item" />
      </li>
      <xsl:call-template name="splitHN">
        <xsl:with-param name="hnsi" select="substring-after($hnsi,';')" />
      </xsl:call-template>
    </xsl:if>

  </xsl:template>

  <xsl:template match="ul">
    <ul class="HistoricalNote">
      <xsl:apply-templates/>
    </ul>
  </xsl:template>
  <xsl:template match="li">
    <li>
      <xsl:apply-templates/>
    </li>
  </xsl:template>

  <xsl:template match="OriginatingRef">
    <span class="OriginatingRef">
      <xsl:apply-templates />
    </span>
  </xsl:template>

  <xsl:template match="ProvisionHeading">
    <h3 class="ProvisionHeading">
      <xsl:value-of select="preceding-sibling::Label" />
      <xsl:text> </xsl:text>
      <xsl:apply-templates />
    </h3>
    <!-- Only one file B-7 uses this element for now we will just hard code the style-->
    <!--
                <p>
                    <xsl:attribute name="class">
                        <xsl:call-template name="GetClassFromProvision">
                            <xsl:with-param name="provision" select="." />
                        </xsl:call-template>
                    </xsl:attribute>
                  <span class="provisionHeading">
                    <xsl:apply-templates />
                  </span>
                </p>  -->
  </xsl:template>

  <xsl:template match="Fraction">
    <xsl:apply-templates select="Numerator" />
    <xsl:text> &#x00F7; </xsl:text>
    <xsl:apply-templates select="Denominator" />
  </xsl:template>

  <xsl:template match="Numerator">
    <xsl:variable name="num">
      <xsl:value-of select="." />
    </xsl:variable>
    <xsl:choose>
      <xsl:when test="contains($num, ' ')">
        <xsl:text>(</xsl:text>
        <xsl:apply-templates />
        <xsl:text>)</xsl:text>
      </xsl:when>
      <xsl:otherwise>
        <xsl:apply-templates />
      </xsl:otherwise>
    </xsl:choose>

  </xsl:template>

  <xsl:template match="Denominator">
    <xsl:variable name="den">
      <xsl:value-of select="." />
    </xsl:variable>
    <xsl:choose>
      <xsl:when test="contains($den, ' ')">
        <xsl:text>(</xsl:text>
        <xsl:apply-templates />
        <xsl:text>)</xsl:text>
      </xsl:when>
      <xsl:otherwise>
        <xsl:apply-templates />
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <!-- This file is responsible for formatting the inline element Numerator 
    <xsl:template match="Numerator">
        <mrow xmlns="http://www.w3.org/1998/Math/MathML">
            <xsl:apply-templates mode="mathML" />
        </mrow>
    </xsl:template>-->

  <xsl:template match="text()" mode="mathML">
    <mi xmlns="http://www.w3.org/1998/Math/MathML">
      <xsl:value-of select="." />
    </mi>
  </xsl:template>

  <!-- This file is responsible for formatting the inline element Denominator-->
  <!--<xsl:template match="Denominator">
        <mrow xmlns="http://www.w3.org/1998/Math/MathML">
            <xsl:apply-templates mode="mathML" />
        </mrow>
    </xsl:template>-->
  <!--xsl:template match="msup | MSup" mode="mathML">
    <msup xmlns="http://www.w3.org/1998/Math/MathML">
      <xsl:choose>
        <xsl:when test="Base or base">
          <mi>
            <xsl:value-of select="Base | base" />
          </mi>
          <mi>
            <xsl:value-of select="Superscript | superscript" />
          </mi>
        </xsl:when>
        <xsl:otherwise>
          <xsl:copy-of select="node()"/>
        </xsl:otherwise>
      </xsl:choose>
    </msup>
  </xsl:template-->

  <xsl:template match="Base | base">
    <xsl:apply-templates/>
  </xsl:template>

  <xsl:template match="Superscript | superscript">
    <sup>
      <xsl:apply-templates />
    </sup>
  </xsl:template>

  <xsl:template match="Subscript | subscript">
    <sub>
      <xsl:apply-templates/>
    </sub>
  </xsl:template>

  <!-- xsl:template match="MathMLBlock">
    <div role="math">
    <xsl:copy-of select="math" />
    </div>
  </xsl:template -->


  <xsl:template match="MathML">
    <p class="Formula">
      <xsl:apply-templates />
    </p>
  </xsl:template>
  <xsl:template match="math">

    <math xmlns="http://www.w3.org/1998/Math/MathML">
      <!-- xsl:copy-of select="*" / -->
      <!-- Work around since copy-of will assign empty namespaces to elements and this will cause problems with AntennaHouse rendering of MathML -->
      <!-- When xslt engine will support XSLT 2.0 - we will add an attribute named "copy-namespaces" with a value of "no"  -->
      <!-- Example: <xsl:copy-of select="node() | @*" copy-namespaces="no"/> -->
      <xsl:apply-templates mode="mathMLandChangeNS"/>
    </math>
  </xsl:template>

  <xsl:template match="*" mode="mathMLandChangeNS">
    <!-- create a new element with the same local name -->
    <xsl:element name="{local-name()}" namespace="http://www.w3.org/1998/Math/MathML">
      <!-- copy all the attributes from the matched element -->
      <xsl:copy-of select="@*"/>
      <!-- apply templates on the same mode to get its content copied and  change the namespace  -->
      <xsl:apply-templates select="node()" mode="mathMLandChangeNS"/>
    </xsl:element>
  </xsl:template>


  <xsl:template match="ImageGroup">
    <xsl:choose>
      <xsl:when test="@position='inline'">
        <xsl:if test="Caption[@position='over']">
          <xsl:apply-templates select="Caption" />
        </xsl:if>
        <xsl:apply-templates select="*[not(self::Caption)]" />
        <xsl:if test="Caption[not(@position='over')]">
          <xsl:apply-templates select="Caption" />
        </xsl:if>
      </xsl:when>
      <xsl:otherwise>
        <figure>
          <xsl:if test="Caption[@position='over']">
            <figcaption>
              <xsl:apply-templates select="Caption" />
            </figcaption>
          </xsl:if>
          <div>
            <xsl:attribute name="class">
              <xsl:text>imageGroup</xsl:text><xsl:value-of select="@position" />
            </xsl:attribute>
            <xsl:apply-templates select="*[not(self::Caption)]" />
          </div>
          <xsl:if test="Caption[not(@position='over')]">
            <figcaption>
              <xsl:apply-templates select="Caption" />
            </figcaption>
          </xsl:if>
        </figure>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="Image">
    <img>
      <xsl:attribute name="src">
        <xsl:text>/images/</xsl:text>
        <xsl:value-of select="translate(@source, '\', '/')" />
      </xsl:attribute>
      <xsl:choose>
        <xsl:when test="preceding-sibling::AlternateText">
          <xsl:attribute name="alt">
            <xsl:value-of select="preceding-sibling::AlternateText" />
          </xsl:attribute>
        </xsl:when>
        <xsl:otherwise>
          <xsl:message>
            Image Description Missing <xsl:value-of select="@source" />
          </xsl:message>
          <!--<xsl:attribute name="alt">
                        <xsl:text>Image Description Missing</xsl:text>
                    </xsl:attribute>-->
        </xsl:otherwise>
      </xsl:choose>
    </img>
    <xsl:apply-templates select="@textdesc" />
  </xsl:template>

  <xsl:template match="@textdesc">
    <br />
    <xsl:text>[</xsl:text>
    <a>
      <xsl:attribute name="href">
        <xsl:value-of select="concat(substring-before(current(),'.'),'.html#desc')" />
      </xsl:attribute>
      <xsl:text>description</xsl:text>
    </a>
    <xsl:text>]</xsl:text>
  </xsl:template>

  <xsl:template match="FormBlank">
    <span class="FormBlank">
      <xsl:apply-templates />
    </span>
  </xsl:template>

  <xsl:template match="LineBreak">
    <br />
  </xsl:template>

  <xsl:template match="RunningHead | PageBreak">
  </xsl:template>

  <xsl:template match="Schedule">
    <xsl:if test="not(ancestor::Schedule)">
      <xsl:message>~sched~<xsl:value-of select="@lims:fid" /></xsl:message>
    </xsl:if>
    <section>
      <div class="Schedule">
        <xsl:if test="@xml:lang">
          <xsl:attribute name="lang">
            <xsl:value-of select="@xml:lang" />
          </xsl:attribute>
        </xsl:if>
        <xsl:choose>
          <xsl:when test="@in-force">
            <xsl:choose>
              <xsl:when test="$language='fr'">
                <div class="hiddenMsg">L'annexe suivante n'est pas en vigueur.</div>
              </xsl:when>
              <xsl:otherwise>
                <div class="hiddenMsg">The following schedule is not in force.</div>
              </xsl:otherwise>
            </xsl:choose>
            <div class="nif">
              <xsl:apply-templates />
            </div>
          </xsl:when>
          <xsl:otherwise>
            <xsl:apply-templates />
          </xsl:otherwise>
        </xsl:choose>
      </div>
    </section>
  </xsl:template>

  <xsl:template match="Schedule[@id='NifProvs']">
    <xsl:variable name="title-text" select="ScheduleFormHeading[1]/TitleText[1]/text()" />
    <xsl:choose>
      <xsl:when test="$title-text='AMENDMENTS NOT IN FORCE'">
        <xsl:message>~NIFs~</xsl:message>
      </xsl:when>
      <xsl:when test="$title-text='AMENDMENT NOT IN FORCE'">
        <xsl:message>~NIF~</xsl:message>
      </xsl:when>
      <xsl:when test="$title-text='MODIFICATIONS NON EN VIGUEUR'">
        <xsl:message>~NIFs~</xsl:message>
      </xsl:when>
      <xsl:when test="$title-text='MODIFICATION NON EN VIGUEUR'">
        <xsl:message>~NIF~</xsl:message>
      </xsl:when>
    </xsl:choose>
    <section>
      <div class="ScheduleNIF">
        <h2 class="scheduleTitleText">
          <xsl:value-of select="$title-text" />
        </h2>
        <ul class="NifProvs">
          <xsl:apply-templates select="*[not(self::ScheduleFormHeading)]"/>
        </ul>
      </div>
    </section>
  </xsl:template>
  <xsl:template match="Schedule[@id='RelatedProvs']">
    <xsl:variable name="title-text" select="ScheduleFormHeading[1]/TitleText[1]/text()" />
    <xsl:choose>
      <xsl:when test="$title-text='DISPOSITIONS CONNEXES'">
        <xsl:message>~RPs~</xsl:message>
      </xsl:when>
      <xsl:when test="$title-text='DISPOSITION CONNEXE'">
        <xsl:message>~RP~</xsl:message>
      </xsl:when>
      <xsl:when test="$title-text='RELATED PROVISIONS'">
        <xsl:message>~RPs~</xsl:message>
      </xsl:when>
      <xsl:when test="$title-text='RELATED PROVISION'">
        <xsl:message>~RP~</xsl:message>
      </xsl:when>
    </xsl:choose>
    <section>
      <div class="ScheduleRP">
        <h2 class="scheduleTitleText">
          <xsl:value-of select="$title-text" />
        </h2>
        <ul class="RelatedProvs">
          <xsl:apply-templates select="*[not(self::ScheduleFormHeading)]" />
        </ul>
      </div>
    </section>
  </xsl:template>

  <xsl:template match="RelatedOrNotInForce">
    <li>
      <xsl:apply-templates />
    </li>
  </xsl:template>

  <xsl:template match="RegulationPiece | BillPiece | Recommendation">
    <xsl:apply-templates />
  </xsl:template>
  <xsl:template match="Preamble | Order">
    <section class="order">
      <xsl:apply-templates />
    </section>
  </xsl:template>

  <xsl:template match="Summary">
    <section class="summary">
      <h1 class="Summary">
        <xsl:value-of select="TitleText"></xsl:value-of>
      </h1>
      <xsl:apply-templates />
    </section>
  </xsl:template>

  <xsl:template match="List">
    <figure>
      <xsl:if test="preceding-sibling::*[1][self::Heading[@style='listcaption']]">
        <figcaption>
          <xsl:apply-templates select="preceding-sibling::*[1][self::Heading]" mode="listcaption" />
        </figcaption>
      </xsl:if>
      <xsl:choose>
        <xsl:when test="@style='roman-lc'">
          <ol class="roman-lc">
            <xsl:apply-templates />
          </ol>
        </xsl:when>
        <xsl:when test="@style='roman-uc'">
          <ol class="roman-uc">
            <xsl:apply-templates />
          </ol>
        </xsl:when>
        <xsl:when test="@style='alphabet-lc'">
          <ol class="alphabet-lc">
            <xsl:apply-templates />
          </ol>
        </xsl:when>
        <xsl:when test="@style='alphabet-uc'">
          <ol class="alphabet-uc">
            <xsl:apply-templates />
          </ol>
        </xsl:when>
        <xsl:when test="@style='bullet'">
          <ul class="bullet">
            <xsl:apply-templates />
          </ul>
        </xsl:when>
        <xsl:when test="@style='en-dash'">
          <ul class="en-dash">
            <xsl:apply-templates />
          </ul>
        </xsl:when>
        <xsl:when test="@style='em-dash'">
          <ul class="em-dash">
            <xsl:apply-templates />
          </ul>
        </xsl:when>
        <xsl:otherwise>
          <ul class="noBullet">
            <xsl:apply-templates />
          </ul>
        </xsl:otherwise>
      </xsl:choose>
    </figure>
  </xsl:template>

  <xsl:template match="Item">
    <li>
      <xsl:apply-templates />
    </li>
  </xsl:template>

  <xsl:template match="List/Item/Label">
    <xsl:choose>
      <xsl:when test="following-sibling::*[1][self::Text]">
        <!-- Do nothing it has been pulled in -->
      </xsl:when>
      <xsl:otherwise>
        <xsl:apply-templates />
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="Item/Text">

    <xsl:variable name="fLineIndent">
      <xsl:choose>
        <xsl:when test="ancestor::List/@first-line-indent">
          <xsl:value-of select="ancestor::List/@first-line-indent" />
        </xsl:when>
        <xsl:otherwise>
          <xsl:text>0</xsl:text>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>

    <xsl:variable name="sLineIndent">
      <xsl:choose>
        <xsl:when test="ancestor::List/@subsequent-line-indent">
          <xsl:value-of select="ancestor::List/@subsequent-line-indent" />
        </xsl:when>
        <xsl:otherwise>
          <xsl:text>0</xsl:text>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:variable name="padding">
      <xsl:value-of select="translate($sLineIndent - $fLineIndent, '.', '-')" />
    </xsl:variable>
    <div class="listItemBlock{translate($fLineIndent, '.', '-')}">
      <div class="listItemLabel">
        <xsl:apply-templates select="preceding-sibling::Label[1]" mode="pulled" />
        <!--<xsl:if test="not(preceding-sibling::Label)">&#x00A0;</xsl:if>-->
      </div>
      <div class="listItemText{$padding}">
        <xsl:apply-templates />
      </div>
    </div>
  </xsl:template>

  <xsl:template match="AmendedText | AmendedContent">
    <section>
      <div class="AmendedText">
        <xsl:if test="@xml:lang">
          <xsl:attribute name="lang">
            <xsl:value-of select="@xml:lang" />
          </xsl:attribute>
        </xsl:if>
        <xsl:apply-templates />
      </div>
    </section>
  </xsl:template>

  <xsl:template match="ReadAsText">
    <blockquote>
      <div class="ReadAsText">
        <xsl:apply-templates />
      </div>
    </blockquote>
  </xsl:template>
  <xsl:template match="QuotedText">
    <blockquote>
      <div class="QuotedText">
        <xsl:apply-templates />
      </div>
    </blockquote>
  </xsl:template>
  <xsl:template match="Citation">
    <blockquote>
      <div class="Citation">
        <xsl:apply-templates />
      </div>
    </blockquote>
  </xsl:template>


  <xsl:template match="DocumentInternal | Group | SectionPiece">
    <xsl:apply-templates />
  </xsl:template>

  <xsl:template match="Section[@isNIF='true' or @in-force]">
    <div class="nif">
      <xsl:call-template name="nifHiddenMessage" />
      <xsl:apply-templates select="*[not(self::Label)]" />
    </div>
  </xsl:template>

  <xsl:template match="Section">
    <xsl:apply-templates select="*[not(self::Label)]" />
  </xsl:template>

  <!-- Sections in schedule converted to list markup -->
  <xsl:template match="Section[ancestor::Schedule]">
    <xsl:choose>
      <xsl:when test="preceding-sibling::*[1][self::Section]">
        <!-- It's not the first; so it has already been pulled in.  We'll do nothing here. -->
      </xsl:when>
      <xsl:otherwise>
        <!-- It's the first of this group; we'll start a new list:  -->
        <ul class="ProvisionList">
          <li>
            <xsl:choose>
              <xsl:when test="@in-force">
                <xsl:call-template name="nifHiddenMessage" />
                <div class="nif">
                  <xsl:apply-templates />
                </div>
              </xsl:when>
              <xsl:otherwise>
                <xsl:apply-templates />
              </xsl:otherwise>
            </xsl:choose>
          </li>
          <xsl:apply-templates select="following-sibling::*[1][self::Section]" mode="inside-list"/>
        </ul>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="Section" mode="inside-list">
    <!-- Put this paragraph into the <li> tag:  -->
    <li>
      <!-- Process this Provision  -->
      <xsl:choose>
        <xsl:when test="@in-force">
          <xsl:call-template name="nifHiddenMessage" />
          <div class="nif">
            <xsl:apply-templates />
          </div>
        </xsl:when>
        <xsl:otherwise>
          <xsl:apply-templates />
        </xsl:otherwise>
      </xsl:choose>
    </li>
    <!-- Get the next Provision list-item, if there is one -->
    <xsl:apply-templates select="following-sibling::*[1][self::Section]" mode="inside-list"/>
  </xsl:template>
  <xsl:template match="Section[ancestor::Schedule]/Label">
    <!-- Do nothing so that label is not duplicated in the inside-list mode-->
  </xsl:template>


  <xsl:template match="Subsection">
    <xsl:choose>
      <xsl:when test="preceding-sibling::*[1][self::Subsection]">
        <!-- It's not the first; so it has already been pulled in.  We'll do nothing here. -->
      </xsl:when>
      <xsl:otherwise>
        <!-- It's the first of this group; we'll start a new list:  -->
        <ul class="ProvisionList">
          <li>
            <xsl:choose>
              <xsl:when test="@in-force">
                <xsl:call-template name="nifHiddenMessage" />
                <div class="nif">
                  <xsl:apply-templates />
                </div>
              </xsl:when>
              <xsl:otherwise>
                <xsl:apply-templates />
              </xsl:otherwise>
            </xsl:choose>
          </li>
          <!-- Get the next Provision list-item, if there is one-->
          <xsl:apply-templates select="following-sibling::*[1][self::Subsection]" mode="inside-list"/>
        </ul>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  <xsl:template match="Subsection" mode="inside-list">
    <!-- Put this paragraph into the <li> tag:  -->
    <li>
      <!-- Process this Provision  -->
      <xsl:choose>
        <xsl:when test="@in-force">
          <xsl:call-template name="nifHiddenMessage" />
          <div class="nif">
            <xsl:apply-templates />
          </div>
        </xsl:when>
        <xsl:otherwise>
          <xsl:apply-templates />
        </xsl:otherwise>
      </xsl:choose>
    </li>
    <!-- Get the next Provision list-item, if there is one -->
    <xsl:apply-templates select="following-sibling::*[1][self::Subsection]" mode="inside-list"/>
  </xsl:template>
  <xsl:template match="Subsection/Label">
    <!-- Do nothing so that label is not duplicated in the inside-list mode-->
  </xsl:template>

  <xsl:template match="Paragraph">
    <xsl:choose>
      <xsl:when test="preceding-sibling::*[1][self::Paragraph]">
        <!-- It's not the first; so it has already been pulled in.  We'll do nothing here. -->
      </xsl:when>
      <xsl:otherwise>
        <!-- It's the first of this group; we'll start a new list:  -->
        <ul class="ProvisionList">
          <li>
            <xsl:choose>
              <xsl:when test="@in-force">
                <xsl:call-template name="nifHiddenMessage" />
                <div class="nif">
                  <xsl:apply-templates />
                </div>
              </xsl:when>
              <xsl:otherwise>
                <xsl:apply-templates />
              </xsl:otherwise>
            </xsl:choose>
          </li>
          <!-- Get the next Provision list-item, if there is one-->
          <xsl:apply-templates select="following-sibling::*[1][self::Paragraph]" mode="inside-list"/>
        </ul>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  <xsl:template match="Paragraph" mode="inside-list">
    <!-- Put this paragraph into the <li> tag:  -->
    <li>
      <!-- Process this Provision  -->
      <xsl:choose>
        <xsl:when test="@in-force">
          <xsl:call-template name="nifHiddenMessage" />
          <div class="nif">
            <xsl:apply-templates />
          </div>
        </xsl:when>
        <xsl:otherwise>
          <xsl:apply-templates />
        </xsl:otherwise>
      </xsl:choose>
    </li>
    <!-- Get the next Provision list-item, if there is one -->
    <xsl:apply-templates select="following-sibling::*[1][self::Paragraph]" mode="inside-list"/>
  </xsl:template>
  <xsl:template match="Paragraph/Label">
    <!-- Do nothing so that label is not duplicated in the inside-list mode-->
  </xsl:template>

  <xsl:template match="Subparagraph">
    <xsl:choose>
      <xsl:when test="preceding-sibling::*[1][self::Subparagraph]">
        <!-- It's not the first; so it has already been pulled in.  We'll do nothing here. -->
      </xsl:when>
      <xsl:otherwise>
        <!-- It's the first of this group; we'll start a new list:  -->
        <ul class="ProvisionList">
          <li>
            <xsl:apply-templates />
          </li>
          <!-- Get the next Provision list-item, if there is one-->
          <xsl:apply-templates select="following-sibling::*[1][self::Subparagraph]" mode="inside-list"/>
        </ul>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  <xsl:template match="Subparagraph" mode="inside-list">
    <!-- Put this paragraph into the <li> tag:  -->
    <li>
      <!-- Process this Provision  -->
      <xsl:apply-templates />
    </li>
    <!-- Get the next Provision list-item, if there is one -->
    <xsl:apply-templates select="following-sibling::*[1][self::Subparagraph]" mode="inside-list"/>
  </xsl:template>
  <xsl:template match="Subparagraph/Label">
    <!-- Do nothing so that label is not duplicated in the inside-list mode-->
  </xsl:template>

  <xsl:template match="Clause">
    <xsl:choose>
      <xsl:when test="preceding-sibling::*[1][self::Clause]">
        <!-- It's not the first; so it has already been pulled in.  We'll do nothing here. -->
      </xsl:when>
      <xsl:otherwise>
        <!-- It's the first of this group; we'll start a new list:  -->
        <ul class="ProvisionList">
          <li>
            <xsl:apply-templates />
          </li>
          <!-- Get the next Provision list-item, if there is one-->
          <xsl:apply-templates select="following-sibling::*[1][self::Clause]" mode="inside-list"/>
        </ul>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  <xsl:template match="Clause" mode="inside-list">
    <!-- Put this paragraph into the <li> tag:  -->
    <li>
      <!-- Process this Provision  -->
      <xsl:apply-templates />
    </li>
    <!-- Get the next Provision list-item, if there is one -->
    <xsl:apply-templates select="following-sibling::*[1][self::Clause]" mode="inside-list"/>
  </xsl:template>
  <xsl:template match="Clause/Label">
    <!-- Do nothing so that label is not duplicated in the inside-list mode-->
  </xsl:template>

  <xsl:template match="Subclause">
    <xsl:choose>
      <xsl:when test="preceding-sibling::*[1][self::Subclause]">
        <!-- It's not the first; so it has already been pulled in.  We'll do nothing here. -->
      </xsl:when>
      <xsl:otherwise>
        <!-- It's the first of this group; we'll start a new list:  -->
        <ul class="ProvisionList">
          <li>
            <xsl:apply-templates />
          </li>
          <!-- Get the next Provision list-item, if there is one-->
          <xsl:apply-templates select="following-sibling::*[1][self::Subclause]" mode="inside-list"/>
        </ul>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  <xsl:template match="Subclause" mode="inside-list">
    <!-- Put this paragraph into the <li> tag:  -->
    <li>
      <!-- Process this Provision  -->
      <xsl:apply-templates />
    </li>
    <!-- Get the next Provision list-item, if there is one -->
    <xsl:apply-templates select="following-sibling::*[1][self::Subclause]" mode="inside-list"/>
  </xsl:template>
  <xsl:template match="Subclause/Label">
    <!-- Do nothing so that label is not duplicated in the inside-list mode-->
  </xsl:template>

  <xsl:template match="Subsubclause | Provision">
    <xsl:choose>
      <xsl:when test="@in-force">
        <div class="nif">
          <xsl:call-template name="nifHiddenMessage" />
          <xsl:apply-templates select="*[not(self::Label)]" />
        </div>
      </xsl:when>
      <xsl:otherwise>
        <xsl:apply-templates select="*[not(self::Label)]" />
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template name="nifHiddenMessage">
    <xsl:choose>
      <xsl:when test="$language='fr'">
        <div class="hiddenMsg">La disposition suivante n'est pas en vigueur.</div>
      </xsl:when>
      <xsl:otherwise>
        <div class="hiddenMsg">The following provision is not in force.</div>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="ContinuedSectionSubsection | ContinuedParagraph | ContinuedSubparagraph | ContinuedClause | ContinuedSubclause | ContinuedDefinition | ContinuedFormulaParagraph ">
    <xsl:apply-templates />
  </xsl:template>


  <xsl:template match="a">
    <div class="PITLink">
      <xsl:copy-of select="." />
    </div>
  </xsl:template>


  <xsl:template match="Preamble/Provision/MarginalNote">
    <h6 id="preamble" class="MarginalNote">
      <xsl:apply-templates />
    </h6>
  </xsl:template>

  <xsl:template match="MarginalNote">
    <xsl:choose>
      <xsl:when test="DefinedTermEn | DefinedTermFr">
        <p class="MarginalNoteDefinedTerm">
          <xsl:apply-templates />
        </p>
      </xsl:when>
      <xsl:when test="ancestor::Schedule[@id='NifProvs']">
        <h6 class="MarginalNote">
          <xsl:apply-templates />
        </h6>
      </xsl:when>
      <xsl:when test="ancestor::Schedule[@id='RelatedProvs']">
        <h6 class="MarginalNote">
          <xsl:apply-templates />
        </h6>
      </xsl:when>
      <xsl:when test="ancestor::AmendedText | parent::Section | parent::Subsection | parent::Paragraph">
        <p class="MarginalNote">
          <span class="wb-invisible">
            <xsl:choose>
              <xsl:when test="$language='fr'">
                <xsl:text>Note marginale :</xsl:text>
              </xsl:when>
              <xsl:otherwise>
                <xsl:text>Marginal note:</xsl:text>
              </xsl:otherwise>
            </xsl:choose>
          </span>
          <xsl:apply-templates />
        </p>
      </xsl:when>
      <xsl:when test="parent::Heading">
        <span class="MarginalNoteInHeading">
          <xsl:apply-templates />
        </span>
      </xsl:when>
      <xsl:otherwise>
        <xsl:apply-templates />
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <!-- We have to use Pull processing here because we are creating definition list starting from a flat structure (consecutive Definitions) -->
  <xsl:template match="Definition">
    <xsl:choose>
      <xsl:when test="preceding-sibling::*[1][self::Definition]">
        <!-- It's not the first; so it has already been pulled in.  We'll do nothing here. -->
      </xsl:when>
      <xsl:otherwise>
        <!-- It's the first of this group; we'll start a new list:  -->
        <dl>

          <xsl:attribute name="class">
            <xsl:if test="parent::*[@type]">
              <xsl:value-of select="../@type" /><xsl:text> </xsl:text>
            </xsl:if>
            <xsl:text>Definition</xsl:text>
          </xsl:attribute>
          <xsl:choose>
            <xsl:when test="MarginalNote"> <!-- When we have Marginal notes, we will use them for the <dt>-->
              <dt>
                <xsl:apply-templates select="MarginalNote" />
              </dt>
              <dd>
                <xsl:apply-templates select="*[not(self::MarginalNote)]" />
              </dd>
            </xsl:when>
            <xsl:otherwise>
              <!-- Definition without Marg Notes  - use first DefinedTerm as the dt -->
              <xsl:choose>
                <xsl:when test="$language='fr'">
                  <dt>
                    <xsl:apply-templates select="Text/DefinedTermFr[1]" />
                  </dt>
                  <dd>
                    <xsl:apply-templates />
                  </dd>
                </xsl:when>
                <xsl:otherwise>
                  <dt>
                    <xsl:apply-templates select="Text/DefinedTermEn[1]" />
                  </dt>
                  <dd>
                    <xsl:apply-templates />
                  </dd>
                </xsl:otherwise>
              </xsl:choose>
            </xsl:otherwise>
          </xsl:choose>
          <!-- Get the next Definition, if there is one-->
          <xsl:apply-templates select="following-sibling::*[1][self::Definition]" mode="inside-list"/>
        </dl>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>


  <xsl:template match="Definition" mode="inside-list">
    <!-- Put this Definition into the <li> tag:  -->
    <xsl:choose>
      <xsl:when test="MarginalNote">
        <dt>
          <xsl:apply-templates select="MarginalNote" />
        </dt>
        <dd>
          <xsl:apply-templates select="*[not(self::MarginalNote)]" />
        </dd>
      </xsl:when>
      <xsl:otherwise>
        <!-- Definition without Marg Notes  - use first DefinedTerm as the dt -->
        <xsl:choose>
          <xsl:when test="$language='fr'">
            <dt>
              <xsl:apply-templates select="Text/DefinedTermFr[1]" />
            </dt>
            <dd>
              <xsl:apply-templates />
            </dd>
          </xsl:when>
          <xsl:otherwise>
            <dt>
              <xsl:apply-templates select="Text/DefinedTermEn[1]" />
            </dt>
            <dd>
              <xsl:apply-templates />
            </dd>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:otherwise>
    </xsl:choose>
    <!-- Get the next Definition, if there is one -->
    <xsl:apply-templates select="following-sibling::*[1][self::Definition]" mode="inside-list"/>
  </xsl:template>


  <xsl:template match="Definition/Text">
    <p class="Definition">
      <xsl:if test="parent::Definition[@generate-in-text='yes']">
        <!-- copy value of Marg note for gen-in-text -->
        <xsl:choose>
          <xsl:when test="$language='fr'">
            <!--<xsl:text>&#x00AB; </xsl:text>-->
            <xsl:value-of select="parent::Definition/MarginalNote[1]" />
            <!--<xsl:text> &#x00BB; </xsl:text>-->
          </xsl:when>
          <xsl:otherwise>
            <!--<xsl:text>&#x201C;</xsl:text>-->
            <xsl:value-of select="parent::Definition/MarginalNote[1]" />
            <!--<xsl:text>&#x201D; </xsl:text>-->
          </xsl:otherwise>
        </xsl:choose>
      </xsl:if>
      <xsl:apply-templates />

      <xsl:if test="ancestor::Definition[MarginalNote]">
        <!-- If the current Text element is the last Text element inside a Definition with MarginalNotes we must extract it -->
        <!-- But only if this is the last Text element in the Definition -->
        <xsl:choose>
          <xsl:when test="generate-id(.) = generate-id(ancestor::Definition/descendant::Text[last()])">
            <!-- This node is the last Text node within the Definition -->
            <xsl:if test="ancestor::Definition[1]/MarginalNote[2]">
              <!-- Only add other language if there is 2 marg notes-->
              <xsl:text> (</xsl:text>
              <xsl:apply-templates select="ancestor::Definition[1]/MarginalNote[2]/* | ancestor::Definition[1]/MarginalNote[2]/text()" />
              <xsl:text>)</xsl:text>
            </xsl:if>
          </xsl:when>
          <xsl:otherwise>
            <!-- If neither condition is true, then we do nothing -->
          </xsl:otherwise>
        </xsl:choose>
      </xsl:if>

    </p>
  </xsl:template>

  <xsl:template match="DefinedTermEn">
    <xsl:choose>
      <xsl:when test="$language='fr' and parent::Text">
        <!-- Generate Link but Dont generate quotes-->
        <span class="DefinedTermLink" lang="en">
          <xsl:apply-templates />
        </span>
      </xsl:when>
      <xsl:when test="$language='fr' and parent::MarginalNote">
        <!-- Generate Link and quotes-->
        <span class="DefinedTermLink" lang="en">
          <!--<xsl:text>&#x201C;</xsl:text>-->
          <xsl:apply-templates />
          <!--<xsl:text>&#x201D;</xsl:text>-->

        </span>
      </xsl:when>
      <xsl:otherwise>
        <span class="DefinedTerm">
          <dfn>
            <!--<xsl:text>&#x201C;</xsl:text>-->
            <xsl:apply-templates />
            <!--<xsl:text>&#x201D;</xsl:text>-->
          </dfn>
        </span>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="DefinedTermFr">
    <xsl:choose>
      <xsl:when test="parent::Text and $language='en'">
        <!-- Generate Link and no quotes -->
        <span class="DefinedTermLink" lang="fr">
          <xsl:apply-templates />
        </span>
      </xsl:when>
      <xsl:when test="parent::MarginalNote and $language='en'">
        <!-- Generate Link  -->
        <span class="DefinedTermLink" lang="fr">
          <!--<xsl:text>&#x00AB; </xsl:text>-->
          <xsl:apply-templates />
          <!--<xsl:text> &#x00BB;</xsl:text>-->
        </span>
      </xsl:when>
      <xsl:otherwise>
        <span class="DefinedTerm">
          <dfn>
            <!--<xsl:text>&#x00AB; </xsl:text>-->
            <xsl:apply-templates />
            <!--<xsl:text> &#x00BB;</xsl:text>-->
          </dfn>
        </span>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="XRefExternal">
    <xsl:variable name="refStyle">
      <xsl:choose>
        <xsl:when test="@reference-type='act'">
          <xsl:text>XRefExternalAct</xsl:text>
        </xsl:when>
        <xsl:when test="@reference-type='regulation'">
          <xsl:text>XRefExternalRegulation</xsl:text>
        </xsl:when>
        <xsl:when test="@reference-type='other' and @isURL='true'">
          <xsl:text>XRefExternalLink</xsl:text>
        </xsl:when>
        <xsl:otherwise>
          <xsl:text>XRefExternal</xsl:text>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <cite>
      <xsl:attribute name="class">
        <xsl:value-of select="$refStyle" />
      </xsl:attribute>
      <xsl:choose>
        <xsl:when test="@link">
          <a>
            <xsl:choose>
              <xsl:when test="@reference-type='act'">
                <xsl:attribute name="href">
                  <xsl:choose>
                    <xsl:when test="@link='const'">
                      <xsl:choose>
                        <xsl:when test="$language='fr'">
                          <xsl:text>/fra/Const/</xsl:text>
                        </xsl:when>
                        <xsl:otherwise>
                          <xsl:text>/eng/Const/</xsl:text>
                        </xsl:otherwise>
                      </xsl:choose>
                    </xsl:when>
                    <xsl:when test="$language='fr'">
                      <xsl:text>/fra/lois/</xsl:text>
                      <xsl:value-of select="@link" />
                    </xsl:when>
                    <xsl:otherwise>
                      <xsl:text>/eng/acts/</xsl:text>
                      <xsl:value-of select="@link" />
                    </xsl:otherwise>
                  </xsl:choose>
                </xsl:attribute>
              </xsl:when>
              <xsl:when test="@reference-type='regulation'">
                <xsl:attribute name="href">
                  <xsl:choose>
                    <xsl:when test="$language='fr'">
                      <xsl:text>/fra/reglements/</xsl:text>
                      <xsl:value-of select="@link" />
                    </xsl:when>
                    <xsl:otherwise>
                      <xsl:text>/eng/regulations/</xsl:text>
                      <xsl:value-of select="@link" />
                    </xsl:otherwise>
                  </xsl:choose>
                </xsl:attribute>
              </xsl:when>
              <xsl:when test="@reference-type='other'">
                <xsl:choose>
                  <xsl:when test="@link='gazette'">
                    <xsl:attribute name="href">
                      <xsl:text>http://www.gazette.gc.ca/</xsl:text>
                    </xsl:attribute>
                  </xsl:when>
                  <xsl:when test="@isURL='true'">
                    <xsl:attribute name="href"><xsl:value-of select="@link" />
                    </xsl:attribute>
                  </xsl:when>
                </xsl:choose>
              </xsl:when>
            </xsl:choose>
            <xsl:apply-templates />
          </a>
        </xsl:when>
        <xsl:otherwise>
          <!--If no link attribute has been added-->
          <xsl:apply-templates />
        </xsl:otherwise>
      </xsl:choose>
    </cite>
  </xsl:template>

  <xsl:template match="Language">
    <xsl:choose>
      <xsl:when test="@xml:lang=$language">
        <xsl:apply-templates />
      </xsl:when>
      <xsl:otherwise>
        <span class="otherLang" lang="{@xml:lang}">
          <xsl:apply-templates />
        </span>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="XRefInternal">
    <xsl:apply-templates />
  </xsl:template>

  <!-- START OF THE -HEADINGS- SECTION -->

  <xsl:template match="ScheduleFormHeading">
    <header>
      <h2 class="scheduleLabel">
        <xsl:if test="not(parent::FormGroup or parent::Schedule[ancestor::Schedule])">
          <xsl:call-template name="generate-heading-id" />
        </xsl:if>
        <xsl:apply-templates select="*[not(self::HistoricalNote)]" />
      </h2>

      <xsl:apply-templates select="HistoricalNote" />
    </header>
  </xsl:template>

  <xsl:template match="GroupHeading">
    <xsl:choose>
      <xsl:when test="@format-ref='group1-part'">
        <h2 class="SchedHeadL1">
          <xsl:apply-templates />
        </h2>
      </xsl:when>
      <xsl:when test="@format-ref='group2-division'">
        <h3 class="SchedHeadL2">
          <xsl:apply-templates />
        </h3>
      </xsl:when>
      <xsl:when test="@format-ref='group3-subdivision'">
        <h4 class="SchedHeadL3">
          <xsl:apply-templates />
        </h4>
      </xsl:when>
      <xsl:when test="@format-ref='centered'">
        <h2 class="SchedHeadL1">
          <xsl:apply-templates />
        </h2>
      </xsl:when>
      <xsl:otherwise>
        <h5>
          <xsl:apply-templates />
        </h5>
      </xsl:otherwise>
    </xsl:choose>

  </xsl:template>

  <xsl:template match="entry/Provision/Heading[@style='rowleft']">
    <div class="rowleft">
      <xsl:apply-templates />
    </div>

  </xsl:template>

  <!-- LIST CAPTIONS -->
  <xsl:template match="Heading[@style='listcaption']">
    <!-- Do nothing, will be pulled in List template -->
  </xsl:template>
  <xsl:template match="Heading[@style='listcaption']" mode="listcaption">
    <xsl:apply-templates mode="listcaption"/>
  </xsl:template>

  <xsl:template match="TitleText" mode="listcaption">
    <xsl:choose>
      <xsl:when test="parent::Heading[@level='1']">
        <p><span class="HTitleText1"><xsl:apply-templates /></span></p>
      </xsl:when>
      <xsl:when test="parent::Heading[@level='2']">
        <p><span class="HTitleText2"><xsl:apply-templates /></span></p>
      </xsl:when>
      <xsl:when test="parent::Heading[@level='3']">
        <p><span class="HTitleText3"><xsl:apply-templates /></span></p>
      </xsl:when>
      <xsl:when test="parent::Heading[@level='4']">
        <p><span class="HTitleText4"><xsl:apply-templates /></span></p>
      </xsl:when>
      <xsl:when test="parent::Heading[@level='5']">
        <p><span class="HTitleText5"><xsl:apply-templates /></span></p>
      </xsl:when>
      <xsl:otherwise>
        <p><span class="HTitleText1"><xsl:apply-templates /></span></p>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="Label" mode="listcaption">
    <p>
      <span class="HLabel">
        <xsl:apply-templates />
      </span>
    </p>
  </xsl:template>


  <xsl:template match="Heading">
    <xsl:choose>
      <xsl:when test="(ancestor::Schedule[@id='NifProvs']) and @level='5'">
        <xsl:apply-templates mode="nifrp"/>
      </xsl:when>
      <xsl:when test="(ancestor::Schedule[@id='RelatedProvs']) and @level='5'">
        <xsl:apply-templates mode="nifrp"/>
      </xsl:when>
      <xsl:when test="ancestor::Schedule or ancestor::BillInternal or ancestor::Section">
        <!-- demote the level if its inside a schedule-->
        <xsl:choose>
          <xsl:when test="@level='1'">
            <h3 class="SchedHeadL1">
              <xsl:apply-templates />
            </h3>
          </xsl:when>
          <xsl:when test="@level='2'">
            <h4 class="SchedHeadL2">
              <xsl:apply-templates />
            </h4>
          </xsl:when>
          <xsl:when test="@level='3'">
            <h5 class="SchedHeadL3">
              <xsl:apply-templates />
            </h5>
          </xsl:when>
          <xsl:when test="@level='4'">
            <h6 class="SchedHeadL4">
              <xsl:apply-templates />
            </h6>
          </xsl:when>
          <xsl:otherwise>
            <h6>
              <xsl:apply-templates />
            </h6>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:when>
      <xsl:otherwise>
        <xsl:choose>
          <xsl:when test="@level='1'">
            <h2 class="Part">
              <xsl:call-template name="generate-heading-id" />
              <xsl:apply-templates select="*[not(self::HistoricalNote)]" />
            </h2>
            <xsl:apply-templates select="HistoricalNote" />
          </xsl:when>
          <xsl:when test="@level='2'">
            <h3 class="Subheading">
              <xsl:call-template name="generate-heading-id" />
              <xsl:apply-templates select="*[not(self::HistoricalNote)]" />
            </h3>
            <xsl:apply-templates select="HistoricalNote" />
          </xsl:when>
          <xsl:when test="@level='3'">
            <h4 class="Subheading">
              <xsl:call-template name="generate-heading-id" />
              <xsl:apply-templates select="*[not(self::HistoricalNote)]" />
            </h4>
            <xsl:apply-templates select="HistoricalNote" />
          </xsl:when>
          <xsl:when test="@level='4'">
            <h5 class="Subheading">
              <xsl:call-template name="generate-heading-id" />
              <xsl:apply-templates select="*[not(self::HistoricalNote)]" />
            </h5>
            <xsl:apply-templates select="HistoricalNote" />
          </xsl:when>
          <xsl:when test="@level='5'">
            <h6 class="Subheading">
              <xsl:call-template name="generate-heading-id" />
              <xsl:apply-templates select="*[not(self::HistoricalNote)]" />
            </h6>
            <xsl:apply-templates select="HistoricalNote" />
          </xsl:when>
          <!-- Cant find a heading level -->
          <xsl:otherwise>
            <h5>
              <xsl:if test="@type">
                <xsl:attribute name="class">
                  <xsl:value-of select="@type" />
                </xsl:attribute>
              </xsl:if>
              <xsl:choose>
                <xsl:when test="@lims:fid">
                  <xsl:call-template name="generate-heading-id" />
                </xsl:when>
                <xsl:otherwise> <!-- PIT TOC HEADINGS DONT HAVE FID - GENERATE AN ID-->
                  <xsl:attribute name="id">
                    <xsl:text>h-</xsl:text>
                    <xsl:value-of select="generate-id()" />
                  </xsl:attribute>
                </xsl:otherwise>
              </xsl:choose>
              <xsl:apply-templates />
            </h5>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>


  <xsl:template match="Heading/Label">
    <span>
      <xsl:attribute name="class">
        <xsl:text>HLabel</xsl:text>
        <xsl:value-of select="parent::Heading/@level" />
      </xsl:attribute>
      <xsl:apply-templates />
    </span>
  </xsl:template>

  <xsl:template match="Heading/TitleText">
    <span>
      <xsl:attribute name="class">
        <xsl:text>HTitleText</xsl:text>
        <xsl:value-of select="parent::Heading/@level" />
      </xsl:attribute>
      <xsl:apply-templates />
    </span>
  </xsl:template>

  <xsl:template match="GroupHeading/TitleText">
    <xsl:apply-templates />
  </xsl:template>

  <xsl:template match="GroupHeading/Label">
    <xsl:apply-templates />
    <br />
  </xsl:template>


  <xsl:template match="Heading[@level='5']/TitleText" mode="nifrp">
    <p class="nifrpCitation">
      <xsl:apply-templates />
    </p>
  </xsl:template>



  <!-- General rule in case somehow a type of label or TitleText has been missed-->
  <xsl:template match="Label">
    <p>
      <xsl:apply-templates />
    </p>
  </xsl:template>

  <xsl:template match="TitleText">
    <xsl:if test="not(parent::Summary)">
      <p>
        <xsl:apply-templates />
      </p>
    </xsl:if>
  </xsl:template>

  <xsl:template match="ScheduleFormHeading/Label">
    <xsl:if test="(not(ancestor::AmendedText)) and (not(ancestor::Schedule/ancestor::Schedule))">
      <xsl:message>~SCH-TITLE<xsl:value-of select="descendant::text()" />
        <xsl:if test="following-sibling::TitleText">
          <xsl:text> : </xsl:text>
          <xsl:value-of select="following-sibling::TitleText/descendant::text()" />
        </xsl:if>
      </xsl:message>
    </xsl:if>
    <span class="scheduleLabel">
      <xsl:apply-templates />
    </span>
  </xsl:template>

  <!--Steven Gorn - Oct 28,2016-->
  <!--Added line break after schedule title text to separate multiple titles.-->
  <xsl:template match="ScheduleFormHeading/TitleText">
    <xsl:choose>
      <xsl:when test="(not(ancestor::AmendedText)) and (not(ancestor::Schedule/ancestor::Schedule)) and parent::ScheduleFormHeading[not(Label)]">
        <xsl:message>~SCH-TITLE<xsl:value-of select="descendant::text()" /></xsl:message>
        <span class="scheduleTitleText">
          <xsl:apply-templates />
        </span>
        <br/>
        <xsl:if test="position() != last()">
          <br/>
        </xsl:if>
      </xsl:when>
      <xsl:otherwise>
        <span class="scheduleTitleText">
          <xsl:apply-templates />
        </span>
        <br/>
        <xsl:if test="position() != last()">
          <br/>
        </xsl:if>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="Emphasis">
    <xsl:choose>
      <xsl:when test="@style='italic'">
        <em>
          <xsl:apply-templates />
        </em>
      </xsl:when>
      <xsl:when test="@style='bold'">
        <strong>
          <xsl:apply-templates />
        </strong>
      </xsl:when>
      <xsl:when test="@style='smallcaps'">
        <span class="Smallcaps">
          <xsl:apply-templates />
        </span>
      </xsl:when>
      <xsl:when test="@style='overbar'">
        <span class="Overbar">
          <xsl:apply-templates />
        </span>
      </xsl:when>
      <xsl:when test="@style='underline'">
        <span class="Underline">
          <xsl:apply-templates />
        </span>
      </xsl:when>
      <xsl:when test="@style='regular'">
        <span class="Regular">
          <xsl:apply-templates />
        </span>
      </xsl:when>
          <xsl:otherwise>
        <xsl:apply-templates />
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="BilingualGroup/TitleText">
    <span class="BilingualGroupTitleText">
      <xsl:apply-templates />
    </span>
  </xsl:template>

  <!-- BilingualGroups with TitleText will be marked up as nested lists-->
  <xsl:template match="BilingualGroup[TitleText]">
    <xsl:choose>
      <xsl:when test="preceding-sibling::*[1][self::BilingualGroup[TitleText]]">
        <!-- It's not the first; so it has already been pulled in.  We'll do nothing here. -->
      </xsl:when>
      <xsl:otherwise>
        <ul class="ProvisionList">
          <li>
            <xsl:apply-templates select="TitleText" />
            <ul class="ProvisionList">
              <xsl:apply-templates select="*[not(self::TitleText)]"/>
            </ul>
          </li>
          <!-- Get the next BilingualGroup with TitleText, if there is one-->
          <xsl:apply-templates select="following-sibling::*[1][self::BilingualGroup[TitleText]]" mode="inside-list"/>
        </ul>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="BilingualGroup[TitleText]" mode="inside-list">
    <li>
      <xsl:apply-templates select="TitleText" />
      <ul class="ProvisionList">
        <xsl:apply-templates select="*[not(self::TitleText)]"/>
      </ul>
    </li>
    <xsl:apply-templates select="following-sibling::*[1][self::BilingualGroup[TitleText]]" mode="inside-list"/>
  </xsl:template>

  <xsl:template match="BilingualGroup">
    <ul class="BilingualGroup">
      <xsl:apply-templates />
    </ul>
  </xsl:template>

  <xsl:template match="BilingualItemEn">
    <xsl:choose>
      <xsl:when test="$language='en'">
        <li>
          <p class="BilingualItemFirst">
            <xsl:apply-templates />
          </p>
          <p class="BilingualItemSecond" lang="fr">
            <xsl:apply-templates select="following-sibling::*[1][self::BilingualItemFr]" mode="secondItem" />
          </p>
        </li>
      </xsl:when>
      <xsl:otherwise>
        <!-- do nothing, the other language Item has pulled in this value -->
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="BilingualItemFr">
    <xsl:choose>
      <xsl:when test="$language='fr'">
        <li>
          <p class="BilingualItemFirst">
            <xsl:apply-templates />
          </p>
          <p class="BilingualItemSecond" lang="en">
            <xsl:apply-templates select="following-sibling::*[1][self::BilingualItemEn]" mode="secondItem" />
          </p>
        </li>
      </xsl:when>
      <xsl:otherwise>
        <!-- do nothing, the other language Item has pulled in this value -->
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="BilingualItemFr | BilingualItemEn" mode="secondItem">
    <xsl:apply-templates />
  </xsl:template>

  <xsl:template match="Repealed">
    <span class="Repealed">
      <!-- xsl:text>[</xsl:text>
<xsl:value-of select="name(.)" />
<xsl:text>]</xsl:text-->
      <xsl:apply-templates />
    </span>
  </xsl:template>

  <xsl:template match="DefinitionEnOnly | DefinitionFrOnly">
    <span class="DefinitionOtherLangOnly">
      <xsl:apply-templates />
    </span>
  </xsl:template>

  <!-- FORMULA CODE-->
  <!--Steven Gorn - Oct 28,2016-->
  <xsl:template match="FormulaDefinition">
    <xsl:choose>
      <xsl:when test="preceding-sibling::*[1][self::FormulaDefinition]">
        <!-- It's not the first; so it has already been pulled in.  We'll do nothing here. -->
      </xsl:when>
      <xsl:otherwise>
        <!-- It's the first of this group; we'll start a new list:  -->
        <dl class="FormulaDefinitionList">
          <xsl:choose>
            <xsl:when test="string-length(FormulaTerm/text()) > 5">
              <dt class="FormulaTermLarge">
                <xsl:apply-templates select="FormulaTerm" />
              </dt>
            </xsl:when>
            <xsl:otherwise>
              <dt class="FormulaTerm">
                <xsl:apply-templates select="FormulaTerm" />
              </dt>
            </xsl:otherwise>
          </xsl:choose>
          <xsl:choose>
            <xsl:when test="string-length(FormulaTerm/text()) = 2">
              <dd class="FormulaDef2">
                <xsl:apply-templates select="Text" />
                <xsl:apply-templates select="*[not((self::FormulaTerm)or(self::Text))]" />
              </dd>
            </xsl:when>
            <xsl:when test="string-length(FormulaTerm/text()) = 3">
              <dd class="FormulaDef3">
                <xsl:apply-templates select="Text" />
                <xsl:apply-templates select="*[not((self::FormulaTerm)or(self::Text))]" />
              </dd>
            </xsl:when>
            <xsl:when test="string-length(FormulaTerm/text()) = 4">
              <dd class="FormulaDef4">
                <xsl:apply-templates select="Text" />
                <xsl:apply-templates select="*[not((self::FormulaTerm)or(self::Text))]" />
              </dd>
            </xsl:when>
            <xsl:when test="string-length(FormulaTerm/text()) = 5">
              <dd class="FormulaDef5">
                <xsl:apply-templates select="Text" />
                <xsl:apply-templates select="*[not((self::FormulaTerm)or(self::Text))]" />
              </dd>
            </xsl:when>
            <xsl:otherwise>
              <dd class="FormulaDef">
                <xsl:apply-templates select="Text" />
                <xsl:apply-templates select="*[not((self::FormulaTerm)or(self::Text))]" />
              </dd>
            </xsl:otherwise>
          </xsl:choose>
          <!-- Get the next Definition, if there is one-->
          <xsl:apply-templates select="following-sibling::*[1][self::FormulaDefinition]" mode="inside-list"/>
        </dl>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="FormulaDefinition" mode="inside-list">
    <xsl:choose>
      <xsl:when test ="string-length(FormulaTerm/text()) > 5">
        <!-- Put this Definition into the <li> tag:  -->
        <dt class="FormulaTermLarge">
          <xsl:apply-templates select="FormulaTerm" />
        </dt>
      </xsl:when>
      <xsl:otherwise>
        <!-- Put this Definition into the <li> tag:  -->
        <dt class="FormulaTerm">
          <xsl:apply-templates select="FormulaTerm" />
        </dt>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="string-length(FormulaTerm/text()) = 2">
        <dd class="FormulaDef2">
          <xsl:apply-templates select="Text" />
          <xsl:apply-templates select="*[not((self::FormulaTerm)or(self::Text))]" />
        </dd>
      </xsl:when>
      <xsl:when test="string-length(FormulaTerm/text()) = 3">
        <dd class="FormulaDef3">
          <xsl:apply-templates select="Text" />
          <xsl:apply-templates select="*[not((self::FormulaTerm)or(self::Text))]" />
        </dd>
      </xsl:when>
      <xsl:when test="string-length(FormulaTerm/text()) = 4">
        <dd class="FormulaDef4">
          <xsl:apply-templates select="Text" />
          <xsl:apply-templates select="*[not((self::FormulaTerm)or(self::Text))]" />
        </dd>
      </xsl:when>
      <xsl:when test="string-length(FormulaTerm/text()) = 5">
        <dd class="FormulaDef5">
          <xsl:apply-templates select="Text" />
          <xsl:apply-templates select="*[not((self::FormulaTerm)or(self::Text))]" />
        </dd>
      </xsl:when>
      <xsl:otherwise>
        <dd class="FormulaDef">
          <xsl:apply-templates select="Text" />
          <xsl:apply-templates select="*[not((self::FormulaTerm)or(self::Text))]" />
        </dd>
      </xsl:otherwise>
    </xsl:choose>
    <!-- Get the next Definition, if there is one -->
    <xsl:apply-templates select="following-sibling::*[1][self::FormulaDefinition]" mode="inside-list"/>
  </xsl:template>

  <xsl:template match="FormulaTerm">
    <dfn>
      <xsl:apply-templates />
    </dfn>
  </xsl:template>

  <xsl:template match="FormulaGroup">
    <xsl:variable name="class">
      <xsl:choose>
        <xsl:when test="ancestor::FormulaDefinition">
          <xsl:text>NestedFormula</xsl:text>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="name(parent::*)" />
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <div>
      <xsl:attribute name="class">
        <xsl:value-of select="$class"/>
      </xsl:attribute>
      <xsl:apply-templates />
    </div>
  </xsl:template>

  <xsl:template match="FormulaParagraph">
    <xsl:choose>
      <xsl:when test="preceding-sibling::*[1][self::FormulaParagraph]">
        <!-- It's not the first; so it has already been pulled in.  We'll do nothing here. -->
      </xsl:when>
      <xsl:otherwise>
        <!-- It's the first of this group; we'll start a new list:  -->
        <ul class="FormulaProvisionList">
          <li>
            <xsl:apply-templates />
          </li>
          <!-- Get the next Provision list-item, if there is one-->
          <xsl:apply-templates select="following-sibling::*[1][self::FormulaParagraph]" mode="inside-list"/>
        </ul>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>


  <xsl:template match="FormulaParagraph" mode="inside-list">
    <!-- Put this paragraph into the <li> tag:  -->
    <li>
      <!-- Process this Provision  -->
      <xsl:apply-templates />
    </li>
    <!-- Get the next Provision list-item, if there is one -->
    <xsl:apply-templates select="following-sibling::*[1][self::FormulaParagraph]" mode="inside-list"/>
  </xsl:template>
  <xsl:template match="FormulaParagraph/Label">
    <!-- Do nothing so that label is not duplicated in the inside-list mode-->
  </xsl:template>

  <xsl:template match="Formula">
    <xsl:apply-templates />
  </xsl:template>

  <!--<xsl:template match="FormulaParagraph">
        <xsl:apply-templates select="*[not(self::Label)]" />
    </xsl:template>-->

  <xsl:template match="FormulaText | FormulaConnector">
    <xsl:variable name="class">
      <xsl:choose>
        <xsl:when test="parent::Provision">
          <xsl:call-template name="GetClassFromProvision">
            <xsl:with-param name="provision" select="parent::Provision" />
          </xsl:call-template>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="name(parent::*)" />
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <p>
      <xsl:attribute name="class">
        <xsl:value-of select="$class"/>
      </xsl:attribute>
      <xsl:apply-templates />
    </p>
  </xsl:template>
  <!--End Formula Section-->
  <xsl:template match="Oath">
    <p class="Oath">
      <xsl:apply-templates />
    </p>
  </xsl:template>

  <!-- START OF THE TABLES TRANSFORM -->

  <!-- THIS IS TEMPLATE FOR AUTOMATING TABLE-TO-LIST CONVERSION-->
  <xsl:template match="table[@list-direction]">
    <figure>
      <xsl:if test="title or preceding-sibling::Caption">
        <figcaption>
          <xsl:apply-templates select="preceding-sibling::Caption" />
          <xsl:apply-templates select="title" />
        </figcaption>
      </xsl:if>
      <ul class="noBullet">
        <xsl:apply-templates select="CGext:CreateListFromTable(tgroup, @list-direction)" mode="ReturnedList" />
      </ul>
    </figure>
  </xsl:template>

  <xsl:template match="List" mode="ReturnedList">
    <xsl:apply-templates />
  </xsl:template>

  <xsl:template match="TableGroup">
    <xsl:apply-templates select="*[not(self::Caption)]">
      <xsl:with-param name="tablepointsize" select="@pointsize" />
    </xsl:apply-templates>
  </xsl:template>


  <!-- THIS IS TEMPLATE FOR DATA TABLES-->
  <xsl:template match="table[(descendant::thead or descendant::row[1][@topdouble='yes']) and not(@list-direction)]">
    <xsl:param name="current-language"/>
    <xsl:param name="bilingual"/>
    <xsl:param name="tablepointsize" />
    <figure>
      <xsl:if test="title | preceding-sibling::Caption[@position='over']">
        <figcaption>
          <xsl:apply-templates select="preceding-sibling::Caption[@position='over']" />
          <xsl:apply-templates select="title" />
        </figcaption>
      </xsl:if>
      <xsl:apply-templates select="*[not(self::title | self::space-before)]">
        <xsl:with-param name="current-language">
          <xsl:value-of select="$current-language"/>
        </xsl:with-param>
        <xsl:with-param name="tableType">dataTable</xsl:with-param>
        <xsl:with-param name="bilingual">
          <xsl:value-of select="$bilingual"/>
        </xsl:with-param>
        <xsl:with-param name="tablepointsize">
          <xsl:value-of select="$tablepointsize" />
        </xsl:with-param>

        <xsl:with-param name="colsep" select="@colsep"/>
        <xsl:with-param name="rowsep" select="@rowsep"/>
        <xsl:with-param name="rowbreak" select="@rowbreak"/>
      </xsl:apply-templates>
      <xsl:if test="preceding-sibling::Caption[@position='under']">
        <figcaption>
          <xsl:apply-templates select="preceding-sibling::Caption[@position='under']" />
        </figcaption>
      </xsl:if>
    </figure>
  </xsl:template>

  <!--This should match mainly layout tables and therefore doesnt use the figure markup-->
  <xsl:template match="table">
    <xsl:param name="current-language"/>
    <xsl:param name="bilingual"/>
    <xsl:param name="tablepointsize" />
    <xsl:apply-templates select="preceding-sibling::Caption[@position='over']" />
    <xsl:apply-templates select="title" />
    <xsl:apply-templates select="*[not(self::title | self::space-before)]">
      <xsl:with-param name="current-language">
        <xsl:value-of select="$current-language"/>
      </xsl:with-param>
      <xsl:with-param name="bilingual">
        <xsl:value-of select="$bilingual"/>
      </xsl:with-param>
      <xsl:with-param name="tablepointsize">
        <xsl:value-of select="$tablepointsize" />
      </xsl:with-param>
      <xsl:with-param name="colsep" select="@colsep"/>
      <xsl:with-param name="rowsep" select="@rowsep"/>
      <xsl:with-param name="rowbreak" select="@rowbreak"/>
    </xsl:apply-templates>
    <xsl:apply-templates select="preceding-sibling::Caption[@position='under']" />
  </xsl:template>


  <!-- CAPTION FROM TABLE -->
  <xsl:template match="Caption">
    <p>
      <xsl:attribute name="class">
        <xsl:text>caption </xsl:text>
        <xsl:if test="@justification">
          <xsl:call-template name="setJustification" />
        </xsl:if>
      </xsl:attribute>
      <xsl:apply-templates />
    </p>
  </xsl:template>

  <xsl:template match="title">
    <p>
      <xsl:attribute name="class">
        <xsl:text>tableTitle </xsl:text>
        <xsl:if test="@justification">
          <xsl:call-template name="setJustification" />
        </xsl:if>
      </xsl:attribute>
      <xsl:apply-templates />
    </p>
  </xsl:template>

  <xsl:template match="tgroup">
    <xsl:param name="current-language"/>
    <xsl:param name="bilingual"/>
    <xsl:param name="tablepointsize" />
    <xsl:param name="rowbreak"/>
    <xsl:param name="colsep"/>
    <xsl:param name="rowsep"/>
    <xsl:param name="tableType"/>
    <table>
      <!-- if there's no title element, copy the attributes from TableGroup to table element -->
      <xsl:variable name="following-has-topdouble">
        <xsl:value-of select="boolean(.//row[1][@topdouble='yes'])"/>
      </xsl:variable>
      <xsl:variable name="tableClass">
        <xsl:if test="$tableType='dataTable' and count(descendant::row) &lt; 100">
          <xsl:text>table table-hover table-striped</xsl:text>
        </xsl:if>
        <xsl:if test="string-length($tablepointsize) &gt; 0">
          <xsl:text> tablePointsize</xsl:text>
          <xsl:value-of select="$tablepointsize" />
        </xsl:if>
        <xsl:if test="$following-has-topdouble = 'true'">
          <xsl:text> topdouble</xsl:text>
        </xsl:if>
        <xsl:if test="parent::table/@frame">
          <xsl:text> </xsl:text>
          <xsl:value-of select="parent::table/@frame" />
        </xsl:if>
      </xsl:variable>
      <xsl:attribute name="class">
        <xsl:value-of select="normalize-space($tableClass)" />
      </xsl:attribute>
      <xsl:apply-templates>
        <xsl:with-param name="current-language" select="$current-language"/>
        <xsl:with-param name="bilingual" select="$bilingual"/>
        <xsl:with-param name="rowbreak" select="$rowbreak"/>

        <xsl:with-param name="all-colspecs">
          <xsl:copy-of select="colspec"/>
        </xsl:with-param>

        <xsl:with-param name="colsep">
          <xsl:choose>
            <xsl:when test="@colsep">
              <xsl:value-of select="@colsep"/>
            </xsl:when>
            <xsl:otherwise>
              <xsl:value-of select="$colsep"/>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:with-param>
        <xsl:with-param name="rowsep">
          <xsl:choose>
            <xsl:when test="@rowsep">
              <xsl:value-of select="@rowsep"/>
            </xsl:when>
            <xsl:otherwise>
              <xsl:value-of select="$rowsep"/>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:with-param>

        <xsl:with-param name="align" select="@align"/>
      </xsl:apply-templates>
    </table>
  </xsl:template>

  <xsl:template match="colspec">
    <xsl:param name="current-language"/>
    <xsl:param name="bilingual"/>
    <col>
      <xsl:choose>
        <!-- All widths are now % based -->
        <xsl:when test="@htmlwidth and @htmlwidth != '' and contains(@htmlwidth,'%')">
          <xsl:attribute name="class">
            <xsl:text>width</xsl:text>
            <xsl:value-of select="substring-before(@htmlwidth, '%')"/>

            <xsl:if test="@align">
              <!--<xsl:attribute name="align">-->
              <xsl:value-of select="@align"/>
              <!--</xsl:attribute>-->
            </xsl:if>

          </xsl:attribute>
        </xsl:when>
      </xsl:choose>
    </col>
  </xsl:template>

  <xsl:template match="tbody">
    <xsl:param name="current-language"/>
    <xsl:param name="bilingual"/>
    <xsl:param name="rowbreak"/>

    <xsl:param name="all-colspecs"/>
    <xsl:param name="colsep"/>
    <xsl:param name="rowsep"/>
    <xsl:param name="align"/>

    <tbody>
      <xsl:apply-templates>
        <xsl:with-param name="current-language">
          <xsl:value-of select="$current-language"/>
        </xsl:with-param>
        <xsl:with-param name="bilingual">
          <xsl:value-of select="$bilingual"/>
        </xsl:with-param>

        <xsl:with-param name="rowbreak" select="$rowbreak"/>
        <xsl:with-param name="all-colspecs" select="$all-colspecs"/>
        <xsl:with-param name="colsep" select="$colsep"/>
        <xsl:with-param name="rowsep" select="$rowsep"/>
        <xsl:with-param name="align" select="$align"/>
        <xsl:with-param name="valign" select="@valign"/>
      </xsl:apply-templates>
    </tbody>
  </xsl:template>

  <xsl:template match="thead">
    <xsl:param name="current-language"/>
    <xsl:param name="bilingual"/>
    <xsl:param name="all-colspecs"/>

    <xsl:param name="rowbreak"/>
    <xsl:param name="colsep"/>
    <xsl:param name="rowsep"/>
    <xsl:param name="align"/>

    <thead>
      <xsl:apply-templates>
        <xsl:with-param name="current-language">
          <xsl:value-of select="$current-language"/>
        </xsl:with-param>
        <xsl:with-param name="bilingual">
          <xsl:value-of select="$bilingual"/>
        </xsl:with-param>

        <xsl:with-param name="rowbreak" select="$rowbreak"/>
        <xsl:with-param name="all-colspecs" select="$all-colspecs"/>
        <xsl:with-param name="colsep" select="$colsep"/>
        <xsl:with-param name="rowsep" select="$rowsep"/>
        <xsl:with-param name="align" select="$align"/>
        <xsl:with-param name="valign" select="@valign"/>
      </xsl:apply-templates>
    </thead>
  </xsl:template>

  <xsl:template match="row">
    <xsl:param name="current-language"/>
    <xsl:param name="bilingual"/>

    <xsl:param name="rowbreak"/>
    <xsl:param name="all-colspecs"/>
    <xsl:param name="colsep"/>
    <xsl:param name="rowsep"/>
    <xsl:param name="align"/>
    <xsl:param name="valign"/>

    <tr>
      <xsl:if test="@topdouble = 'yes'">
        <xsl:attribute name="class">topdouble</xsl:attribute>
      </xsl:if>

      <xsl:if test="@height">
        <xsl:attribute name="style">
          <xsl:text>height:</xsl:text><xsl:value-of select="@height"/>
        </xsl:attribute>
      </xsl:if>

      <!-- Current rowsep -->
      <xsl:variable name="currentRowsep">
        <xsl:choose>
          <!-- if defined on row, use it -->
          <xsl:when test="@rowsep">
            <xsl:value-of select="@rowsep"/>
          </xsl:when>

          <!-- else use whatever's specified above -->
          <xsl:otherwise>
            <xsl:value-of select="$rowsep"/>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:variable>

      <xsl:variable name="num-rows-remaining">
        <!-- If I'm part of the thead, I mustn't forget to count the rows belonging to tbody -->
        <xsl:value-of select="count(following-sibling::row) + count(../following-sibling::tbody/row)"/>
      </xsl:variable>

      <xsl:variable name="new-valign">
        <xsl:choose>
          <xsl:when test="@valign">
            <xsl:value-of select="@valign"/>
          </xsl:when>
          <xsl:otherwise>
            <xsl:value-of select="$valign"/>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:variable>

      <xsl:for-each select="*">
        <xsl:variable name="column-number">
          <xsl:value-of select="position()"/>
        </xsl:variable>

        <!-- Pass down column/row information -->
        <xsl:apply-templates select=".">
          <xsl:with-param name="current-language">
            <xsl:value-of select="$current-language"/>
          </xsl:with-param>
          <xsl:with-param name="bilingual">
            <xsl:value-of select="$bilingual"/>
          </xsl:with-param>
          <xsl:with-param name="num-rows-remaining" select="number($num-rows-remaining)"/>
          <xsl:with-param name="all-colspecs" select="$all-colspecs"/>
          <xsl:with-param name="colsep" select="$colsep"/>
          <xsl:with-param name="rowsep" select="$currentRowsep"/>
          <xsl:with-param name="align" select="$align"/>
          <xsl:with-param name="valign" select="$new-valign"/>
        </xsl:apply-templates>
      </xsl:for-each>
    </tr>
  </xsl:template>

  <!-- MATCHING HEADER ROWS-->
  <xsl:template match="thead/row/entry[. != ''] | entry[@rowheader='yes'] | entry[@th-id]">
    <xsl:param name="current-language"/>
    <xsl:param name="bilingual"/>
    <xsl:param name="num-rows-remaining"/>
    <xsl:param name="all-colspecs"/>
    <xsl:param name="colsep"/>
    <xsl:param name="rowsep"/>
    <xsl:param name="align"/>
    <xsl:param name="valign"/>
    <th>
      <!-- Column Spanning -->
      <xsl:if test="@namest and @nameend and @namest != @nameend">
        <xsl:variable name="namest">
          <xsl:value-of select="@namest"/>
        </xsl:variable>
        <xsl:variable name="nameend">
          <xsl:value-of select="@nameend"/>
        </xsl:variable>

        <!-- count the number of colspecs occuring before the specified start and end columns to figure out which column numbers are referenced -->
        <!-- find the number of columns spanned by counting the number of columns between the two referenced -->
        <xsl:attribute name="colspan">
          <xsl:value-of select="count(exslt:node-set($all-colspecs)/colspec[following-sibling::colspec[@colname = $nameend]
						and preceding-sibling::colspec[@colname = $namest]]) + 2" xmlns:msxsl="urn:schemas-microsoft-com:xslt"/>
        </xsl:attribute>
      </xsl:if>

      <xsl:if test="@id">
        <xsl:attribute name="id">
          <xsl:value-of select="@id"/>
        </xsl:attribute>
      </xsl:if>
      <xsl:if test="@headers">
        <xsl:attribute name="headers">
          <xsl:value-of select="@headers"/>
        </xsl:attribute>
      </xsl:if>

	  <!-- SET SCOPE ATTRIBUTE ON HEADERS IF THERE ARE NO IDS AND HEADERS USED-->
      <xsl:if test="not(@id)">
        <xsl:choose>
          <xsl:when test="@namest and @nameend and @namest != @nameend and ancestor::thead">
            <xsl:attribute name="scope">
              <xsl:text>colgroup</xsl:text>
            </xsl:attribute>
          </xsl:when>
          <xsl:when test="ancestor::thead">
            <xsl:attribute name="scope">
              <xsl:text>col</xsl:text>
            </xsl:attribute>
          </xsl:when>
          <xsl:when test="@morerows and @rowheader='yes'">
            <xsl:attribute name="scope">
              <xsl:text>rowgroup</xsl:text>
            </xsl:attribute>
          </xsl:when>
          <xsl:when test="@rowheader='yes'">
            <xsl:attribute name="scope">
              <xsl:text>row</xsl:text>
            </xsl:attribute>
          </xsl:when>
        </xsl:choose>
      </xsl:if>
	  
      <!-- Row Spanning -->
      <xsl:if test="@morerows">
        <xsl:attribute name="rowspan">
          <xsl:value-of select="number(@morerows) + 1"/>
        </xsl:attribute>
      </xsl:if>

      <!-- Horizontal Alignment -->
      <xsl:variable name="horizontalAlign">
        <xsl:call-template name="setHorizontalAlignment">
          <xsl:with-param name="align" select="$align"/>
          <xsl:with-param name="all-colspecs" select="$all-colspecs"/>
        </xsl:call-template>
      </xsl:variable>
      <!-- Vertical Alignment -->
      <xsl:variable name="verticalAlign">
        <xsl:call-template name="setVerticalAlignment">
          <xsl:with-param name="valign" select="$valign"/>
        </xsl:call-template>
      </xsl:variable>
      <!-- colsep: Vertical Rules -->
      <xsl:variable name="cellBottomBorder">
        <xsl:call-template name="setColsep">
          <xsl:with-param name="colsep" select="$colsep"/>
          <xsl:with-param name="all-colspecs" select="$all-colspecs"/>
        </xsl:call-template>
      </xsl:variable>
      <!-- rowsep: Horizontal Rules -->
      <xsl:variable name="cellRightBorder">
        <xsl:call-template name="setRowsep">
          <xsl:with-param name="rowsep" select="$rowsep"/>
          <xsl:with-param name="num-rows-remaining" select="$num-rows-remaining"/>
          <xsl:with-param name="all-colspecs" select="$all-colspecs"/>
        </xsl:call-template>
      </xsl:variable>

      <xsl:variable name="cellStyle">
        <xsl:if test="string-length($cellBottomBorder) &gt; 0">
          <xsl:value-of select="$cellBottomBorder" />
          <xsl:text> </xsl:text>
        </xsl:if>
        <xsl:if test="string-length($cellRightBorder) &gt; 0">
          <xsl:value-of select="$cellRightBorder" />
          <xsl:text> </xsl:text>
        </xsl:if>

        <xsl:if test="string-length($verticalAlign) &gt; 0">
          <xsl:value-of select="$verticalAlign" />
          <xsl:if test="string-length($horizontalAlign) &gt; 0">
            <xsl:text> </xsl:text>
          </xsl:if>
        </xsl:if>
        <xsl:value-of select="$horizontalAlign" />
      </xsl:variable>

      <xsl:attribute name="class">
        <xsl:value-of select="normalize-space($cellStyle)" />
      </xsl:attribute>

      <xsl:apply-templates/>
    </th>
  </xsl:template>

  <xsl:template match="entry">
    <xsl:param name="current-language"/>
    <xsl:param name="bilingual"/>

    <xsl:param name="num-rows-remaining"/>
    <xsl:param name="all-colspecs"/>
    <xsl:param name="colsep"/>
    <xsl:param name="rowsep"/>
    <xsl:param name="align"/>
    <xsl:param name="valign"/>

    <xsl:if test="@charoff">
      <xsl:message>Warning: CALS charoff attribute is currently not supported</xsl:message>
    </xsl:if>

    <td>

      <!-- Column Spanning -->
      <xsl:if test="@namest and @nameend and @namest != @nameend">
        <xsl:variable name="namest">
          <xsl:value-of select="@namest"/>
        </xsl:variable>
        <xsl:variable name="nameend">
          <xsl:value-of select="@nameend"/>
        </xsl:variable>

        <!-- count the number of colspecs occuring before the specified start and end columns to figure out which column numbers are referenced -->
        <!-- find the number of columns spanned by counting the number of columns between the two referenced -->
        <xsl:attribute name="colspan">
          <xsl:value-of select="count(exslt:node-set($all-colspecs)/colspec[following-sibling::colspec[@colname = $nameend]
						and preceding-sibling::colspec[@colname = $namest]]) + 2" xmlns:msxsl="urn:schemas-microsoft-com:xslt"/>
        </xsl:attribute>
      </xsl:if>

      <xsl:if test="@id">
        <xsl:attribute name="id">
          <xsl:value-of select="@id"/>
        </xsl:attribute>
      </xsl:if>
      <xsl:if test="@headers">
        <xsl:attribute name="headers">
          <xsl:value-of select="@headers"/>
        </xsl:attribute>
      </xsl:if>

      <!-- Row Spanning -->
      <xsl:if test="@morerows">
        <xsl:attribute name="rowspan">
          <xsl:value-of select="number(@morerows) + 1"/>
        </xsl:attribute>
      </xsl:if>

      <!-- Horizontal Alignment -->
      <xsl:variable name="horizontalAlign">
        <xsl:call-template name="setHorizontalAlignment">
          <xsl:with-param name="align" select="$align"/>
          <xsl:with-param name="all-colspecs" select="$all-colspecs"/>
        </xsl:call-template>
      </xsl:variable>

      <!-- Vertical Alignment -->
      <xsl:variable name="verticalAlign">
        <xsl:call-template name="setVerticalAlignment">
          <xsl:with-param name="valign" select="$valign"/>
        </xsl:call-template>
      </xsl:variable>

      <!-- colsep: Vertical Rules -->
      <xsl:variable name="cellBottomBorder">
        <xsl:call-template name="setColsep">
          <xsl:with-param name="colsep" select="$colsep"/>
          <xsl:with-param name="all-colspecs" select="$all-colspecs"/>
        </xsl:call-template>
      </xsl:variable>

      <!-- rowsep: Horizontal Rules -->
      <xsl:variable name="cellRightBorder">
        <xsl:call-template name="setRowsep">
          <xsl:with-param name="rowsep" select="$rowsep"/>
          <xsl:with-param name="num-rows-remaining" select="$num-rows-remaining"/>
          <xsl:with-param name="all-colspecs" select="$all-colspecs"/>
        </xsl:call-template>
      </xsl:variable>
      <xsl:variable name="cellStyle">
        <xsl:if test="string-length($cellBottomBorder) &gt; 0">
          <xsl:value-of select="$cellBottomBorder" />
          <xsl:text> </xsl:text>
        </xsl:if>
        <xsl:if test="string-length($cellRightBorder) &gt; 0">
          <xsl:value-of select="$cellRightBorder" />
          <xsl:text> </xsl:text>
        </xsl:if>

        <xsl:if test="string-length($verticalAlign) &gt; 0">
          <xsl:value-of select="$verticalAlign" />
          <xsl:if test="string-length($horizontalAlign) &gt; 0">
            <xsl:text> </xsl:text>
          </xsl:if>
        </xsl:if>
        <xsl:value-of select="$horizontalAlign" />
      </xsl:variable>

      <xsl:attribute name="class">
        <xsl:value-of select="normalize-space($cellStyle)" />
      </xsl:attribute>

      <xsl:apply-templates/>
    </td>
  </xsl:template>

  <!-- ************************************
	Named Templates
     ************************************ -->
  <!-- Horizontal Alignment -->
  <xsl:template name="setHorizontalAlignment">
    <xsl:param name="align"/>
    <xsl:param name="all-colspecs"/>

    <xsl:variable name="currentColName">
      <xsl:value-of select="@colname"/>
    </xsl:variable>
    <xsl:variable name="currentAlign">
      <xsl:choose>
        <!-- if align is specified for this cell use it -->
        <xsl:when test="@align">
          <xsl:value-of select="@align"/>
        </xsl:when>

        <xsl:when test="@colname and exslt:node-set($all-colspecs)/colspec[@colname = $currentColName]/@align" xmlns:msxsl="urn:schemas-microsoft-com:xslt">
          <xsl:value-of select="exslt:node-set($all-colspecs)/colspec[@colname = $currentColName]/@align" xmlns:msxsl="urn:schemas-microsoft-com:xslt"/>
        </xsl:when>

        <!-- otherwise use what's been passed down -->
        <xsl:otherwise>
          <xsl:value-of select="$align"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>

    <xsl:choose>
      <xsl:when test="$currentAlign = 'char' and string-length(@char) &gt; 0">
        <xsl:value-of select="@char"/>
      </xsl:when>

      <xsl:when test="string-length($currentAlign) &gt; 0">
        <xsl:text>align</xsl:text><xsl:value-of select="$currentAlign"/>
      </xsl:when>
    </xsl:choose>
  </xsl:template>

  <!-- Vertical Alignment -->
  <xsl:template name="setVerticalAlignment">
    <xsl:param name="valign"/>

    <xsl:variable name="current-valign">
      <xsl:choose>
        <xsl:when test="@valign"> <!-- If cell has a specified valign -->
          <xsl:value-of select="@valign"/>
        </xsl:when>
        <xsl:otherwise> <!-- Otherwise use the inherited value -->
          <xsl:value-of select="$valign"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>

    <xsl:value-of select="$current-valign" />

  </xsl:template>

  <xsl:template name="setJustification">
    <xsl:choose>
      <xsl:when test="@justification='center'">
        <xsl:text>Centered</xsl:text>
      </xsl:when>
      <xsl:when test="@justification='left'">
        <xsl:text>FlushLeft</xsl:text>
      </xsl:when>
      <xsl:when test="@justification='right'">
        <xsl:text>FlushRight</xsl:text>
      </xsl:when>
      <xsl:otherwise>
        <xsl:text>FlushLeft</xsl:text>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <!-- rowsep: Horizontal Rules -->
  <xsl:template name="setRowsep">
    <xsl:param name="num-rows-remaining"/>
    <xsl:param name="rowsep"/>
    <xsl:param name="all-colspecs"/>

    <xsl:variable name="morerows">
      <xsl:choose>
        <xsl:when test="@morerows">
          <xsl:value-of select="number(@morerows)"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="number(0)"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>

    <!-- if @morerows equals the number of rows following the one I'm in then I'm part of the last row -->
    <xsl:if test="number($num-rows-remaining) != number($morerows)">
      <!-- determine rowsep of cell -->
      <xsl:variable name="currentColName">
        <xsl:value-of select="@colname"/>
      </xsl:variable>
      <xsl:variable name="currentPos">
        <xsl:value-of select="position()"/>
      </xsl:variable>
      <xsl:variable name="currentRowsep">
        <xsl:choose>
          <!-- if specified for this cell use it -->
          <xsl:when test="@rowsep">
            <xsl:value-of select="@rowsep"/>
          </xsl:when>
          <!-- if a column name is specified, check to see if colsep is set -->
          <xsl:when test="@colname and exslt:node-set($all-colspecs)/colspec[@colname = $currentColName]/@rowsep" xmlns:msxsl="urn:schemas-microsoft-com:xslt">
            <xsl:value-of select="exslt:node-set($all-colspecs)/colspec[@colname = $currentColName]/@rowsep" xmlns:msxsl="urn:schemas-microsoft-com:xslt"/>
          </xsl:when>
          <!-- even if a column name isn't specified, check to see if colsep is set on corresponding colspec -->
          <xsl:when test="exslt:node-set($all-colspecs)/colspec[$currentPos]/@rowsep" xmlns:msxsl="urn:schemas-microsoft-com:xslt">
            <xsl:value-of select="exslt:node-set($all-colspecs)/colspec[$currentPos]/@rowsep" xmlns:msxsl="urn:schemas-microsoft-com:xslt"/>
          </xsl:when>
          <!-- otherwise use whatever's been passed down -->
          <xsl:when test="string-length($rowsep) &gt; 0">
            <xsl:value-of select="$rowsep"/>
          </xsl:when>

          <!-- Default value: off -->
          <xsl:otherwise>1</xsl:otherwise>
        </xsl:choose>
      </xsl:variable>
      <xsl:if test="number($currentRowsep) = 0 ">noBorderBottom</xsl:if>
      <xsl:if test="number($currentRowsep) = 1 ">borderBottom</xsl:if>
    </xsl:if>
  </xsl:template>
  <!-- colsep: Vertical Rules -->
  <xsl:template name="setColsep">
    <xsl:param name="colsep"/>
    <xsl:param name="all-colspecs"/>

    <!-- if there are no entry following me, then I'm the last column so ignore me -->
    <xsl:if test="following-sibling::entry">
      <!-- determine colsep of cell -->
      <xsl:variable name="currentColName">
        <xsl:value-of select="@colname"/>
      </xsl:variable>
      <xsl:variable name="currentPos">
        <xsl:value-of select="position()"/>
      </xsl:variable>
      <xsl:variable name="currentColsep">
        <xsl:choose>
          <!-- if specified for this cell use it -->
          <xsl:when test="@colsep">
            <xsl:value-of select="number(@colsep)"/>
          </xsl:when>
          <!-- if a column name is specified, check to see if colsep is set -->
          <xsl:when test="@colname and exslt:node-set($all-colspecs)/colspec[@colname = $currentColName]/@colsep" xmlns:msxsl="urn:schemas-microsoft-com:xslt">
            <xsl:value-of select="exslt:node-set($all-colspecs)/colspec[@colname = $currentColName]/@colsep" xmlns:msxsl="urn:schemas-microsoft-com:xslt"/>
          </xsl:when>
          <!-- even if a column name isn't specified, check to see if colsep is set on corresponding colspec -->
          <xsl:when test="exslt:node-set($all-colspecs)/colspec[$currentPos]/@colsep" xmlns:msxsl="urn:schemas-microsoft-com:xslt">
            <xsl:value-of select="exslt:node-set($all-colspecs)/colspec[$currentPos]/@colsep" xmlns:msxsl="urn:schemas-microsoft-com:xslt"/>
          </xsl:when>
          <!-- otherwise use whatever's been passed down -->
          <xsl:when test="string-length($colsep) &gt; 0">
            <xsl:value-of select="$colsep"/>
          </xsl:when>
          <!-- Default value: off -->
          <xsl:otherwise>1</xsl:otherwise>
        </xsl:choose>
      </xsl:variable>
      <xsl:if test="number($currentColsep) != 0">borderRight</xsl:if>
      <xsl:if test="number($currentColsep) = 0 ">noBorderRight</xsl:if>
    </xsl:if>
  </xsl:template>

  <!-- for footnotes in tables we will put hidden text on the link to associate the label to the table caption or title-->
  <xsl:template match="TableGroup//FootnoteRef[not(ancestor::Caption) and not(ancestor::title)]">
    <xsl:choose>
      <xsl:when test="@idref">
        <a>
          <xsl:attribute name="href">
            <xsl:text>#</xsl:text>
            <xsl:value-of select="@idref" />
          </xsl:attribute>
          <xsl:attribute name="id">
            <xsl:value-of select="@idref" />
            <xsl:text>-</xsl:text>
            <xsl:value-of select="generate-id()" />
          </xsl:attribute>
          <xsl:choose>
            <xsl:when test="$language='fr'">
              <span class="wb-invisible">
                <!-- Do not copy the caption and title for bilingual tables - Hopefully we dont have biling tables with repeated footnote labels -->
                <xsl:text>Note de </xsl:text>
                <xsl:value-of select="ancestor::TableGroup/Caption/text()" />
                <xsl:text> </xsl:text>
                <xsl:value-of select="ancestor::TableGroup/table/title/text()" />
              </span>
            </xsl:when>
            <xsl:otherwise>
              <span class="wb-invisible">
                <xsl:text>Footnote for </xsl:text>
                <xsl:value-of select="ancestor::TableGroup/Caption/text()" />
                <xsl:text> </xsl:text>
                <xsl:value-of select="ancestor::TableGroup/table/title/text()" />
              </span>
            </xsl:otherwise>
          </xsl:choose>
          <sup>
            <xsl:apply-templates />
          </sup>
        </a>
      </xsl:when>
      <xsl:otherwise>
        <sup>
          <xsl:apply-templates />
        </sup>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <!-- END OF THE TABLE TRANSFORM -->

  <xsl:template match="SignatureBlock">
    <xsl:apply-templates />
  </xsl:template>

  <xsl:template match="SignatureLine | SignatureName | SignatureTitle">
    <div>
      <xsl:attribute name="class">
        <xsl:call-template name="setJustification" />
      </xsl:attribute>
      <xsl:apply-templates />
    </div>
  </xsl:template>

  <xsl:template match="FormGroup | Body">
    <xsl:apply-templates />
  </xsl:template>

  <xsl:template match="Sup">
    <sup>
      <xsl:apply-templates />
    </sup>
  </xsl:template>

  <xsl:template match="Sub">
    <sub>
      <xsl:apply-templates />
    </sub>
  </xsl:template>

  <xsl:template match="FootnoteRef">
    <xsl:choose>
      <xsl:when test="@idref">
        <a>
          <xsl:attribute name="href">
            <xsl:text>#</xsl:text>
            <xsl:value-of select="@idref" />
          </xsl:attribute>
          <xsl:attribute name="id">
            <xsl:value-of select="@idref" />-<xsl:value-of select="generate-id()" />
          </xsl:attribute>
          <xsl:choose>
            <xsl:when test="$language='fr'">
              <span class="wb-invisible">Note de bas de page </span>
            </xsl:when>
            <xsl:otherwise>
              <span class="wb-invisible">Footnote </span>
            </xsl:otherwise>
          </xsl:choose>
          <sup>
            <xsl:apply-templates />
          </sup>
        </a>
      </xsl:when>
      <xsl:otherwise>
        <sup>
          <xsl:apply-templates />
        </sup>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="Footnote">
    <xsl:choose>
      <xsl:when test="preceding-sibling::*[1][self::Footnote]">
        <!-- It's not the first; so it has already been pulled in.  We'll do nothing here. -->
      </xsl:when>
      <xsl:otherwise>
        <!-- It's the first of this group; we'll start a new list:  -->
        <ul class="ProvisionList">
          <li>
            <xsl:variable name="thisid" select="@id" />
            <div class="Footnote">
              <p class="Footnote">
                <xsl:choose>
                  <xsl:when test="@id"> <!-- if id is empty dont create a back link -->
                    <a href="#{$thisid}-{generate-id(//FootnoteRef[@idref=$thisid][1])}">
                      <xsl:attribute name="id">
                        <xsl:value-of select="@id" />
                      </xsl:attribute>
                      <xsl:choose>
                        <xsl:when test="$language='fr'">
                          <span class="wb-invisible">Retour à la référence de la note de bas de page </span>
                        </xsl:when>
                        <xsl:otherwise>
                          <span class="wb-invisible">Return to footnote </span>
                        </xsl:otherwise>
                      </xsl:choose>
                      <sup>
                        <xsl:value-of select="Label" />
                      </sup>
                    </a>
                  </xsl:when>
                  <xsl:otherwise>
                    <sup><xsl:value-of select="Label" /></sup>
                  </xsl:otherwise>
                </xsl:choose>
                <xsl:apply-templates select="Text" />
              </p>
              <xsl:apply-templates select="*[not(self::Label or self::Text)]" />
            </div>
          </li>
          <!-- Get the next Provision list-item, if there is one-->
          <xsl:apply-templates select="following-sibling::*[1][self::Footnote]" mode="inside-list"/>
        </ul>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  <xsl:template match="Footnote" mode="inside-list">
    <!-- Put this paragraph into the <li> tag:  -->
    <li>
      <xsl:variable name="thisid" select="@id" />
      <div class="Footnote">
        <p class="Footnote">
          <xsl:choose>
            <xsl:when test="@id">
              <!-- if id is empty dont create a back link -->
              <a href="#{$thisid}-{generate-id(//FootnoteRef[@idref=$thisid][1])}">
                <xsl:attribute name="id">
                  <xsl:value-of select="@id" />
                </xsl:attribute>
                <xsl:choose>
                  <xsl:when test="$language='fr'">
                    <span class="wb-invisible">Retour à la référence de la note de bas de page </span>
                  </xsl:when>
                  <xsl:otherwise>
                    <span class="wb-invisible">Return to footnote </span>
                  </xsl:otherwise>
                </xsl:choose>
                <sup>
                  <xsl:value-of select="Label" />
                </sup>
              </a>
            </xsl:when>
            <xsl:otherwise>
              <sup><xsl:value-of select="Label" /></sup>
            </xsl:otherwise>
          </xsl:choose>
          <xsl:apply-templates select="Text" />
        </p>
        <xsl:apply-templates select="*[not(self::Label or self::Text)]" />
      </div>
    </li>
    <!-- Get the next Provision list-item, if there is one -->
    <xsl:apply-templates select="following-sibling::*[1][self::Footnote]" mode="inside-list"/>
  </xsl:template>


  <!-- Leader, short border: Used as a place holder for a blank image. These are mainly used in forms as blank lines.-->
  <xsl:template match="Leader">
    <xsl:variable name="altText">
      <xsl:choose>
        <xsl:when test="$language='fr'">line blanc</xsl:when>
        <xsl:otherwise>blank line</xsl:otherwise>
      </xsl:choose>
    </xsl:variable>


    <xsl:choose>
      <xsl:when test="@leader='solid'">
        <img class="Leader-solid" src="img/ii_spacer.gif" alt="{$altText}">
          <xsl:apply-templates />
        </img>
      </xsl:when>
      <xsl:when test="@leader='dash'">
        <img class="Leader-dash" src="img/ii_spacer.gif" alt="{$altText}">
          <xsl:apply-templates />
        </img>
      </xsl:when>
      <xsl:when test="@leader='dot'">
        <img class="Leader-dot" src="img/ii_spacer.gif" alt="{$altText}">
          <xsl:apply-templates />
        </img>
      </xsl:when>
      <xsl:otherwise>
        <img class="Leader" src="img/ii_spacer.gif" alt="{$altText}">
          <xsl:apply-templates />
        </img>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <!-- LeaderRightJustified, long border: Used as a place holder for a blank image. These are mainly used in forms as blank lines.-->
  <xsl:template match="LeaderRightJustified">
    <xsl:variable name="altText">
      <xsl:choose>
        <xsl:when test="$language='fr'">line blanc</xsl:when>
        <xsl:otherwise>blank line</xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:choose>
      <xsl:when test="@leader='solid'">
        <img class="LeaderRightJustified-solid" src="img/ii_spacer.gif" alt="{$altText}">
          <xsl:apply-templates />
        </img>
      </xsl:when>
      <xsl:when test="@leader='dash'">
        <img class="LeaderRightJustified-dash" src="img/ii_spacer.gif" alt="{$altText}">
          <xsl:apply-templates />
        </img>
      </xsl:when>
      <xsl:when test="@leader='dot'">
        <img class="LeaderRightJustified-dot" src="img/ii_spacer.gif" alt="{$altText}">
          <xsl:apply-templates />
        </img>
      </xsl:when>
      <xsl:otherwise>
        <img class="LeaderRightJustified" src="img/ii_spacer.gif" alt="{$altText}">
          <xsl:apply-templates />
        </img>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="LongTitle[ancestor::Schedule]">
    <p class="LongTitle">
      <xsl:apply-templates />
    </p>
  </xsl:template>

  <xsl:template match="Group1-Part|Group2-Division|Group3-Subdivision|Group4">
    <xsl:apply-templates />
  </xsl:template>

  <xsl:template match="Separator">
    <xsl:apply-templates />
  </xsl:template>

  <xsl:template match="AlternateText">
    <xsl:choose>
      <xsl:when test="parent::ImageGroup"><!-- Images alt is handled in Image match-->
      </xsl:when>
      <xsl:otherwise>
        <div class="AlternateText">
          <xsl:apply-templates />
        </div>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="Enacts">
    <div class="Enacts">
      <xsl:apply-templates />
    </div>
  </xsl:template>

  <xsl:template match="BillInternal">
    <div class="BillInternal">
      <xsl:apply-templates />
    </div>
  </xsl:template>

  <xsl:template match="*">
    <xsl:apply-templates />
  </xsl:template>

  <xsl:template match="DefinitionRef">
    <span class="DefinitionRef">
      <dfn>
        <xsl:apply-templates />
      </dfn>
    </span>
  </xsl:template>
  
  <xsl:template name="generate-heading-id">
    <!-- ONLY FOR CONSOLIDATION SYSTEM WEB PAGES
	<xsl:attribute name="id">
      <xsl:text>h-</xsl:text>
      <xsl:choose>
        <xsl:when test="@lims:fid">
          <xsl:value-of select="@lims:fid" />
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="$heading-count" />
        </xsl:otherwise>
      </xsl:choose>
    </xsl:attribute> -->
  </xsl:template>
</xsl:stylesheet>

