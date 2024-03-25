# Lookup XML - [Aller en français](https://github.com/justicecanada/laws-lois-xml/tree/main/lookup#lookup-xml---fran%C3%A7ais)
The Lookup XML files are used for referencing the metadata of all the laws.

> [!IMPORTANT]
> The **lookupfull.xml** includes repealed laws.

## Tagging
The statutes are contained within the ```<Statutes>...</Statutes>``` tags and the regulations are within the ```<Regulations>...</Regulations>``` tags.

Each law has it's own unique ID which is located on the statute and regulation tag:

```<Statute id="167e">...</Statute>```
```<Regulation id="567721e" olid="556370f">...</Regulation>```
> [!NOTE]
> **olid** means "Other Language ID"

## Relationships
For some statutes, there are related regulations that are tagged as ```<Relationships>...</Relationships>```.

These relationships are the regulations made under the act and are referenced through the **rid**. This id will match the id of the regulations within the lookup XML document.
> [!NOTE]
> **rid** means "Regulation ID"

```XML
<Relationships>
  <Relationship rid="638933e" />
  <Relationship rid="638953e" />
  <Relationship rid="878430e" />
  <Relationship rid="896956e" />
  <Relationship rid="918831e" />
</Relationships>
```
## Lookup XML Example
```XML
<?xml version="1.0" encoding="utf-8"?>
<Database>
    <Statutes>
        <Statute id="167e">
            <ChapterNumber>A-1</ChapterNumber>
            <OfficialNumber>A-1</OfficialNumber>
            <Language>en</Language>
            <ShortTitle>Access to Information Act</ShortTitle>
            <ReversedShortTitle>Access to Information Act</ReversedShortTitle>
            <LastConsolidationDate>20240307</LastConsolidationDate>
            <ConsolidateFlag>True</ConsolidateFlag>
            <Relationships>
                <Relationship rid="638933e" />
                <Relationship rid="638953e" />
                <Relationship rid="878430e" />
                <Relationship rid="896956e" />
                <Relationship rid="918831e" />
            </Relationships>
        </Statute>
        <Statute id="167f">
            <ChapterNumber>A-1</ChapterNumber>
            <OfficialNumber>A-1</OfficialNumber>
            <Language>fr</Language>
            <ShortTitle>Loi sur l’accès à l’information</ShortTitle>
            <ReversedShortTitle>Accès à l’information, Loi sur l’</ReversedShortTitle>
            <LastConsolidationDate>20240307</LastConsolidationDate>
            <ConsolidateFlag>True</ConsolidateFlag>
            <Relationships>
                <Relationship rid="627530f" />
                <Relationship rid="627550f" />
                <Relationship rid="866777f" />
                <Relationship rid="885277f" />
                <Relationship rid="907152f" />
            </Relationships>
        </Statute>
    </Statutes>
    <Regulations>
        <Regulation id="567721e" olid="556370f">
            <AlphaNumber>C.R.C., c. 870</AlphaNumber>
            <Language>en</Language>
            <ShortTitle>Food and Drug Regulations</ShortTitle>
            <ReversedShortTitle>Food and Drug Regulations</ReversedShortTitle>
            <LastConsolidationDate>20240307</LastConsolidationDate>
            <ConsolidateFlag>True</ConsolidateFlag>
        </Regulation>
        <Regulation id="556370f" olid="567721e">
            <AlphaNumber>C.R.C., ch. 870</AlphaNumber>
            <Language>fr</Language>
            <ShortTitle>Règlement sur les aliments et drogues</ShortTitle>
            <ReversedShortTitle>Aliments et drogues, Règlement sur les</ReversedShortTitle>
            <LastConsolidationDate>20240307</LastConsolidationDate>
            <ConsolidateFlag>True</ConsolidateFlag>
        </Regulation>
        <Regulation id="1004143e" olid="992366f">
            <AlphaNumber>SOR/97-175</AlphaNumber>
            <Language>en</Language>
            <ShortTitle>Federal Child Support Guidelines</ShortTitle>
            <ReversedShortTitle>Federal Child Support Guidelines</ReversedShortTitle>
            <LastConsolidationDate>20240307</LastConsolidationDate>
            <ConsolidateFlag>True</ConsolidateFlag>
        </Regulation>
        <Regulation id="992366f" olid="1004143e">
            <AlphaNumber>DORS/97-175</AlphaNumber>
            <Language>fr</Language>
            <ShortTitle>Lignes directrices fédérales sur les pensions alimentaires pour enfants</ShortTitle>
            <ReversedShortTitle>Lignes directrices fédérales sur les pensions alimentaires pour enfants</ReversedShortTitle>
            <LastConsolidationDate>20240307</LastConsolidationDate>
            <ConsolidateFlag>True</ConsolidateFlag>
        </Regulation>
        <Regulation id="1441576e" olid="1429904f">
            <AlphaNumber>SI/2024-7</AlphaNumber>
            <Language>en</Language>
            <ShortTitle>Locally Engaged Staff Exclusion Approval Order</ShortTitle>
            <ReversedShortTitle>Locally Engaged Staff Exclusion Approval Order</ReversedShortTitle>
            <LastConsolidationDate>20240307</LastConsolidationDate>
            <ConsolidateFlag>True</ConsolidateFlag>
        </Regulation>
        <Regulation id="1429904f" olid="1441576e">
            <AlphaNumber>TR/2024-7</AlphaNumber>
            <Language>fr</Language>
            <ShortTitle>Décret agréant l’exemption du personnel embauché sur place</ShortTitle>
            <ReversedShortTitle>Exemption du personnel embauché sur place, Décret agréant l’</ReversedShortTitle>
            <LastConsolidationDate>20240307</LastConsolidationDate>
            <ConsolidateFlag>True</ConsolidateFlag>
        </Regulation>
    </Regulations>
</Database>
```
---

# Lookup XML - Français
Les fichiers XML Lookup sont utilisés pour référencer les métadonnées de toutes les lois.

> [!IMPORTANT]
> Le **lookupfull.xml** inclut les lois abrogées.

## Tagging
Les lois sont contenues dans les balises ```<Statutes>...</Statutes>``` et les règlements sont contenus dans les balises ```<Regulations>...</Regulations>```.

Chaque loi possède son propre identifiant unique qui se trouve sur l'étiquette de la loi et du règlement :

```<Statute id="167e">...</Statute>```
```<Regulation id="567721e" olid="556370f">...</Regulation>```
> [!NOTE]
> **olid** signifie "Other Language ID"

## Des relations
Pour certaines lois, il existe des réglementations associées qui sont étiquetées comme ```<Relationships>...</Relationships>```.

Ces relations sont les règlements pris en vertu de la loi et sont référencées via le **rid**. Cet identifiant correspondra à l'identifiant de la réglementation dans le document XML de recherche.
> [!NOTE]
> **rid** signifie "Regulation ID"

```XML
<Relationships>
  <Relationship rid="638933e" />
  <Relationship rid="638953e" />
  <Relationship rid="878430e" />
  <Relationship rid="896956e" />
  <Relationship rid="918831e" />
</Relationships>
```
## Exemple de Lookup XML
```XML
<?xml version="1.0" encoding="utf-8"?>
<Database>
    <Statutes>
        <Statute id="167e">
            <ChapterNumber>A-1</ChapterNumber>
            <OfficialNumber>A-1</OfficialNumber>
            <Language>en</Language>
            <ShortTitle>Access to Information Act</ShortTitle>
            <ReversedShortTitle>Access to Information Act</ReversedShortTitle>
            <LastConsolidationDate>20240307</LastConsolidationDate>
            <ConsolidateFlag>True</ConsolidateFlag>
            <Relationships>
                <Relationship rid="638933e" />
                <Relationship rid="638953e" />
                <Relationship rid="878430e" />
                <Relationship rid="896956e" />
                <Relationship rid="918831e" />
            </Relationships>
        </Statute>
        <Statute id="167f">
            <ChapterNumber>A-1</ChapterNumber>
            <OfficialNumber>A-1</OfficialNumber>
            <Language>fr</Language>
            <ShortTitle>Loi sur l’accès à l’information</ShortTitle>
            <ReversedShortTitle>Accès à l’information, Loi sur l’</ReversedShortTitle>
            <LastConsolidationDate>20240307</LastConsolidationDate>
            <ConsolidateFlag>True</ConsolidateFlag>
            <Relationships>
                <Relationship rid="627530f" />
                <Relationship rid="627550f" />
                <Relationship rid="866777f" />
                <Relationship rid="885277f" />
                <Relationship rid="907152f" />
            </Relationships>
        </Statute>
    </Statutes>
    <Regulations>
        <Regulation id="567721e" olid="556370f">
            <AlphaNumber>C.R.C., c. 870</AlphaNumber>
            <Language>en</Language>
            <ShortTitle>Food and Drug Regulations</ShortTitle>
            <ReversedShortTitle>Food and Drug Regulations</ReversedShortTitle>
            <LastConsolidationDate>20240307</LastConsolidationDate>
            <ConsolidateFlag>True</ConsolidateFlag>
        </Regulation>
        <Regulation id="556370f" olid="567721e">
            <AlphaNumber>C.R.C., ch. 870</AlphaNumber>
            <Language>fr</Language>
            <ShortTitle>Règlement sur les aliments et drogues</ShortTitle>
            <ReversedShortTitle>Aliments et drogues, Règlement sur les</ReversedShortTitle>
            <LastConsolidationDate>20240307</LastConsolidationDate>
            <ConsolidateFlag>True</ConsolidateFlag>
        </Regulation>
        <Regulation id="1004143e" olid="992366f">
            <AlphaNumber>SOR/97-175</AlphaNumber>
            <Language>en</Language>
            <ShortTitle>Federal Child Support Guidelines</ShortTitle>
            <ReversedShortTitle>Federal Child Support Guidelines</ReversedShortTitle>
            <LastConsolidationDate>20240307</LastConsolidationDate>
            <ConsolidateFlag>True</ConsolidateFlag>
        </Regulation>
        <Regulation id="992366f" olid="1004143e">
            <AlphaNumber>DORS/97-175</AlphaNumber>
            <Language>fr</Language>
            <ShortTitle>Lignes directrices fédérales sur les pensions alimentaires pour enfants</ShortTitle>
            <ReversedShortTitle>Lignes directrices fédérales sur les pensions alimentaires pour enfants</ReversedShortTitle>
            <LastConsolidationDate>20240307</LastConsolidationDate>
            <ConsolidateFlag>True</ConsolidateFlag>
        </Regulation>
        <Regulation id="1441576e" olid="1429904f">
            <AlphaNumber>SI/2024-7</AlphaNumber>
            <Language>en</Language>
            <ShortTitle>Locally Engaged Staff Exclusion Approval Order</ShortTitle>
            <ReversedShortTitle>Locally Engaged Staff Exclusion Approval Order</ReversedShortTitle>
            <LastConsolidationDate>20240307</LastConsolidationDate>
            <ConsolidateFlag>True</ConsolidateFlag>
        </Regulation>
        <Regulation id="1429904f" olid="1441576e">
            <AlphaNumber>TR/2024-7</AlphaNumber>
            <Language>fr</Language>
            <ShortTitle>Décret agréant l’exemption du personnel embauché sur place</ShortTitle>
            <ReversedShortTitle>Exemption du personnel embauché sur place, Décret agréant l’</ReversedShortTitle>
            <LastConsolidationDate>20240307</LastConsolidationDate>
            <ConsolidateFlag>True</ConsolidateFlag>
        </Regulation>
    </Regulations>
</Database>
```
