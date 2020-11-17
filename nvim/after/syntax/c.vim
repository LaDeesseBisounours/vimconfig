syn match cMemberAccess "\.\|->" nextgroup=cStructMember,cppTemplateKeyword
hi def link cMemberAccess Boolean
