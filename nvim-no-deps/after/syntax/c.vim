" highlight . and -> for access & dereferencing readability
syn match cMemberAccess "\.\|->" nextgroup=cStructMember,cppTemplateKeyword
hi def link cMemberAccess Boolean
