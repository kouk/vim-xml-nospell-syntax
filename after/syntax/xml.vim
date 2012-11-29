" override default xml syntax file to disable spell checking in the values of certain attributes, including:
"    xlink:href
"    xlink:role
"    xmlns:*
"    xmlid
"    linkend
"    class
"    type
"    fileref

syn region xmlStringNoSpell contained start=+"+ end=+"+ contains=xmlEntity,@NoSpell display
syn region xmlStringNoSpell contained start=+'+ end=+'+ contains=xmlEntity,@NoSpell display
syn match xmlXlinkNoSpell +\(xlink:\)\?\(href\|role\)="[^"]*"+ contained contains=xmlAttrib,xmlEqual,xmlStringNoSpell
syn match xmlXmlnsNoSpell +xmlns\(:[a-z]*\)\?="[^"]*"+ contained contains=xmlAttrib,xmlEqual,xmlStringNoSpell
syn match xmlXmlIdNoSpell +\(xml:id\|linkend\)="[^"]*"+ contained contains=xmlAttrib,xmlEqual,xmlStringNoSpell
syn match xmlAttribNoSpell +\(class\|type\)="[^"]*"+ contained contains=xmlAttrib,xmlEqual,xmlStringNoSpell
syn match dbFilerefNoSpell +fileref="[^"]*"+ contained contains=xmlAttrib,xmlEqual,xmlStringNoSpell
syn cluster xmlStartTagHook add=xmlXlinkNoSpell
syn cluster xmlStartTagHook add=xmlXmlnsNoSpell
syn cluster xmlStartTagHook add=xmlXmlIdNoSpell
syn cluster xmlStartTagHook add=xmlAttribNoSpell
syn cluster xmlStartTagHook add=dbFilerefNoSpell
hi def link xmlStringNoSpell		String
syn spell toplevel
