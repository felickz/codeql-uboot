import cpp

from MacroInvocation macroInvocation
where macroInvocation.getMacroName() in ["ntohs", "ntohl", "ntohll"]
select macroInvocation