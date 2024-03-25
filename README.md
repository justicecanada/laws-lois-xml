# laws-lois-xml - [Aller en français](https://github.com/justicecanada/laws-lois-xml?tab=readme-ov-file#laws-lois-xml---fran%C3%A7ais)
The consolidated Acts and regulations of Canada.

For information describing some of the XML elements, visit "[Data Dictionary](https://laws-lois.justice.gc.ca/eng/XML/index.html)".

## Structure of Elements
The following will outline examples of the XML structure for Acts and Regulations.

> [!NOTE]
> The XML content displayed here are only examples and should not be used as a full reference.
>
> The full and updated XML should be referenced within the repository. For more information on laws, visit the [Justice Laws Website](https://laws-lois.justice.gc.ca/)

> [!WARNING]
> In the examples shown, if  a "..." is seen. This mean that the content had to be cut due to it's length or complexity.
> 
> All tables are not shown due to this reason.

### Acts
Generally, an Act will have the following structure:

#### [Access to Information Act (R.S.C., 1985, c. A-1)](https://laws-lois.justice.gc.ca/eng/acts/A-1/index.html)
```xml
<?xml version="1.0" encoding="utf-8"?>
<Statute lims:pit-date="2024-01-22" hasPreviousVersion="true" lims:lastAmendedDate="2024-01-22" lims:current-date="2024-01-23" lims:inforce-start-date="2018-12-13" lims:fid="167" lims:id="167" bill-origin="commons" bill-type="govt-public" in-force="yes" xml:lang="en" xmlns:lims="http://justice.gc.ca/lims">
    <Identification lims:inforce-start-date="2018-12-13" lims:fid="168" lims:id="168">
        <LongTitle lims:inforce-start-date="2019-06-21" lims:enacted-date="2019-06-21" lims:fid="169" lims:id="1171136">An Act to extend the present laws of Canada that provide access to information under the control of the Government of Canada and to provide for the proactive publication of certain information</LongTitle>
        <ShortTitle lims:inforce-start-date="2018-12-13" lims:fid="170" lims:id="170" status="official">Access to Information Act</ShortTitle>
        <RunningHead lims:inforce-start-date="2018-12-13" lims:fid="171" lims:id="171">Access to Information</RunningHead>
        <BillHistory lims:inforce-start-date="2018-12-13" lims:fid="172" lims:id="172">
            <Stages lims:inforce-start-date="2018-12-13" stage="consolidation">
                <Date>
                    <YYYY>2024</YYYY>
                    <MM>1</MM>
                    <DD>24</DD>
                </Date>
            </Stages>
        </BillHistory>
        <Chapter lims:inforce-start-date="2018-12-13" lims:fid="174" lims:id="174">
            <ConsolidatedNumber official="yes">A-1</ConsolidatedNumber>
        </Chapter>
    </Identification>
    <Body lims:inforce-start-date="2018-12-13" lims:fid="175" lims:id="175">
        <Heading lims:inforce-start-date="2018-12-13" lims:fid="176" lims:id="176" level="1">
            <TitleText>Short Title</TitleText>
        </Heading>
        <Section lims:inforce-start-date="2002-12-31" lims:lastAmendedDate="2002-12-31" lims:fid="177" lims:id="177">
            <MarginalNote lims:inforce-start-date="2002-12-31" lims:fid="178" lims:id="178">Short title</MarginalNote>
            <Label>1</Label>
            <Text>This Act may be cited as the
                <XRefExternal reference-type="act" link="A-1">Access to Information Act</XRefExternal>.
            </Text>
            <HistoricalNote>
                <HistoricalNoteSubItem lims:inforce-start-date="2002-12-31" lims:fid="180" lims:id="180">1980-81-82-83, c. 111, Sch. I “1”</HistoricalNoteSubItem>
            </HistoricalNote>
        </Section>
        <Heading lims:inforce-start-date="2018-12-13" lims:fid="181" lims:id="181" level="1">
            <TitleText>Purpose of Act</TitleText>
        </Heading>
        <Section lims:inforce-start-date="2019-06-21" lims:enacted-date="2019-06-21" lims:lastAmendedDate="2019-06-21" lims:fid="182" lims:id="1171637">
            <MarginalNote lims:inforce-start-date="2019-06-21" lims:enacted-date="2019-06-21" lims:fid="1171638" lims:id="1171638">Purpose of Act</MarginalNote>
            <Label>2</Label>
            <Subsection lims:inforce-start-date="2019-06-21" lims:enacted-date="2019-06-21" lims:fid="1171639" lims:id="1171639">
                <Label>(1)</Label>
                <Text>The purpose of this Act is to enhance the accountability...</Text>
            </Subsection>
            <Subsection lims:inforce-start-date="2019-06-21" lims:enacted-date="2019-06-21" lims:fid="1171640" lims:id="1171640">
                <MarginalNote lims:inforce-start-date="2019-06-21" lims:enacted-date="2019-06-21" lims:fid="1171641" lims:id="1171641">Specific purposes of Parts 1 and 2</MarginalNote>
                <Label>(2)</Label>
                <Text>In furtherance of that purpose,</Text>
                <Paragraph lims:inforce-start-date="2019-06-21" lims:enacted-date="2019-06-21" lims:fid="1171642" lims:id="1171642">
                    <Label>(a)</Label>
                    <Text>Part 1 extends the present laws of Canada to provide...</Text>
                </Paragraph>
                <Paragraph lims:inforce-start-date="2019-06-21" lims:enacted-date="2019-06-21" lims:fid="1171643" lims:id="1171643">
                    <Label>(b)</Label>
                    <Text>Part 2 sets out requirements for the proactive...</Text>
                </Paragraph>
            </Subsection>
            <Subsection lims:inforce-start-date="2019-06-21" lims:enacted-date="2019-06-21" lims:fid="1171644" lims:id="1171644">
                <MarginalNote lims:inforce-start-date="2019-06-21" lims:enacted-date="2019-06-21" lims:fid="1171645" lims:id="1171645">Complementary procedures</MarginalNote>
                <Label>(3)</Label>
                <Text>This Act is also intended to complement and not replace...</Text>
            </Subsection>
            <HistoricalNote>
                <HistoricalNoteSubItem lims:inforce-start-date="2019-06-21" lims:enacted-date="2019-06-21" lims:fid="188" lims:id="1171646" lims:enactId="1150199" type="original">R.S., 1985, c. A-1, s. 2</HistoricalNoteSubItem>
                <HistoricalNoteSubItem lims:inforce-start-date="2019-06-21" lims:enacted-date="2019-06-21" lims:fid="1171647" lims:id="1171647" lims:enactId="1150199">2019, c. 18, s. 2</HistoricalNoteSubItem>
            </HistoricalNote>
        </Section>
        <Heading lims:inforce-start-date="2018-12-13" lims:fid="189" lims:id="189" level="1">
            <TitleText>Interpretation</TitleText>
        </Heading>
        <Section lims:inforce-start-date="2007-09-01" lims:lastAmendedDate="2019-06-21" lims:fid="190" lims:id="190">
            <MarginalNote lims:inforce-start-date="2007-09-01" lims:fid="191" lims:id="191">Definitions</MarginalNote>
            <Label>3</Label>
            <Text>In this Act,</Text>
            <Definition lims:inforce-start-date="2007-09-01" lims:fid="192" lims:id="192">
                <Text><DefinedTermEn>alternative format</DefinedTermEn>, with respect to a record, means... (<DefinedTermFr>support de substitution</DefinedTermFr>)</Text>
            </Definition>
            <HistoricalNote>
                <HistoricalNoteSubItem lims:inforce-start-date="2007-09-01" lims:fid="207" lims:id="207">R.S., 1985, c. A-1, s. 3; 1992, c. 21, s. 1; 2002, c. 8, s. 183; 2006, c. 9, s. 141</HistoricalNoteSubItem>
                <HistoricalNoteSubItem lims:inforce-start-date="2019-06-21" lims:enacted-date="2019-06-21" lims:fid="1171654" lims:id="1171654" lims:enactId="1150201">2019, c. 18, s. 3</HistoricalNoteSubItem>
            </HistoricalNote>
        </Section>
    </Body>
    <Schedule lims:inforce-start-date="2018-11-05" lims:lastAmendedDate="2024-01-22" lims:fid="1229" lims:id="1229" bilingual="no" spanlanguages="yes">
        <ScheduleFormHeading lims:inforce-start-date="2018-11-05" lims:fid="1230" lims:id="1230">
            <Label>SCHEDULE II</Label>
            <OriginatingRef>(Section 24)</OriginatingRef>
        </ScheduleFormHeading>
        <TableGroup lims:inforce-start-date="2018-11-05" lims:fid="1231" lims:id="1231" pointsize="9" topmarginspacing="10" rowbreak="no" bilingual="no" spanlanguages="no">
            <table lims:inforce-start-date="2018-11-05" lims:fid="1232" lims:id="1232" colsep="0" frame="topbot" rowsep="0">...
			</table>
        </TableGroup>
        <HistoricalNote>
            <HistoricalNoteSubItem lims:inforce-start-date="2019-06-18" lims:enacted-date="2014-12-09" lims:fid="1146092" lims:id="1146137" lims:enactId="1035379">R.S., 1985, c. A-1, Sch. II; R.S., 1985, c. 28 (1st Supp.)</HistoricalNoteSubItem>
            <HistoricalNoteSubItem lims:inforce-start-date="2019-06-21" lims:enacted-date="2019-06-21" lims:fid="1171131" lims:id="1171131" lims:enactId="1149587">2019, c. 14, s. 54</HistoricalNoteSubItem>
        </HistoricalNote>
    </Schedule>
    <RecentAmendments>
        <Amendment>
            <AmendmentCitation link="2023_29">2023, c. 29</AmendmentCitation>
            <AmendmentDate>2024-01-22</AmendmentDate>
        </Amendment>
        <Amendment>
            <AmendmentCitation link="2023_22">2023, c. 22</AmendmentCitation>
            <AmendmentDate>2023-09-01</AmendmentDate>
        </Amendment>
    </RecentAmendments>
</Statute>
```
### Regulations
Generally, a Regulation will have the following structure:

#### [Food and Drug Regulations (C.R.C., c. 870)](https://laws-lois.justice.gc.ca/eng/regulations/C.R.C.,_c._870/index.html)
```xml
<?xml version="1.0" encoding="utf-8"?>
<Regulation lims:pit-date="2023-11-24" hasPreviousVersion="true" lims:lastAmendedDate="2023-11-24" lims:current-date="2023-11-27" lims:inforce-start-date="2018-10-23" lims:fid="567721" lims:id="567721" regulation-type="SOR" xml:lang="en" xmlns:lims="http://justice.gc.ca/lims">
    <Identification lims:inforce-start-date="2018-10-23" lims:fid="567722" lims:id="567722">
        <InstrumentNumber>C.R.C., c. 870</InstrumentNumber>
        <ConsolidationDate lims:inforce-start-date="2018-10-23">
            <Date>
                <YYYY>2023</YYYY>
                <MM>11</MM>
                <DD>28</DD>
            </Date>
        </ConsolidationDate>
        <EnablingAuthority lims:inforce-start-date="2018-10-23" lims:fid="567724" lims:id="567724">
            <XRefExternal reference-type="act" link="F-27">FOOD AND DRUGS ACT</XRefExternal>
        </EnablingAuthority>
        <ShortTitle lims:inforce-start-date="2018-10-23" lims:fid="567725" lims:id="567725">Food and Drug Regulations</ShortTitle>
        <LongTitle lims:inforce-start-date="2018-10-23" lims:fid="567726" lims:id="567726">Regulations Respecting Food and Drugs</LongTitle>
    </Identification>
    <Body lims:inforce-start-date="2018-10-23" lims:fid="567727" lims:id="567727">
        <Heading lims:inforce-start-date="2018-10-23" lims:fid="567728" lims:id="567728" level="1">
            <Label>PART A</Label>
            <TitleText>Administration</TitleText>
        </Heading>
        <Heading lims:inforce-start-date="2018-10-23" lims:fid="567729" lims:id="567729" level="2">
            <TitleText>General</TitleText>
        </Heading>
        <Section lims:inforce-start-date="2006-03-22" lims:lastAmendedDate="2006-03-22" lims:fid="567730" lims:id="567730">
            <Label>A.01.001</Label>
            <Text>These Regulations may be cited as the <XRefExternal reference-type="regulation" link="C.R.C.,_c._870">Food and Drug Regulations</XRefExternal>.</Text>
        </Section>
        <Section lims:inforce-start-date="2006-03-22" lims:lastAmendedDate="2006-03-22" lims:fid="567731" lims:id="567731">
            <Label>A.01.002</Label>
            <Text>These Regulations, where applicable...</Text>
        </Section>
        <Section lims:inforce-start-date="2006-03-22" lims:lastAmendedDate="2006-03-22" lims:fid="567732" lims:id="567732">
            <Label>A.01.003</Label>
            <Text>
                <Repealed>[Repealed, SOR/94-289, s. 1]</Repealed>
            </Text>
        </Section>
        <Heading lims:inforce-start-date="2018-10-23" lims:fid="567733" lims:id="567733" level="2">
            <TitleText>Interpretation</TitleText>
        </Heading>
        <Section lims:inforce-start-date="2018-04-04" lims:lastAmendedDate="2022-09-27" lims:fid="567734" lims:id="567734">
            <Label>A.01.010</Label>
            <Text>In these Regulations,</Text>
            <Definition lims:inforce-start-date="2018-04-04" lims:fid="567735" lims:id="567735" generate-in-text="no">
                <Text><DefinedTermEn>acceptable method</DefinedTermEn> means a method of analysis or examination..,(<DefinedTermFr>méthode acceptable</DefinedTermFr>)</Text>
            </Definition>
            <Definition lims:inforce-start-date="2018-04-04" lims:fid="567736" lims:id="567736" generate-in-text="no">
                <Text><DefinedTermEn>Act</DefinedTermEn> means the <XRefExternal reference-type="act" link="F-27">Food and Drugs Act</XRefExternal>, except in Parts G and J;(<DefinedTermFr>Loi</DefinedTermFr>)</Text>
            </Definition>
            <HistoricalNote>
                <HistoricalNoteSubItem lims:inforce-start-date="2018-04-04" lims:fid="567751" lims:id="567751">SOR/84-300, s. 1(F); SOR/85-141, s. 1;</HistoricalNoteSubItem>
                <HistoricalNoteSubItem lims:inforce-start-date="2022-09-27" lims:enacted-date="2022-09-27" lims:fid="1376789" lims:id="1376789" lims:enactId="1375613">SOR/2022-197, s. 1
                </HistoricalNteSubItem>
            </HistoricalNote>
        </Section>
    </Body>
    <Schedule lims:inforce-start-date="2022-07-20" lims:enacted-date="2022-06-28" lims:lastAmendedDate="2022-07-20" lims:fid="1371609" lims:id="1371609">
        <ScheduleFormHeading lims:inforce-start-date="2022-07-20" lims:enacted-date="2022-06-28" lims:fid="1371610" lims:id="1371610">
            <Label>SCHEDULE K.1</Label>
            <OriginatingRef>(Subsections B.01.350(1) and B.01.351(1) and (5))</OriginatingRef>
        </ScheduleFormHeading>
        <Heading lims:inforce-start-date="2022-07-20" lims:enacted-date="2022-06-28" lims:fid="1371611" lims:id="1371611" level="1">
            <TitleText>Nutrition Symbols and Formats</TitleText>
        </Heading>
        <Heading lims:inforce-start-date="2022-07-20" lims:enacted-date="2022-06-28" lims:fid="1371612" lims:id="1371612" level="2">
            <TitleText>Unilingual Horizontal Format</TitleText>
        </Heading>
        <TableGroup lims:inforce-start-date="2022-07-20" lims:enacted-date="2022-06-28" lims:fid="1371613" lims:id="1371613" bilingual="no" pointsize="8" spanlanguages="no" topmarginspacing="10">
            <table lims:inforce-start-date="2022-07-20" lims:enacted-date="2022-06-28" lims:fid="1371614" lims:id="1371614" frame="none">...
            </Table>
        </TableGroup>
    </Schedule>
    <RecentAmendments>
        <Amendment>
            <AmendmentCitation>SOR/2023-247</AmendmentCitation>
            <AmendmentDate>2023-11-24</AmendmentDate>
        </Amendment>
        <Amendment>
            <AmendmentCitation>SOR/2023-18</AmendmentCitation>
            <AmendmentDate>2023-02-15</AmendmentDate>
        </Amendment>
    </RecentAmendments>
</Regulation>
```
#### [Federal Child Support Guidelines (SOR/97-175)](https://laws-lois.justice.gc.ca/eng/regulations/SOR-97-175/index.html)
```xml
<?xml version="1.0" encoding="utf-8"?>
<Regulation lims:pit-date="2024-02-01" hasPreviousVersion="true" lims:lastAmendedDate="2024-02-01" lims:current-date="2024-02-06" lims:inforce-start-date="2006-03-22" lims:fid="1004143" lims:id="1004143" regulation-type="SOR" xml:lang="en" xmlns:lims="http://justice.gc.ca/lims">
    <Identification lims:inforce-start-date="2006-03-22" lims:fid="1004144" lims:id="1004144">
        <InstrumentNumber>SOR/97-175</InstrumentNumber>
        <RegistrationDate>
            <Date>
                <YYYY>1997</YYYY>
                <MM>4</MM>
                <DD>8</DD>
            </Date>
        </RegistrationDate>
        <ConsolidationDate lims:inforce-start-date="2006-03-22">
            <Date>
                <YYYY>2024</YYYY>
                <MM>2</MM>
                <DD>7</DD>
            </Date>
        </ConsolidationDate>
        <EnablingAuthority lims:inforce-start-date="2006-03-22" lims:fid="1004146" lims:id="1004146">
            <XRefExternal reference-type="act" link="D-3.4">DIVORCE ACT</XRefExternal>
        </EnablingAuthority>
        <LongTitle lims:inforce-start-date="2006-03-22" lims:fid="1004147" lims:id="1004147">Federal Child Support Guidelines</LongTitle>
        <RegulationMakerOrder>
            <RegulationMaker>P.C.</RegulationMaker>
            <OrderNumber>1997-469</OrderNumber>
            <Date>
                <YYYY>1997</YYYY>
                <MM>4</MM>
                <DD>8</DD>
            </Date>
        </RegulationMakerOrder>
    </Identification>
    <Order lims:inforce-start-date="2006-03-22" lims:fid="1004148" lims:id="1004148">
        <Provision lims:inforce-start-date="2006-03-22" lims:fid="1004149" lims:id="1004149" format-ref="indent-0-0" language-align="yes" list-item="no">
            <Text>His Excellency the Governor General in Council...<FootnoteRef idref="footnotea_e">a</FootnoteRef> of the <XRefExternal reference-type="act" link="D-3.4">Divorce Act</XRefExternal><FootnoteRef idref="footnoteb_e">b</FootnoteRef>, hereby establishes the annexed <XRefExternal reference-type="regulation" link="SOR-97-175">Federal Child Support Guidelines</XRefExternal>.
            </Text>
            <Footnote id="footnotea_e" placement="page" status="official">
                <Label>a</Label>
                <Text>S.C. 1997, c. 1, s. 11</Text>
            </Footnote>
            <Footnote id="footnoteb_e" placement="page" status="official">
                <Label>b</Label>
                <Text>R.S., c. 3 (2nd Supp.)</Text>
            </Footnote>
        </Provision>
    </Order>
    <Body lims:inforce-start-date="2006-03-22" lims:fid="1004150" lims:id="1004150">
        <Heading lims:inforce-start-date="2006-03-22" lims:fid="1004151" lims:id="1004151" level="1">
            <TitleText>Objectives</TitleText>
        </Heading>
        <Section lims:inforce-start-date="2006-03-22" lims:lastAmendedDate="2006-03-22" lims:fid="1004152" lims:id="1004152">
            <MarginalNote lims:inforce-start-date="2006-03-22" lims:fid="1004153" lims:id="1004153">Objectives</MarginalNote>
            <Label>1</Label>
            <Text>The objectives of these Guidelines are</Text>
            <Paragraph lims:inforce-start-date="2006-03-22" lims:fid="1004154" lims:id="1004154">
                <Label>(a)</Label>
                <Text>to establish a fair standard of support for children that...</Text>
            </Paragraph>
            <Paragraph lims:inforce-start-date="2006-03-22" lims:fid="1004155" lims:id="1004155">
                <Label>(b)</Label>
                <Text>to reduce conflict and tension between spouses by making...</Text>
            </Paragraph>
        </Section>
    </Body>
    <Schedule lims:inforce-start-date="2009-06-11" lims:lastAmendedDate="2009-06-11" lims:fid="1004937" lims:id="1004937" bilingual="no" spanlanguages="no">
        <ScheduleFormHeading lims:inforce-start-date="2009-06-11" lims:fid="1004938" lims:id="1004938">
            <Label>SCHEDULE III</Label>
            <OriginatingRef>(Section 16)</OriginatingRef>
            <TitleText>Adjustments to Income</TitleText>
        </ScheduleFormHeading>
        <RegulationPiece lims:inforce-start-date="2009-06-11" lims:fid="1004939" lims:id="1004939">
            <Section lims:inforce-start-date="2009-06-11" lims:lastAmendedDate="2009-06-11" lims:fid="1004940" lims:id="1004940">
                <MarginalNote lims:inforce-start-date="2009-06-11" lims:fid="1004941" lims:id="1004941">Employment expenses</MarginalNote>
                <Label>1</Label>
                <Text>Where the spouse is an employee, the spouse’s applicable employment expenses described in the following provisions of the <XRefExternal reference-type="act" link="I-3.3">Income Tax Act</XRefExternal> are deducted:</Text>
                <Paragraph lims:inforce-start-date="2009-06-11" lims:fid="1004942" lims:id="1004942">
                    <Label>(a)</Label>
                    <Text>
                        <Repealed>[Repealed, SOR/2000-337, s. 8]</Repealed>
                    </Text>
                </Paragraph>
                <Paragraph lims:inforce-start-date="2009-06-11" lims:fid="1004943" lims:id="1004943">
                    <Label>(b)</Label>
                    <Text>paragraph 8(1)(d) concerning expenses of teacher’s exchange fund contribution;</Text>
                </Paragraph>
            </Section>
            <Section lims:inforce-start-date="2009-06-11" lims:lastAmendedDate="2009-06-11" lims:fid="1004956" lims:id="1004956">
                <MarginalNote lims:inforce-start-date="2009-06-11" lims:fid="1004957" lims:id="1004957">Child support</MarginalNote>
                <Label>2</Label>
                <Text>Deduct any child support received that is included...</Text>
            </Section>
        </RegulationPiece>
        <HistoricalNote>
            <HistoricalNoteSubItem lims:inforce-start-date="2009-06-11" lims:fid="1004992" lims:id="1004992">SOR/97-563, ss. 12 to 14; SOR/2000-337</HistoricalNoteSubItem>
        </HistoricalNote>
    </Schedule>
    <RecentAmendments>
        <Amendment>
            <AmendmentCitation>SOR/2020-247</AmendmentCitation>
            <AmendmentDate>2024-02-01</AmendmentDate>
        </Amendment>
        <Amendment>
            <AmendmentCitation>SOR/2020-247</AmendmentCitation>
            <AmendmentDate>2021-03-01</AmendmentDate>
        </Amendment>
    </RecentAmendments>
</Regulation>
```
#### [Locally Engaged Staff Exclusion Approval Order (SI/2024-7)](https://laws-lois.justice.gc.ca/eng/regulations/SI-2024-7/)
```xml
<?xml version="1.0" encoding="utf-8"?>
<Regulation lims:pit-date="2024-02-02" lims:lastAmendedDate="2024-02-02" lims:current-date="2024-02-06" lims:inforce-start-date="2024-02-02" lims:enacted-date="2024-02-02" lims:fid="1441576" lims:id="1441576" gazette-part="II" regulation-type="SI" xml:lang="en" xmlns:lims="http://justice.gc.ca/lims">
    <Identification lims:inforce-start-date="2024-02-02" lims:enacted-date="2024-02-02" lims:fid="1441577" lims:id="1441577">
        <InstrumentNumber>SI/2024-7</InstrumentNumber>
        <RegistrationDate>
            <Date>
                <YYYY>2024</YYYY>
                <MM>2</MM>
                <DD>14</DD>
            </Date>
        </RegistrationDate>
        <ConsolidationDate>
            <Date>
                <YYYY>2024</YYYY>
                <MM>2</MM>
                <DD>7</DD>
            </Date>
        </ConsolidationDate>
        <EnablingAuthority lims:inforce-start-date="2024-02-02" lims:enacted-date="2024-02-02" lims:fid="1441578" lims:id="1441578">
            <XRefExternal reference-type="act" link="P-33.01">PUBLIC SERVICE EMPLOYMENT ACT</XRefExternal>
        </EnablingAuthority>
        <LongTitle lims:inforce-start-date="2024-02-02" lims:enacted-date="2024-02-02" lims:fid="1441579" lims:id="1441579">Locally Engaged Staff Exclusion Approval Order</LongTitle>
        <RegulationMakerOrder>
            <RegulationMaker>P.C.</RegulationMaker>
            <OrderNumber>2024-86</OrderNumber>
            <Date>
                <YYYY>2024</YYYY>
                <MM>2</MM>
                <DD>2</DD>
            </Date>
        </RegulationMakerOrder>
    </Identification>
    <Order lims:inforce-start-date="2024-02-02" lims:enacted-date="2024-02-02" lims:fid="1441580" lims:id="1441580">
        <Provision lims:inforce-start-date="2024-02-02" lims:enacted-date="2024-02-02" lims:fid="1441581" lims:id="1441581" format-ref="indent-0-0" language-align="yes" list-item="no">
            <Text>Her Excellency the Governor General in Council... <XRefExternal reference-type="act" link="P-33.01">Public Service Employment Act</XRefExternal>
                <FootnoteRef idref="fn_81000-2-4385_hq_28367">a</FootnoteRef>, approves
            </Text>
            <Footnote id="fn_81000-2-4385_hq_28367" placement="page" status="official">
                <Label>a</Label>
                <Text>S.C. 2003, c. 22, ss. 12 and 13</Text>
            </Footnote>
            <Provision lims:inforce-start-date="2024-02-02" lims:enacted-date="2024-02-02" lims:fid="1441582" lims:id="1441582" format-ref="indent-1-1" language-align="no" list-item="no">
                <Label>(a)</Label>
                <Text>the re-application by the Public Service Commission of the provisions of that Act to the positions...</Text>
            </Provision>
            <Provision lims:inforce-start-date="2024-02-02" lims:enacted-date="2024-02-02" lims:fid="1441583" lims:id="1441583" format-ref="indent-1-1" language-align="no" list-item="no">
                <Label>(b)</Label>
                <Text>the exclusion by the Public Service Commission from the application of the Act of a person...</Text>
            </Provision>
        </Provision>
        <Provision lims:inforce-start-date="2024-02-02" lims:enacted-date="2024-02-02" lims:fid="1441584" lims:id="1441584" format-ref="indent-0-0" language-align="yes" list-item="no">
            <Text>Whereas the Public Service Commission has decided...<XRefExternal reference-type="act" link="P-33.01">Public Service Employment Act</XRefExternal><FootnoteRef idref="fn_81000-2-4385_hq_28367">a</FootnoteRef>, that it is neither practicable nor in the best interests of the public...</Text>
        </Provision>
        <Provision lims:inforce-start-date="2024-02-02" lims:enacted-date="2024-02-02" lims:fid="1441585" lims:id="1441585" format-ref="indent-0-0" language-align="yes" list-item="no">
            <Text>And whereas, under subsection 20(2) of that Act, the Public Service Commission has consulted with the employer;</Text>
        </Provision>
        <Provision lims:inforce-start-date="2024-02-02" lims:enacted-date="2024-02-02" lims:fid="1441586" lims:id="1441586" format-ref="indent-0-0" language-align="yes" list-item="no">
            <Text>Therefore, the Public Service Commission, under subsections 20(1) and (3) of the <XRefExternal reference-type="act" link="P-33.01">Public Service Employment Act</XRefExternal><FootnoteRef idref="fn_81000-2-4385_hq_28367">a</FootnoteRef>,</Text>
            <Provision lims:inforce-start-date="2024-02-02" lims:enacted-date="2024-02-02" lims:fid="1441587" lims:id="1441587" format-ref="indent-1-1" language-align="no" list-item="no">
                <Label>(a)</Label>
                <Text>re-applies the provisions of that Act to the positions excluded under Order in Council P.C. 1967-444 of March 10, 1967 and to the persons occupying them; and</Text>
            </Provision>
            <Provision lims:inforce-start-date="2024-02-02" lims:enacted-date="2024-02-02" lims:fid="1441588" lims:id="1441588" format-ref="indent-1-1" language-align="no" list-item="no">
                <Label>(b)</Label>
                <Text>excludes from the application of that Act a person who is appointed and employed outside...</Text>
            </Provision>
        </Provision>
        <Provision lims:inforce-start-date="2024-02-02" lims:enacted-date="2024-02-02" lims:fid="1441589" lims:id="1441589" format-ref="indent-0-0" language-align="yes" list-item="no">
            <Text>Gatineau, November 21, 2023</Text>
        </Provision>
        <Provision lims:inforce-start-date="2024-02-02" lims:enacted-date="2024-02-02" lims:fid="1441590" lims:id="1441590" format-ref="indent-0-0" language-align="yes" list-item="no" topmarginspacing="12">
            <TableGroup lims:inforce-start-date="2024-02-02" lims:enacted-date="2024-02-02" lims:fid="1441591" lims:id="1441591" bilingual="yes" orientation="portrait" pointsize="11pt" rowbreak="no" spanlanguages="no" spanmarginalnotecol="no" topmarginspacing="50pt">
                <table lims:inforce-start-date="2024-02-02" lims:enacted-date="2024-02-02" lims:fid="1441592" lims:id="1441592" frame="none">...</table>
            </TableGroup>
        </Provision>
    </Order>
</Regulation>
```
---
# laws-lois-xml - (Français)
Des lois et règlements codifiés du Canada

Pour d'informations décrivant les éléments XML, visitez "[Dictionnaire des données](https://laws-lois.justice.gc.ca/fra/xml/index.html)".

## Structure des éléments
Ce qui suit présente des exemples de structure XML pour les lois et les règlements.

> [!NOTE]
> Le contenu XML affiché ici n'est que des exemples et ne doit pas être utilisé comme référence complète.
>
> Le XML complet et mis à jour doit être référencé dans le référentiel. Pour plus d’informations sur les lois, visitez le [Site Web de la législation (Justice)](https://laws-lois.justice.gc.ca/)

> [!WARNING]
> Dans les exemples présentés, si un "..." est vu. Cela signifiait que le contenu devait être coupé en raison de sa longueur ou de sa complexité.
> 
> Tous les tableaux ne sont pas affichés pour cette raison.

### Lois
Généralement, une loi aura la structure suivante:

#### [Loi sur l’accès à l’information (L.R.C. (1985), ch. A-1)](https://laws-lois.justice.gc.ca/fra/lois/A-1/index.html)
```xml
<?xml version="1.0" encoding="utf-8"?>
<Statute lims:pit-date="2024-01-22" hasPreviousVersion="true" lims:lastAmendedDate="2024-01-22" lims:current-date="2024-01-23" lims:inforce-start-date="2018-12-13" lims:fid="167" lims:id="167" bill-origin="commons" bill-type="govt-public" in-force="yes" xml:lang="fr" xmlns:lims="http://justice.gc.ca/lims">
    <Identification lims:inforce-start-date="2018-12-13" lims:fid="168" lims:id="168">
        <LongTitle lims:inforce-start-date="2019-06-21" lims:enacted-date="2019-06-21" lims:fid="169" lims:id="1157395">Loi visant à compléter la législation canadienne en matière d’accès à l’information relevant de l’administration fédérale et prévoyant la publication proactive de certains renseignements</LongTitle>
        <ShortTitle lims:inforce-start-date="2018-12-13" lims:fid="170" lims:id="170" status="official">Loi sur l’accès à l’information</ShortTitle>
        <RunningHead lims:inforce-start-date="2018-12-13" lims:fid="171" lims:id="171">Accès à l’information</RunningHead>
        <BillHistory lims:inforce-start-date="2018-12-13" lims:fid="172" lims:id="172">
            <Stages lims:inforce-start-date="2018-12-13" stage="consolidation">
                <Date>
                    <YYYY>2024</YYYY>
                    <MM>1</MM>
                    <DD>24</DD>
                </Date>
            </Stages>
        </BillHistory>
        <Chapter lims:inforce-start-date="2018-12-13" lims:fid="174" lims:id="174">
            <ConsolidatedNumber official="yes">A-1</ConsolidatedNumber>
        </Chapter>
    </Identification>
    <Body lims:inforce-start-date="2018-12-13" lims:fid="175" lims:id="175">
        <Heading lims:inforce-start-date="2018-12-13" lims:fid="176" lims:id="176" level="1">
            <TitleText>Titre abrégé</TitleText>
        </Heading>
        <Section lims:inforce-start-date="2005-10-05" lims:lastAmendedDate="2005-10-05" lims:fid="177" lims:id="177">
            <MarginalNote lims:inforce-start-date="2005-10-05" lims:fid="178" lims:id="178">Titre abrégé</MarginalNote>
            <Label>1</Label>
            <Text>
                <XRefExternal reference-type="act" link="A-1">Loi sur l’accès à l’information</XRefExternal>.
            </Text>
            <HistoricalNote>
                <HistoricalNoteSubItem lims:inforce-start-date="2005-10-05" lims:fid="180" lims:id="180">1980-81-82-83, ch. 111, ann. I « 1 »</HistoricalNoteSubItem>
            </HistoricalNote>
        </Section>
        <Heading lims:inforce-start-date="2018-12-13" lims:fid="181" lims:id="181" level="1">
            <TitleText>Objet de la loi</TitleText>
        </Heading>
        <Section lims:inforce-start-date="2019-06-21" lims:enacted-date="2019-06-21" lims:lastAmendedDate="2019-06-21" lims:fid="182" lims:id="1157396">
            <MarginalNote lims:inforce-start-date="2019-06-21" lims:enacted-date="2019-06-21" lims:fid="1157397" lims:id="1157397">Objet de la loi</MarginalNote>
            <Label>2</Label>
            <Subsection lims:inforce-start-date="2019-06-21" lims:enacted-date="2019-06-21" lims:fid="1157398" lims:id="1157398">
                <Label>(1)</Label>
                <Text>La présente loi a pour objet d’accroître la responsabilité et la transparence des institutions...</Text>
            </Subsection>
            <Subsection lims:inforce-start-date="2019-06-21" lims:enacted-date="2019-06-21" lims:fid="1157399" lims:id="1157399">
                <MarginalNote lims:inforce-start-date="2019-06-21" lims:enacted-date="2019-06-21" lims:fid="1157400" lims:id="1157400">Objets spécifiques : parties 1 et 2</MarginalNote>
                <Label>(2)</Label>
                <Text>À cet égard :</Text>
                <Paragraph lims:inforce-start-date="2019-06-21" lims:enacted-date="2019-06-21" lims:fid="1157401" lims:id="1157401">
                    <Label>a)</Label>
                    <Text>la partie 1 élargit l’accès aux documents de l’administration fédérale en consacrant...</Text>
                </Paragraph>
                <Paragraph lims:inforce-start-date="2019-06-21" lims:enacted-date="2019-06-21" lims:fid="1157402" lims:id="1157402">
                    <Label>b)</Label>
                    <Text>la partie 2 fixe des exigences visant la publication proactive de renseignements.</Text>
                </Paragraph>
            </Subsection>
            <HistoricalNote>
                <HistoricalNoteSubItem lims:inforce-start-date="2019-06-21" lims:enacted-date="2019-06-21" lims:fid="188" lims:id="1157405" lims:enactId="1136662" type="original">L.R. (1985), ch. A-1, art. 2</HistoricalNoteSubItem>
                <HistoricalNoteSubItem lims:inforce-start-date="2019-06-21" lims:enacted-date="2019-06-21" lims:fid="1157406" lims:id="1157406" lims:enactId="1136662">2019, ch. 18, art. 2</HistoricalNoteSubItem>
            </HistoricalNote>
        </Section>
    </body>
    <Schedule lims:inforce-start-date="2018-11-05" lims:lastAmendedDate="2024-01-22" lims:fid="1216" lims:id="1216" bilingual="no" spanlanguages="yes">
        <ScheduleFormHeading lims:inforce-start-date="2018-11-05" lims:fid="1217" lims:id="1217">
            <Label>ANNEXE II</Label>
            <OriginatingRef>(article 24)</OriginatingRef>
        </ScheduleFormHeading>
        <TableGroup lims:inforce-start-date="2018-11-05" lims:fid="1218" lims:id="1218" pointsize="9" topmarginspacing="10" rowbreak="no" bilingual="no" spanlanguages="no">
            <table lims:inforce-start-date="2018-11-05" lims:fid="1219" lims:id="1219" colsep="0" frame="topbot" rowsep="0">...
            </Table>
        </TableGroup>
        <HistoricalNote>
            <HistoricalNoteSubItem lims:inforce-start-date="2019-06-18" lims:enacted-date="2014-12-09" lims:fid="1132597" lims:id="1132614" lims:enactId="1023638">L.R. (1985), ch. A-1, ann. II; L.R. (1985), ch. 28 (1 <Sup>er</Sup> suppl.)</HistoricalNoteSubItem>
            <HistoricalNoteSubItem lims:inforce-start-date="2019-06-21" lims:enacted-date="2019-06-21" lims:fid="1157394" lims:id="1157394" lims:enactId="1136063">2019, ch. 14, art. 54</HistoricalNoteSubItem>
            <HistoricalNoteSubItem lims:inforce-start-date="2019-08-28" lims:enacted-date="2019-06-21" lims:fid="1184509" lims:id="1184509" lims:enactId="1144311">2019, ch. 28, art. 83</HistoricalNoteSubItem>
        </HistoricalNote>
    </Schedule>
    <RecentAmendments>
        <Amendment>
            <AmendmentCitation link="2023_29">2023, ch. 29</AmendmentCitation>
            <AmendmentDate>2024-01-22</AmendmentDate>
        </Amendment>
        <Amendment>
            <AmendmentCitation link="2023_22">2023, ch. 22</AmendmentCitation>
            <AmendmentDate>2023-09-01</AmendmentDate>
        </Amendment>
    </RecentAmendments>
</Statute>
```
### Règlements
Généralement, un règlement aura la structure suivante:

#### [Règlement sur les aliments et drogues (C.R.C., ch. 870))](https://laws-lois.justice.gc.ca/fra/reglements/C.R.C.%2C_ch._870/index.html)
```xml
<?xml version="1.0" encoding="utf-8"?>
<Regulation lims:pit-date="2023-11-24" hasPreviousVersion="true" lims:lastAmendedDate="2023-11-24" lims:current-date="2023-11-27" lims:inforce-start-date="2018-10-23" lims:fid="556370" lims:id="556370" regulation-type="SOR" xml:lang="fr" xmlns:lims="http://justice.gc.ca/lims">
    <Identification lims:inforce-start-date="2018-10-23" lims:fid="556371" lims:id="556371">
        <InstrumentNumber>C.R.C., ch. 870</InstrumentNumber>
        <ConsolidationDate lims:inforce-start-date="2018-10-23">
            <Date>
                <YYYY>2023</YYYY>
                <MM>11</MM>
                <DD>28</DD>
            </Date>
        </ConsolidationDate>
        <EnablingAuthority lims:inforce-start-date="2018-10-23" lims:fid="556373" lims:id="556373">
            <XRefExternal reference-type="act" link="F-27">LOI SUR LES ALIMENTS ET DROGUES</XRefExternal>
        </EnablingAuthority>
        <ShortTitle lims:inforce-start-date="2018-10-23" lims:fid="556374" lims:id="556374">Règlement sur les aliments et drogues</ShortTitle>
        <LongTitle lims:inforce-start-date="2018-10-23" lims:fid="556375" lims:id="556375">Règlement concernant les aliments et drogues</LongTitle>
    </Identification>
    <Body lims:inforce-start-date="2018-10-23" lims:fid="556376" lims:id="556376">
        <Heading lims:inforce-start-date="2018-10-23" lims:fid="556377" lims:id="556377" level="1">
            <Label>PARTIE A</Label>
            <TitleText>Administration</TitleText>
        </Heading>
        <Heading lims:inforce-start-date="2018-10-23" lims:fid="556378" lims:id="556378" level="2">
            <TitleText>Dispositions générales</TitleText>
        </Heading>
        <Section lims:inforce-start-date="2006-03-22" lims:lastAmendedDate="2006-03-22" lims:fid="556379" lims:id="556379">
            <Label>A.01.001</Label>
            <Text>Le présent règlement peut être cité sous le titre :
                <XRefExternal reference-type="regulation" link="C.R.C.,_ch._870">Règlement sur les aliments et drogues</XRefExternal>.
            </Text>
        </Section>
        <Section lims:inforce-start-date="2006-03-22" lims:lastAmendedDate="2006-03-22" lims:fid="556380" lims:id="556380">
            <Label>A.01.002</Label>
            <Text>Lorsqu’il y a lieu, les dispositions du présent règlement établissent les normes de composition...</Text>
        </Section>
        <Section lims:inforce-start-date="2006-03-22" lims:lastAmendedDate="2006-03-22" lims:fid="556381" lims:id="556381">
            <Label>A.01.003</Label>
            <Text>
                <Repealed>[Abrogé, DORS/94-289, art. 1]</Repealed>
            </Text>
        </Section>
        <Heading lims:inforce-start-date="2018-10-23" lims:fid="556382" lims:id="556382" level="2">
            <TitleText>Interprétation</TitleText>
        </Heading>
        <Section lims:inforce-start-date="2018-04-04" lims:lastAmendedDate="2022-09-27" lims:fid="556383" lims:id="556383">
            <Label>A.01.010</Label>
            <Text>Dans le présent règlement,</Text>
            <Definition lims:inforce-start-date="2018-04-04" lims:fid="556384" lims:id="556384">
                <Text><DefinedTermFr>centimètre cube</DefinedTermFr> ou son abréviation <DefinedTermFr>cc.</DefinedTermFr> sont censées interchangeables avec le mot <DefinitionRef>millilitre</DefinitionRef> et son abréviation <DefinitionRef>ml.</DefinitionRef>; (<DefinedTermEn>cubic centimetre</DefinedTermEn>)</Text>
            </Definition>
            <Definition lims:inforce-start-date="2022-09-27" lims:enacted-date="2022-09-27" lims:fid="556385" lims:id="1365785">
                <Text><DefinedTermFr>conjoint de fait</DefinedTermFr> S’entend au sens de l’article 2 du <XRefExternal reference-type="act" link="C-46">Code criminel</XRefExternal>; (<DefinedTermEn>common-law partner</DefinedTermEn>)</Text>
            </Definition>
            <HistoricalNote>
                <HistoricalNoteSubItem lims:inforce-start-date="2018-04-04" lims:fid="556400" lims:id="556400">DORS/84-300, art. 1(F); DORS/85-141, art. 1; DORS/89-455, art. 1; DORS/97-12, art. 1; DORS/2000-353</HistoricalNoteSubItem>
                <HistoricalNoteSubItem lims:inforce-start-date="2022-09-27" lims:enacted-date="2022-09-27" lims:fid="1365784" lims:id="1365784" lims:enactId="1364728">DORS/2022-197, art. 1</HistoricalNoteSubItem>
            </HistoricalNote>
        </Section>
        <Section lims:inforce-start-date="2018-04-04" lims:lastAmendedDate="2018-04-04" lims:fid="556401" lims:id="556401">
            <Label>A.01.011</Label>
            <Text>Le ministre doit, sur demande, fournir des exemplaires des méthodes officielles.</Text>
            <HistoricalNote>
                <HistoricalNoteSubItem lims:inforce-start-date="2018-04-04" lims:fid="556403" lims:id="556403">DORS/2018-69, art. 27</HistoricalNoteSubItem>
            </HistoricalNote>
        </Section>
        <Section lims:inforce-start-date="2018-04-04" lims:lastAmendedDate="2018-04-04" lims:fid="556404" lims:id="556404">
            <Label>A.01.012</Label>
            <Text>Le ministre doit, sur demande, indiquer si une méthode est acceptable ou non, lorsqu’on la lui présente en vue d’une décision.</Text>
            <HistoricalNote>
                <HistoricalNoteSubItem lims:inforce-start-date="2018-04-04" lims:fid="556406" lims:id="556406">DORS/2018-69, art. 27</HistoricalNoteSubItem>
            </HistoricalNote>
        </Section>
    </Body>
    <Schedule lims:inforce-start-date="2022-07-20" lims:enacted-date="2022-06-28" lims:lastAmendedDate="2022-07-20" lims:fid="1360697" lims:id="1360697">
        <ScheduleFormHeading lims:inforce-start-date="2022-07-20" lims:enacted-date="2022-06-28" lims:fid="1360698" lims:id="1360698">
            <Label>ANNEXE K.1</Label>
            <OriginatingRef>(paragraphes B.01.350(1), B.01.351(1) et (5))</OriginatingRef>
        </ScheduleFormHeading>
        <Heading lims:inforce-start-date="2022-07-20" lims:enacted-date="2022-06-28" lims:fid="1360699" lims:id="1360699" level="1">
            <TitleText>Symboles nutritionnels et modèles</TitleText>
        </Heading>
        <Heading lims:inforce-start-date="2022-07-20" lims:enacted-date="2022-06-28" lims:fid="1360700" lims:id="1360700" level="2">
            <TitleText>Modèle horizontal unilingue</TitleText>
        </Heading>
        <TableGroup lims:inforce-start-date="2022-07-20" lims:enacted-date="2022-06-28" lims:fid="1360701" lims:id="1360701" bilingual="no" pointsize="8" spanlanguages="no" topmarginspacing="10">
            <Table lims:inforce-start-date="2022-07-20" lims:enacted-date="2022-06-28" lims:fid="1360702" lims:id="1360702" frame="none">...</Table>
        </TableGroup>
    </Schedule>
    <RecentAmendments>
        <Amendment>
            <AmendmentCitation>DORS/2023-247</AmendmentCitation>
            <AmendmentDate>2023-11-24</AmendmentDate>
        </Amendment>
        <Amendment>
            <AmendmentCitation>DORS/2023-18</AmendmentCitation>
            <AmendmentDate>2023-02-15</AmendmentDate>
        </Amendment>
    </RecentAmendments>
</Regulation>
```
#### [Lignes directrices fédérales sur les pensions alimentaires pour enfants (DORS/97-175)](https://laws-lois.justice.gc.ca/fra/reglements/DORS-97-175/index.html)
```xml
<?xml version="1.0" encoding="utf-8"?>
<Regulation lims:pit-date="2024-02-01" hasPreviousVersion="true" lims:lastAmendedDate="2024-02-01" lims:current-date="2024-02-06" lims:inforce-start-date="2006-03-22" lims:fid="992366" lims:id="992366" regulation-type="SOR" xml:lang="fr" xmlns:lims="http://justice.gc.ca/lims">
    <Identification lims:inforce-start-date="2006-03-22" lims:fid="992367" lims:id="992367">
        <InstrumentNumber>DORS/97-175</InstrumentNumber>
        <RegistrationDate>
            <Date>
                <YYYY>1997</YYYY>
                <MM>4</MM>
                <DD>8</DD>
            </Date>
        </RegistrationDate>
        <ConsolidationDate lims:inforce-start-date="2006-03-22">
            <Date>
                <YYYY>2024</YYYY>
                <MM>2</MM>
                <DD>7</DD>
            </Date>
        </ConsolidationDate>
        <EnablingAuthority lims:inforce-start-date="2006-03-22" lims:fid="992369" lims:id="992369">
            <XRefExternal reference-type="act" link="D-3.4">LOI SUR LE DIVORCE</XRefExternal>
        </EnablingAuthority>
        <LongTitle lims:inforce-start-date="2006-03-22" lims:fid="992370" lims:id="992370">Lignes directrices fédérales sur les pensions alimentaires pour enfants</LongTitle>
        <RegulationMakerOrder>
            <RegulationMaker>C.P.</RegulationMaker>
            <OrderNumber>1997-469</OrderNumber>
            <Date>
                <YYYY>1997</YYYY>
                <MM>4</MM>
                <DD>8</DD>
            </Date>
        </RegulationMakerOrder>
    </Identification>
    <Order lims:inforce-start-date="2006-03-22" lims:fid="992371" lims:id="992371">
        <Provision lims:inforce-start-date="2006-03-22" lims:fid="992372" lims:id="992372" format-ref="indent-0-0" language-align="yes" list-item="no">
            <Text>Sur recommandation du ministre de la Justice et en vertu de l’article 26.1
                <FootnoteRef idref="footnotea_f">a</FootnoteRef> de la
                <XRefExternal reference-type="act" link="D-3.4">Loi sur le divorce</XRefExternal>
                <FootnoteRef idref="footnoteb_f">b</FootnoteRef>, Son Excellence le Gouverneur général en conseil établit les
                <XRefExternal reference-type="regulation" link="DORS-97-175">Lignes directrices fédérales sur les pensions alimentaires pour enfants</XRefExternal>, ci-après.
            </Text>
            <Footnote id="footnotea_f" placement="page" status="official">
                <Label>a</Label>
                <Text>L.C. 1997, ch. 1, art. 11</Text>
            </Footnote>
            <Footnote id="footnoteb_f" placement="page" status="official">
                <Label>b</Label>
                <Text>L.R., ch. 3 (2
                    <Sup>e</Sup> suppl.)
                </Text>
            </Footnote>
        </Provision>
    </Order>
    <Body lims:inforce-start-date="2006-03-22" lims:fid="992373" lims:id="992373">
        <Heading lims:inforce-start-date="2006-03-22" lims:fid="992374" lims:id="992374" level="1">
            <TitleText>Objectifs</TitleText>
        </Heading>
        <Section lims:inforce-start-date="2006-03-22" lims:lastAmendedDate="2006-03-22" lims:fid="992375" lims:id="992375">
            <MarginalNote lims:inforce-start-date="2006-03-22" lims:fid="992376" lims:id="992376">Objectifs</MarginalNote>
            <Label>1</Label>
            <Text>Les présentes lignes directrices visent à :</Text>
            <Paragraph lims:inforce-start-date="2006-03-22" lims:fid="992377" lims:id="992377">
                <Label>a)</Label>
                <Text>établir des normes équitables en matière de soutien alimentaire des enfants afin de leur...</Text>
            </Paragraph>
            <Paragraph lims:inforce-start-date="2006-03-22" lims:fid="992378" lims:id="992378">
                <Label>b)</Label>
                <Text>réduire les conflits et les tensions entre époux en rendant le calcul du montant des ordonnances alimentaires plus objectif;</Text>
            </Paragraph>
        </Section>
    </Body>
    <Schedule lims:inforce-start-date="2009-06-11" lims:lastAmendedDate="2009-06-11" lims:fid="993183" lims:id="993183" spanlanguages="no" bilingual="no">
        <ScheduleFormHeading lims:inforce-start-date="2009-06-11" lims:fid="993184" lims:id="993184">
            <Label>ANNEXE III</Label>
            <OriginatingRef>(article 16)</OriginatingRef>
            <TitleText>Rajustements du revenu</TitleText>
        </ScheduleFormHeading>
        <RegulationPiece lims:inforce-start-date="2009-06-11" lims:fid="993185" lims:id="993185">
            <Section lims:inforce-start-date="2009-06-11" lims:lastAmendedDate="2009-06-11" lims:fid="993186" lims:id="993186">
                <MarginalNote lims:inforce-start-date="2009-06-11" lims:fid="993187" lims:id="993187">Dépenses d’emploi</MarginalNote>
                <Label>1</Label>
                <Text>Dans le cas où l’époux est un employé... <XRefExternal reference-type="act" link="I-3.3">Loi de l’impôt sur le revenu</XRefExternal>:</Text>
                <Paragraph lims:inforce-start-date="2009-06-11" lims:fid="993188" lims:id="993188">
                    <Label>a)</Label>
                    <Text>
                        <Repealed>[Abrogé, DORS/2000-337, art. 8]</Repealed>
                    </Text>
                </Paragraph>
                <Paragraph lims:inforce-start-date="2009-06-11" lims:fid="993189" lims:id="993189">
                    <Label>b)</Label>
                    <Text>l’alinéa 8(1)d) concernant la cotisation à une caisse d’enseignants;</Text>
                </Paragraph>
            </Section>
            <Section lims:inforce-start-date="2009-06-11" lims:lastAmendedDate="2009-06-11" lims:fid="993202" lims:id="993202">
                <MarginalNote lims:inforce-start-date="2009-06-11" lims:fid="993203" lims:id="993203">Pension alimentaire pour enfants</MarginalNote>
                <Label>2</Label>
                <Text>Déduire tout montant de pension alimentaire pour enfants reçu qui est inclus...</Text>
            </Section>
        </RegulationPiece>
        <HistoricalNote>
            <HistoricalNoteSubItem lims:inforce-start-date="2009-06-11" lims:fid="993238" lims:id="993238">DORS/97-563, art. 12 à 14; DORS/2000-337</HistoricalNoteSubItem>
        </HistoricalNote>
    </Schedule>
    <RecentAmendments>
        <Amendment>
            <AmendmentCitation>DORS/2020-247</AmendmentCitation>
            <AmendmentDate>2024-02-01</AmendmentDate>
        </Amendment>
        <Amendment>
            <AmendmentCitation>DORS/2020-247</AmendmentCitation>
            <AmendmentDate>2021-03-01</AmendmentDate>
        </Amendment>
    </RecentAmendments>
</Regulation>
```
#### [Décret agréant l’exemption du personnel embauché sur place (TR/2024-7)](https://laws-lois.justice.gc.ca/fra/reglements/TR-2024-7/)
```xml
<?xml version="1.0" encoding="utf-8"?>
<Regulation lims:pit-date="2024-02-02" lims:lastAmendedDate="2024-02-02" lims:current-date="2024-02-06" lims:inforce-start-date="2024-02-02" lims:enacted-date="2024-02-02" lims:fid="1429904" lims:id="1429904" gazette-part="II" regulation-type="SI" xml:lang="fr" xmlns:lims="http://justice.gc.ca/lims">
    <Identification lims:inforce-start-date="2024-02-02" lims:enacted-date="2024-02-02" lims:fid="1429905" lims:id="1429905">
        <InstrumentNumber>TR/2024-7</InstrumentNumber>
        <RegistrationDate>
            <Date>
                <YYYY>2024</YYYY>
                <MM>2</MM>
                <DD>14</DD>
            </Date>
        </RegistrationDate>
        <ConsolidationDate>
            <Date>
                <YYYY>2024</YYYY>
                <MM>2</MM>
                <DD>7</DD>
            </Date>
        </ConsolidationDate>
        <EnablingAuthority lims:inforce-start-date="2024-02-02" lims:enacted-date="2024-02-02" lims:fid="1429906" lims:id="1429906">
            <XRefExternal reference-type="act" link="P-33.01">LOI SUR L’EMPLOI DANS LA FONCTION PUBLIQUE</XRefExternal>
        </EnablingAuthority>
        <LongTitle lims:inforce-start-date="2024-02-02" lims:enacted-date="2024-02-02" lims:fid="1429907" lims:id="1429907">Décret agréant l’exemption du personnel embauché sur place</LongTitle>
        <RegulationMakerOrder>
            <RegulationMaker>C.P.</RegulationMaker>
            <OrderNumber>2024-86</OrderNumber>
            <Date>
                <YYYY>2024</YYYY>
                <MM>2</MM>
                <DD>2</DD>
            </Date>
        </RegulationMakerOrder>
    </Identification>
    <Order lims:inforce-start-date="2024-02-02" lims:enacted-date="2024-02-02" lims:fid="1429908" lims:id="1429908">
        <Provision lims:inforce-start-date="2024-02-02" lims:enacted-date="2024-02-02" lims:fid="1429909" lims:id="1429909" format-ref="indent-0-0" language-align="yes" list-item="no">
            <Text>Sur recommandation du président du Conseil... <XRefExternal reference-type="act" link="P-33.01">Loi sur l’emploi dans la fonction publique</XRefExternal><FootnoteRef idref="nbp_81000-2-4385_hq_27276">a</FootnoteRef>, Son Excellence la Gouverneure générale en conseil agrée :</Text>
            <Footnote id="nbp_81000-2-4385_hq_27276" placement="page" status="official">
                <Label>a</Label>
                <Text>L.C. 2003, ch. 22, art. 12 et 13</Text>
            </Footnote>
            <Provision lims:inforce-start-date="2024-02-02" lims:enacted-date="2024-02-02" lims:fid="1429910" lims:id="1429910" format-ref="indent-1-1" language-align="no" list-item="no">
                <Label>a)</Label>
                <Text>l’annulation, par la Commission de la fonction publique, de l’exemption agréée par le décret C.P. 1967-444 du 10 mars 1967;</Text>
            </Provision>
            <Provision lims:inforce-start-date="2024-02-02" lims:enacted-date="2024-02-02" lims:fid="1429911" lims:id="1429911" format-ref="indent-1-1" language-align="no" list-item="no">
                <Label>b)</Label>
                <Text>l’exemption, par la Commission de la fonction publique, de l’application de cette loi à la personne...</Text>
            </Provision>
        </Provision>
        <Provision lims:inforce-start-date="2024-02-02" lims:enacted-date="2024-02-02" lims:fid="1429912" lims:id="1429912" format-ref="indent-0-0" language-align="yes" list-item="no">
            <Text>Attendu que la Commission de la fonction... <XRefExternal reference-type="act" link="P-33.01">Loi sur l’emploi dans la fonction publique</XRefExternal><FootnoteRef idref="nbp_81000-2-4385_hq_27276">a</FootnoteRef>, estime que l’application de...</Text>
        </Provision>
        <Provision lims:inforce-start-date="2024-02-02" lims:enacted-date="2024-02-02" lims:fid="1429913" lims:id="1429913" format-ref="indent-0-0" language-align="yes" list-item="no">
            <Text>Attendu que la Commission de la fonction publique a consulté l’employeur en application du paragraphe 20(2) de cette loi,</Text>
        </Provision>
        <Provision lims:inforce-start-date="2024-02-02" lims:enacted-date="2024-02-02" lims:fid="1429914" lims:id="1429914" format-ref="indent-0-0" language-align="yes" list-item="no">
            <Text>À ces causes, en vertu des paragraphes 20(1) et (3) de la  <XRefExternal reference-type="act" link="P-33.01">Loi sur l’emploi dans la fonction publique</XRefExternal><FootnoteRef idref="nbp_81000-2-4385_hq_27276">a</FootnoteRef>, la Commission de la fonction publique :</Text>
            <Provision lims:inforce-start-date="2024-02-02" lims:enacted-date="2024-02-02" lims:fid="1429915" lims:id="1429915" format-ref="indent-1-1" language-align="no" list-item="no">
                <Label>a)</Label>
                <Text>annule l’exemption agréée par le décret C.P. 1967-444 du 10 mars 1967;</Text>
            </Provision>
            <Provision lims:inforce-start-date="2024-02-02" lims:enacted-date="2024-02-02" lims:fid="1429916" lims:id="1429916" format-ref="indent-1-1" language-align="no" list-item="no">
                <Label>b)</Label>
                <Text>exempte de l’application de cette loi la personne nommée et employée à l’extérieur du Canada...</Text>
            </Provision>
        </Provision>
        <Provision lims:inforce-start-date="2024-02-02" lims:enacted-date="2024-02-02" lims:fid="1429917" lims:id="1429917" format-ref="indent-0-0" language-align="yes" list-item="no">
            <Text>Gatineau, le 21 novembre 2023</Text>
        </Provision>
        <Provision lims:inforce-start-date="2024-02-02" lims:enacted-date="2024-02-02" lims:fid="1429918" lims:id="1429918" format-ref="indent-0-0" language-align="yes" list-item="no" topmarginspacing="12">
            <TableGroup lims:inforce-start-date="2024-02-02" lims:enacted-date="2024-02-02" lims:fid="1429919" lims:id="1429919" bilingual="yes" orientation="portrait" pointsize="11pt" rowbreak="no" spanlanguages="no" spanmarginalnotecol="no" topmarginspacing="50pt">
                <table lims:inforce-start-date="2024-02-02" lims:enacted-date="2024-02-02" lims:fid="1429920" lims:id="1429920" frame="none">...</table>
            </TableGroup>
        </Provision>
    </Order>
</Regulation>
```
