Use the LIMS2HTML.xsl transform to convert the files in this repository to html.  The transform is a modified version of the one used to create the html used for the laws-lois.justice.gc.ca website.

If you are running the xslt file in a .net environment you will have to replace the few spots in the code where exslt:node-set is used, and use msxsl:node-set instead. 
